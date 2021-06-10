package com.koreait.app.board;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;
import com.koreait.app.boardDAO.FileBean;
import com.koreait.app.boardDAO.FileDAO;
import com.koreait.app.boardDAO.ListBean;

public class BoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("");
		System.out.println("======================파라미터 출력========================");
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name)); 
		}
		System.out.println("======================================================");
		System.out.println("");

		int boardnum = Integer.parseInt(request.getParameter("boardnum"));//게시판 번호
		int num = Integer.parseInt(request.getParameter("num"));//게시글 번호
		BoardDAO bdao = new BoardDAO();
		FileDAO fdao = new FileDAO();
		ListBean lists = bdao.getBoardList(num);
		
		
		FileBean file = fdao.getListInFile(num,boardnum);
		
		bdao.sumReadCnt(num);
		
		request.setAttribute("board", lists);
		request.setAttribute("file", file);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/view.jsp");
		return forward;
	}
}
