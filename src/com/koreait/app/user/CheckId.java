package com.koreait.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.userDAO.UserDAO;


public class CheckId implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		UserDAO udao = new UserDAO();

		String userid = request.getParameter("userid");
		PrintWriter out = response.getWriter();
		if (udao.checkId(userid)) {
			out.println("ok");
		} else {
			out.println("not-ok");
		}
		return null;
	}
}
