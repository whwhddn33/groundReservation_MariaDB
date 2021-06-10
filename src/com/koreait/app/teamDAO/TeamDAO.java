package com.koreait.app.teamDAO;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class TeamDAO {
	SqlSessionFactory sqlfactory= SqlMapConfig.getInstance();
	SqlSession sqlsession = null;
	
	public TeamDAO() {
		sqlsession=sqlfactory.openSession(true);
	}
	//회원가입
	public boolean createTeam(TeamBean tbean) {
		return 1==sqlsession.insert("Team.create", tbean);
	}
	//로고를 추가할 팀 번호
	public int getTeamNoSeq() {
		return (Integer)sqlsession.selectOne("Team.teamNoSeq");
	}
	//팀명 중복체크
	public boolean checkName(String teamName) {
		return 0==(Integer)sqlsession.selectOne("Team.checkName", teamName);
	}
	//팀 상세보기
	public TeamBean showTeamDesc(int teamNo) {
		TeamBean showTeam=sqlsession.selectOne("Team.teamDesc",teamNo);
		System.out.println(showTeam);
		return showTeam;
	}
	//팀 정보수정
	public boolean modifyTeam(TeamBean tbean) {
		return 1==sqlsession.update("Team.teamModify", tbean);
	}
	//TBL_TEAM 내 튜플 개수
	public int getTeamCnt() {
		return sqlsession.selectOne("Team.teamCnt");
	}
	//팀 전체 가져오기
	public List<TeamBean> getTeamList(int startRow, int endRow){
		HashMap<String, Integer> datas = new HashMap<>();
		System.out.println("startRow");
		System.out.println(startRow);
		System.out.println("endRow");
		System.out.println(endRow);
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<TeamBean> teamList = sqlsession.selectList("Team.teamListAll", datas);
		System.out.println("teamlist : "+teamList);
		return teamList;
	}
	public int insertMember(TeamListBean joinMember) {
		return sqlsession.insert("Team.insertTeamMember",joinMember);
	}
	public List<TeamListBean> getMemberList(String teamNo) {
		return sqlsession.selectList("Team.getTeamMember", teamNo);
	}

}
