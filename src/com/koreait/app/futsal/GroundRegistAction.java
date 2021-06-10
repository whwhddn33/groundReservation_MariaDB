package com.koreait.app.futsal;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.FileBean;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.GroundInfoBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GroundRegistAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String contextPath = request.getContextPath();
		ActionForward forward= new ActionForward();

		GroundInfoBean ginfobean = new GroundInfoBean();
		FutsalDAO fdao = new FutsalDAO();

		//모든 파라미터 출력
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name)); 
		}

		String folder = request.getServletContext().getRealPath("app/futsal/img");
		int size = 1024 * 1024 * 300;
		MultipartRequest multi = new MultipartRequest(request, folder,size,"UTF-8",new DefaultFileRenamePolicy());
		
		String imgname = multi.getFilesystemName("file");
		String imgrealname = multi.getOriginalFileName("file");
		
		String groundname = multi.getParameter("groundname");
		String epuserid = multi.getParameter("epuserid");
		String hashTag = multi.getParameter("hashTag");
		String useraddr = multi.getParameter("useraddr");
		String useraddrdetail = multi.getParameter("useraddrdetail");
		String useraddretc = multi.getParameter("useraddretc");
		String userpostcode = multi.getParameter("userpostcode");
		String weekDayBasicFee = multi.getParameter("weekDayBasicFee");
		String weekEndBasicFee = multi.getParameter("weekEndBasicFee");
		String groundarea = multi.getParameter("groundarea1")+"*"+multi.getParameter("groundarea2");

		String weekDaystarttime = multi.getParameter("weekDaystarttime");
		String weekDayendtime = multi.getParameter("weekDayendtime");
		String weekDayHotTimeFee = multi.getParameter("weekDayHotTimeFee");

		String weekEndstarttime = multi.getParameter("weekEndstarttime");
		String weekEndEndtime = multi.getParameter("weekEndEndtime");
		String weekEndHotTimeFee = multi.getParameter("weekEndHotTimeFee");

		ginfobean.setEpuserid(epuserid);
		ginfobean.setGroundname(groundname);
		ginfobean.setGroundarea(groundarea);
		ginfobean.setUserpostcode(userpostcode);
		ginfobean.setUseraddr(useraddr);
		ginfobean.setUseraddrdetail(useraddrdetail);
		ginfobean.setUseraddretc(useraddretc);
		ginfobean.setHashTag(hashTag);
		ginfobean.setWeekDayBasicFee(weekDayBasicFee);
		ginfobean.setWeekEndBasicFee(weekEndBasicFee);
		
		if(imgname != null && imgname != "") {
			ginfobean.setImgname(imgname);
			ginfobean.setImgrealname(imgrealname);
		}else {
			ginfobean.setImgname("");
			ginfobean.setImgrealname("");
		}
		
		HashMap<String, String> weekDayHotTimeMap = new HashMap<>();
		weekDayHotTimeMap.put("weekDayHotTimeFee", weekDayHotTimeFee);
		weekDayHotTimeMap.put("weekDaystarttime", weekDaystarttime);
		weekDayHotTimeMap.put("weekDayEndtime", weekDayendtime);

		HashMap<String, String> weekEndHotTimeMap = new HashMap<>();
		weekEndHotTimeMap.put("weekEndHotTimeFee", weekEndHotTimeFee);
		weekEndHotTimeMap.put("weekEndstarttime", weekEndstarttime);
		weekEndHotTimeMap.put("weekEndEndtime", weekEndEndtime);

		System.out.println("-----------------------------------");
		System.out.println("weekdayhottimemap : " + weekDayHotTimeMap.get("weekDaystarttime"));
		System.out.println("평일가격시작시간 : "+weekDayHotTimeMap.get("weekDaystarttime"));
		System.out.println("주말가격시작시간 : "+weekEndHotTimeMap.get("weekEndstarttime"));
		System.out.println("-----------------------------------");

		if(fdao.insertgroundinfo(ginfobean)==1) {
			//평일핫타임입력
			if(!(weekDayHotTimeMap.get("weekDaystarttime").equals("0"))) {
				System.out.println("평일가격시작시간 : "+weekEndHotTimeMap.get("weekEndstarttime"));
				int stnum = Integer.parseInt(weekDaystarttime);
				int endnum = Integer.parseInt(weekDayendtime);
				System.out.println("평일 입력 / if stnum : " + stnum);
				System.out.println("평일 입력 / if endnum : " + endnum);
				for (int i = stnum; i < endnum; i++) {
					weekDayHotTimeMap.put("weekDaytime", Integer.toString(i));
					if (weekDayHotTimeMap.get("lastid")==null) {
						weekDayHotTimeMap.put("lastid", Integer.toString(fdao.returnSeq()));
						System.out.println("lastid");
						System.out.println(weekDayHotTimeMap.get("lastid"));
					}
					fdao.insertWeekDayHotTime(weekDayHotTimeMap);
				}
			}
			//주말핫타임입력
			if(!weekEndHotTimeMap.get("weekEndstarttime").equals("0")) {
				System.out.println("주말가격시작시간 : "+weekEndHotTimeMap.get("weekEndstarttime"));
				int stnum = Integer.parseInt(weekEndstarttime);
				int endnum = Integer.parseInt(weekEndEndtime);
				weekEndHotTimeMap.put("lastid", weekDayHotTimeMap.get("lastid"));
				for (int i = stnum; i < endnum; i++) {
					weekEndHotTimeMap.put("weekEndtime", Integer.toString(i));
					fdao.insertWeekEndHotTime(weekEndHotTimeMap);
				}
			}

			forward.setPath(contextPath+"/futsalFrontController/registlistpage.fu?epuserid="+epuserid);
			forward.setRedirect(true);
			return forward;
		}



		forward.setPath(contextPath+"/futsalFrontController/registlistpage.fu?epuserid="+epuserid);
		forward.setRedirect(true);
		return forward;
	}

}
