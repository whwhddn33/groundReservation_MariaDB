package com.koreait.app.team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.teamDAO.TeamDAO;

public class TeamListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		TeamDAO tdao = new TeamDAO();
		ActionForward forward= new ActionForward();
		
		System.out.println(request.getParameter("page"));
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(request.getParameter("page"));
		System.out.println("page : " + page);
		int pagesize = 10;
		int totalCnt = tdao.getTeamCnt();
		
		//10 : 한 페이지에 띄워줄 "팀" 개수
		int endRow = page*10;
		int startRow = endRow-9;
		
		int startPage = ((page-1)/pagesize)*pagesize + 1;
		int endPage = startPage+(pagesize-1);
		int totalPage = (totalCnt-1)/pagesize +1; 
		endPage = endPage>totalPage?totalPage:endPage;
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("teamList", tdao.getTeamList(startRow,endRow));
		System.out.println(totalPage);
		System.out.println(totalCnt);
		System.out.println(page);
		System.out.println(startPage);
		System.out.println(endPage);
		forward.setRedirect(false);
		forward.setPath("/app/team/teamlist.jsp");
		return forward;
	}

}
