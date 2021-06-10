package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.userDAO.UserBean;
import com.koreait.app.userDAO.UserDAO;

public class UserJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		UserDAO udao = new UserDAO();
		UserBean user = new UserBean();

		user.setUserid(request.getParameter("userid"));
		user.setUserpw(request.getParameter("userpw"));
		user.setUsername(request.getParameter("username"));
		user.setUsergender(request.getParameter("usergender"));
		user.setUserphone(request.getParameter("userphone"));
		user.setUserpostcode(request.getParameter("userpostcode"));
		user.setUseraddr(request.getParameter("useraddr"));
		user.setUseraddrdetail(request.getParameter("useraddrdetail"));
		user.setUseraddretc(request.getParameter("useraddretc"));

		if (udao.join(user)) {
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/");
			
		} else {
			System.out.println("DB에 회원가입 데이터 입력 실패");
		}
		
		return forward;
	}

}
