package com.koreait.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

import com.koreait.app.user.CheckId;

@WebServlet("*.me")
public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserFrontController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;

		switch (command) {
			case "/app/user/joinIndex.me": // ȸ������ ������ �̵� 
				forward = new ActionForward();
				forward.setPath(request.getContextPath()+"/app/user/joinIndex.jsp");
				forward.setRedirect(true);
				break;
			case "/app/user/joinIndividualView.me": // ȸ������ ������ �̵� 
				forward = new ActionForward();
				forward.setPath(request.getContextPath()+"/app/user/joinIndividualView.jsp");
				forward.setRedirect(true);
				break;
			case "/app/user/joinEnterpriseView.me": // ȸ������ ������ �̵� 
				forward = new ActionForward();
				forward.setPath(request.getContextPath()+"/app/user/joinEnterpriseView.jsp");
				forward.setRedirect(true);
				break;
				
			case "/app/user/CheckId.me": // ȸ������ ��, ���̵� �ߺ� üũ
				try {
					forward = new CheckId().execute(request, response);
				} catch (Exception e1) {
					System.out.println("/user/CheckId ����");
				}
				break;

			case "/app/user/UserJoinOk.me": // ȸ������ ����
				try {
					forward = new UserJoinOkAction().execute(request, response);
				} catch (Exception e) {
					System.out.println("/app/user/UserJoinOk ����");
					System.out.println(e);
				}
				break;
			case "/app/user/EnterpriseUserJoinOk.me": // ȸ������ ����
				try {
					forward = new EnterpriseUserJoinOkAction().execute(request, response);
				} catch (Exception e) {
					System.out.println("/app/user/UserJoinOk ����");
					System.out.println(e);
				}
				break;
	
			case "/app/user/loginIndex.me": // �α��� ������ �̵�
					forward = new ActionForward();
					forward.setPath(request.getContextPath()+"/app/user/loginIndex.jsp");
					forward.setRedirect(true);
				break;
			case "/app/user/loginView.me": // �α��� ������ �̵�
				forward = new ActionForward();
				System.out.println(request.getAttribute("check"));
				if(request.getAttribute("check")== null) {
					System.out.println("ifrun");
					forward.setPath(request.getContextPath()+"/app/user/loginView.jsp");
					forward.setRedirect(true);
				}else{
					System.out.println("elserun");
					request.setAttribute("check", "notOK");
					forward.setPath("/app/user/loginView.jsp");
					forward.setRedirect(false);
				};
				break;
			case "/app/user/enterpriseLoginView.me": // �α��� ������ �̵�
				forward = new ActionForward();
				forward.setPath(request.getContextPath()+"/app/user/enterpriseLoginView.jsp");
				forward.setRedirect(true);
				break;
				
			case "/app/user/UserLoginOk.me": // �α��� ����
				try {
					forward = new UserLoginOkAction().execute(request, response);
				} catch (Exception e) {
					System.out.println("/app/user/UserLoginOk ����");
					System.out.println(e);
				}
				break;
			case "/app/user/EnterpriseUserLoginOk.me": // �α��� ����
				try {
					forward = new EnterpriseUserLoginOkAction().execute(request, response);
				} catch (Exception e) {
					System.out.println("/app/user/UserLoginOk ����");
					System.out.println(e);
				}
				break;
			
			case "/app/user/logOut.me": // �α׾ƿ�
				request.getSession().invalidate(); 
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath()+"/");
				break;
				
			default:
				break;
		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}