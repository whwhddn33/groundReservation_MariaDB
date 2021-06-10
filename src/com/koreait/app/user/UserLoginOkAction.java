package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.userDAO.UserBean;
import com.koreait.app.userDAO.UserDAO;

public class UserLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		HttpSession session = request.getSession();
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		UserBean loginUser = udao.login(userid, userpw);
		
		if (loginUser != null) {
			session.setAttribute("login_session", loginUser);
			forward.setPath(request.getContextPath()+"/");
		}else {
			forward.setPath(request.getContextPath()+"/app/user/loginView.me"); 
			System.out.println("�α��� ����!");
		}
		forward.setRedirect(true);
		return forward;
	}

}
