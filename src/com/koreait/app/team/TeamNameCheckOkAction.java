package com.koreait.app.team;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.teamDAO.TeamDAO;

public class TeamNameCheckOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		TeamDAO tdao=new TeamDAO();
		String teamname=request.getParameter("teamname");
		PrintWriter out=response.getWriter();
		boolean nCheck=false;
		if(tdao.checkName(teamname)) {
			//중복 검사 성공
			out.print("success");
			nCheck=true;
		}else {
			//중복 검사 실패
			out.print("fail");
		}
		return null;
	}
}
