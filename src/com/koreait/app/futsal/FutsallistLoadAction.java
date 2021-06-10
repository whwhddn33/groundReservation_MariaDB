package com.koreait.app.futsal;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.GroundInfoBean;

public class FutsallistLoadAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		FutsalDAO fdao = new FutsalDAO();
		
		String String_tryCount = request.getParameter("tryCount");
		String selectDate = request.getParameter("selectDate");
		System.out.println(selectDate);
		int tryCount = Integer.parseInt(String_tryCount);
		System.out.println(tryCount);
		
		List<GroundInfoBean> loadlist = fdao.getgroundlist(tryCount);
		System.out.println(loadlist);
		HashMap<String, String> check = new HashMap<>();
		check.put("date", selectDate);
		Iterator<GroundInfoBean> loadIter = loadlist.iterator();
		
		while(loadIter.hasNext()){
			GroundInfoBean s = loadIter.next();
			check.put("groundnum", s.getGroundnum());
			if(fdao.statusCheck(check) == 12) {
				System.out.println(s.getGroundname()+"리스트에서 삭제");
				loadIter.remove();
			}
		}
		
/*		java.util.concurrentmodificationexception 오류 발생 ( 포문으로 list 삭제시 )
 * 
 * 		for (GroundInfoBean i : loadlist) {
			System.out.println("빈시간 체크");
			if(fdao.statusCheck(check) ==12) {
				System.out.println(i.getGroundname()+"리스트에서 삭제");
				loadlist.remove(i);
			}
			check.clear();
		}
*/
		

		String objectToReturn = "{\"date\": \""+selectDate+"\"}";
		
		Gson g = new Gson();
		String json = g.toJson(loadlist);
		System.out.println(json);
		PrintWriter out = response.getWriter();
		
		out.println("{\"date\":"+objectToReturn+",\"json\" : "+json+"}");
		return null;
	}
}
/* 오류발생, 원인 : sql프로세스숫자가 많은 select를 처리못해서 발생한다고함.
 * https://sidekick.tistory.com/170
 * 
 * ### Error querying database.  Cause: java.sql.SQLException: Listener refused the connection with the following error:
 * ORA-12519, TNS:no appropriate service handler found
*/