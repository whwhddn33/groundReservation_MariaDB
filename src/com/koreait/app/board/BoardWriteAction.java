package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;

public class BoardWriteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		System.out.println("BoardWriteAction");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		request.setAttribute("num", request.getParameter("num"));
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/write.jsp");
		
		return forward;
	}
}
