package com.koreait.app.teamDAO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class TeamFileDAO {
	SqlSessionFactory sqlfactory= SqlMapConfig.getInstance();
	SqlSession sqlsession = null;
	
	public TeamFileDAO() {
		sqlsession=sqlfactory.openSession(true);
	}
	//팀 로고 파일 추가
	public boolean insertFiles(TeamFileBean fbean) {
		return 1==sqlsession.insert("Team.insertFiles",fbean);
	}
}
