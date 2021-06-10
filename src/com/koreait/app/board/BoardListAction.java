package com.koreait.app.board;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

public class BoardListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("num");
		String tmp = request.getParameter("page");
		System.out.println("category : "+ category);
		BoardDAO bdao = new BoardDAO();
		
		int page = (tmp == null) ? 1 : Integer.parseInt(tmp);  
		int pagesize = 10;
		int totalCnt = bdao.getBoardCnt(Integer.parseInt(category));
		int endRow = page * 10;
		int startRow = endRow - 9;
		int startPage = ((page-1) / pagesize ) * 9 + 1;
		int endPage = startPage + (pagesize-1);
		int totalPage = (totalCnt - 1) / pagesize + 1;
		endPage = endPage > totalPage ? totalPage : endPage;
		
		System.out.println("");
		System.out.println("============변수출력=================");
		System.out.println("page");
		System.out.println(page);
		System.out.println("pagesize");
		System.out.println(pagesize);
		System.out.println("totalCnt");
		System.out.println(totalCnt);
		System.out.println("endRow");
		System.out.println(endRow);
		System.out.println("startRow");
		System.out.println(startRow);
		System.out.println("startPage");
		System.out.println(startPage);
		System.out.println("endPage");
		System.out.println(endPage);
		System.out.println("totalPage");
		System.out.println(totalPage);
		//모든파라미터 출력
		System.out.println("");
		System.out.println("======================파라미터 출력========================");
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name)); 
		}
		System.out.println("======================================================");
		System.out.println("");
		
		
		request.setAttribute("category", category);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("page", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("BoardList", bdao.getBoardList(startRow,endRow,category));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(category.equals("1")) {
			forward.setPath("/app/board/review.jsp");
		}else if(category.equals("2")) {
			forward.setPath("/app/board/qna.jsp");
		}else if(category.equals("3")){
			forward.setPath("/app/board/faq.jsp");
		}
		return forward;
	}
}
