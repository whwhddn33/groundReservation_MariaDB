package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		BoardDAO bdao = new BoardDAO();
		request.setAttribute("BoardList", bdao.getAllList());
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/admin_boardlist.jsp");
		return forward;
	}
}
