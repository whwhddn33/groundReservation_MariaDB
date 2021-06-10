package com.koreait.app.team;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.teamDAO.TeamDAO;
import com.koreait.app.teamDAO.TeamListBean;

public class TeamJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		TeamDAO tdao=new TeamDAO();
		
		System.out.println("");
		System.out.println("======================파라미터 출력========================");
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name)); 
		}
		System.out.println("======================================================");
		System.out.println("");
		String teamNo = request.getParameter("teamNo");
		TeamListBean joinMember = new TeamListBean();
		joinMember.setTeamNo(Integer.parseInt(teamNo));
		joinMember.setUsername(request.getParameter("username"));
		joinMember.setNickname(request.getParameter("nickname"));
		joinMember.setUserheight(request.getParameter("userheight"));
		joinMember.setUserweight(request.getParameter("userweight"));
		joinMember.setUsefoot(request.getParameter("usefoot"));
		joinMember.setMainposition(request.getParameter("mainposition"));
		joinMember.setMinorposition(request.getParameter("minorposition"));
		joinMember.setUsertel(request.getParameter("usertel"));
		if (tdao.insertMember(joinMember)==1) {
			forward.setPath("/team/TeamDesc.te?teamNo="+teamNo);
		};
		return forward;
	}

}
