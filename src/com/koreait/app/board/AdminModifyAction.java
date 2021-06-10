package com.koreait.app.board;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("modinum"));
		String name = request.getParameter("modiname");
		PrintWriter out = response.getWriter();
		BoardDAO bdao = new BoardDAO();
		bdao.BoardModify(num,name);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/admin/board.bo");
		return forward;
	}
}
