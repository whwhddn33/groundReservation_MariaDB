package com.koreait.app.futsal;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;

public class FutsallistAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		
		FutsalDAO fdao = new FutsalDAO();
		
		String getDangi = fdao.getDangi();
		String getJungi = fdao.getJungi();
		String updateTime = fdao.updateTime();
		
		request.setAttribute("getDangi", getDangi);
		request.setAttribute("getJungi", getJungi);
		request.setAttribute("updateTime", updateTime);
		
		forward.setRedirect(false);
		forward.setPath("/app/futsal/futsallist.jsp");
		return forward;
	}
	

}
