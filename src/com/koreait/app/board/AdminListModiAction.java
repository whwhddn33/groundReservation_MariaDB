package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminListModiAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int listnum = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", listnum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/app/board/admin_boardmodi.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
