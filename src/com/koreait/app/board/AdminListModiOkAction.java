package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminListModiOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int listnum = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", listnum);
		
		BoardDAO bdao = new BoardDAO();
		bdao.ListModify(title,content,listnum);
		
		ActionForward forward = new ActionForward();
		forward.setPath(request.getContextPath()+"/admin/boardlist.bo");
		forward.setRedirect(false);
		return forward;
	}
}
