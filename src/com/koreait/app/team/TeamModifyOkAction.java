package com.koreait.app.team;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.teamDAO.TeamBean;
import com.koreait.app.teamDAO.TeamDAO;
import com.koreait.app.teamDAO.TeamFileBean;
import com.koreait.app.teamDAO.TeamFileDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class TeamModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward= new ActionForward();
		TeamDAO tdao=new TeamDAO();
		TeamBean tbean=new TeamBean();
		TeamFileDAO fdao=new TeamFileDAO();
		TeamFileBean fbean=new TeamFileBean();
		String fileName=null,orgName=null;
		int teamNo=0;
		boolean fileCheck = false, teamInsertCheck=false;
		MultipartRequest multi;
		String saveFolder=request.getServletContext().getRealPath("/app/team/teamLogo");
		int size=1024*1024*5;//5MB
		multi = new MultipartRequest(request, saveFolder,size,"UTF-8",new DefaultFileRenamePolicy());
		System.out.println(saveFolder);
		
		tbean.setTeamName(multi.getParameter("teamname"));
		tbean.setCaptainName(multi.getParameter("captainname"));
		tbean.setTeamTel(multi.getParameter("teamtel"));
		tbean.setTeamLocal(multi.getParameter("teamlocal"));
		tbean.setTeamFoundYear(multi.getParameter("teamfoundyear"));
		tbean.setTeamLevel(multi.getParameter("teamlevel"));
		tbean.setStartAge(multi.getParameter("startage"));
		tbean.setStopAge(multi.getParameter("stopage"));
		tbean.setUniformColor(multi.getParameter("uniformcolor"));
		tbean.setUniformAway(multi.getParameter("uniformaway"));
		tbean.setControlLabel(multi.getParameter("controllabel"));
			
		if(tdao.modifyTeam(tbean)) {
			teamInsertCheck=true;
			System.out.println("팀수정 완료");
		}
		fileName=multi.getFilesystemName("teamlogo_image");
		if(fileName ==null) {fileCheck=true;}
		orgName=multi.getOriginalFileName("teamlogo_image");
		teamNo=tdao.getTeamNoSeq();
		if(fileName!=null && fileName!="") {
			System.out.println("filename 있음");
			fbean.setTeamNo(teamNo);
			fbean.setFileName(fileName);
			fbean.setFileRealName(orgName);
			fileCheck=fdao.insertFiles(fbean);
		}
		if(!fileCheck || !teamInsertCheck) {
			System.out.println("Check false!");
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/app/team/TeamList.te?result=false");
			return forward;
		}else {
			System.out.println("Check true!");
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/app/team/TeamList.te");
		}
		return forward;
	}
}
