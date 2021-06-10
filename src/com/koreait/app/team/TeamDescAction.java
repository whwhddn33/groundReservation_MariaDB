package com.koreait.app.team;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.teamDAO.TeamBean;
import com.koreait.app.teamDAO.TeamDAO;
import com.koreait.app.teamDAO.TeamListBean;

public class TeamDescAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		TeamDAO tdao=new TeamDAO();
		
		String teamNo=request.getParameter("teamNo");
		request.setAttribute("teamNo", teamNo);
		System.out.println("teamNo : "+teamNo);
		int teamNo_Int =Integer.parseInt(teamNo);
		TeamBean team = new TeamBean();
		team = tdao.showTeamDesc(teamNo_Int);
		if(tdao.showTeamDesc(teamNo_Int) != null) {
			System.out.println("팀번호 있음");
			request.setAttribute("teamName", team.getTeamName());
			request.setAttribute("teamLocal", team.getTeamLocal());
			request.setAttribute("teamLevel", team.getTeamLevel());
		}
		
		List<TeamListBean> teamMember = tdao.getMemberList(teamNo);
		request.setAttribute("memberList", teamMember);
		forward.setRedirect(false);
		forward.setPath("/app/team/teamdesc.jsp");
		return forward;
	}
	
}
