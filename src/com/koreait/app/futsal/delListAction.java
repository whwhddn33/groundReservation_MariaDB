package com.koreait.app.futsal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;

public class delListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		String contextPath = request.getContextPath();
		String listNum = request.getParameter("listnum");
		String epuserid = request.getParameter("epuserid");
		System.out.println("listnum : " + listNum);
		FutsalDAO fdao = new FutsalDAO();
		fdao.delhottime(listNum);
		fdao.delList(listNum);
		System.out.println("??");
		
		forward.setRedirect(false);
		forward.setPath("/futsalFrontController/registlistpage.fu?epuserid="+epuserid);
		return forward;
	}

}
