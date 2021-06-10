package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminBoardAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BoardDAO bdao = new BoardDAO();
		request.setAttribute("BoardList", bdao.getList());
		bdao.getList();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/admin_board.jsp");
		
		return forward;
	}
}
