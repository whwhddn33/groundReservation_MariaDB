package com.koreait.app.futsal;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.GroundInfoBean;

public class registlistpageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		FutsalDAO fdao = new FutsalDAO();
		ActionForward forward= new ActionForward();
		
		System.out.println("페이지이동액션실행");
		String epuserid = request.getParameter("epuserid");
		System.out.println("epuserid : " + epuserid);
//		String epuserid = "whwhddn";
		
		List<GroundInfoBean> loadlist = fdao.getregistlist(epuserid);
		System.out.println(loadlist);
		for (GroundInfoBean i : loadlist) {
			System.out.print(i.getGroundnum()+" , ");
			System.out.print(i.getEpuserid()+" , ");
			System.out.print(i.getGroundarea()+" , ");
			System.out.print(i.getGroundname()+" , ");
			System.out.print(i.getHashTag()+" , ");
			System.out.print(i.getUseraddr()+" , ");
			System.out.print(i.getWeekDayBasicFee()+" , ");
			System.out.println(i.getWeekEndBasicFee());
		}
		
		request.setAttribute("loadlist", loadlist);
		forward.setRedirect(false);
		forward.setPath("/app/futsal/registlist.jsp");
		return forward;
	}

}
