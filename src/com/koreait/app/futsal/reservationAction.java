package com.koreait.app.futsal;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.GroundHotTimeBean;

public class reservationAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String groundnum = request.getParameter("groundnum");
		System.out.println(request.getParameter("groundnum"));
		FutsalDAO fdao = new FutsalDAO();
		request.setAttribute("groundinfo", fdao.getinfo(groundnum));
		request.setAttribute("groundnum", groundnum);
		
		forward.setPath("/app/futsal/reservation.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
