package com.koreait.app.userDAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class EnterpriseUserDAO {
	SqlSessionFactory sqlfactory = SqlMapConfig.getInstance();
	SqlSession sqlsession = null;

	public EnterpriseUserDAO() {
		sqlsession = sqlfactory.openSession(true);
	}

	public boolean join(EnterpriseUserBean user) {
		return 1 == sqlsession.insert("EUser.join", user);
	}

	public EnterpriseUserBean login(String epuserid, String epuserpw) {
		System.out.println("login실행");
		HashMap<String, String> datas = new HashMap<>();
		datas.put("epuserid", epuserid);
		datas.put("epuserpw", epuserpw);
		EnterpriseUserBean ebean = sqlsession.selectOne("EUser.login", datas);
		System.out.println(ebean);
		return ebean;
	}
}
