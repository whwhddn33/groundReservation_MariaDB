package com.koreait.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardBean;
import com.koreait.app.boardDAO.BoardDAO;

public class AdminWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		
		String name = request.getParameter("name");
		
		System.out.println("name : " + name);
		
		BoardBean board = new BoardBean();
		
		board.setBoardname(name);
		
		boolean writeChk = bdao.BoardInsert(board);
		
		if(writeChk == false) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/admin/board.bo?res=false");
			return forward;
		}
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/admin/board.bo");
		return forward;
	}
}
