package com.koreait.app.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;
import com.koreait.app.boardDAO.BoardDAO;

/**
 * Servlet implementation class BoardFront
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		System.out.println("command : "+command);
		System.out.println("requseturi : " + requestURI);
		if(command.equals("/board/boardList.bo")) {
			try {
				forward = new BoardListAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/board.bo")) {
			try {
				forward = new AdminBoardAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/boardlist.bo")) {
			try {
				forward = new AdminListAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/boardWrite.bo")) {
			try {
				forward = new BoardWriteAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/boardWriteOk.bo")) {
			try {
				forward = new BoardWriteOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}	
		}else if(command.equals("/board/adminWrite.bo")) {
			try {
				forward = new AdminWriteOkAction().execute(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/adminDelete.bo")) {
			try {
				forward = new AdminDeleteAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/adminModify.bo")) {
			try {
				forward = new AdminModifyAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/adminView.bo")) {
			try {
				forward = new BoardViewAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/boardModi.bo")) {
			try {
				forward = new AdminListModiAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/boardModiOk.bo")) {
			try {
				forward = new AdminListModiOkAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/admin/boardDel.bo")) {
			try {
				forward = new AdminListDelAction().execute(request,response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/boardView.bo")) {
			try {
				forward = new BoardViewAction().execute(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}else if(command.equals("/board/fileDownload.bo")) {
			try {
				forward = new DownloadAction().execute(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request,response);
			}
		}
	}

}
