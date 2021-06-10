package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		bdao.BoardDelete(num);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/admin/board.bo");
		return forward;
	}
}
