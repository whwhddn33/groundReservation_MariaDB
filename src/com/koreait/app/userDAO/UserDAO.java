package com.koreait.app.userDAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class UserDAO {
	SqlSessionFactory sqlfactory = SqlMapConfig.getInstance();
	SqlSession sqlsession = null;

	public UserDAO() {
		sqlsession = sqlfactory.openSession(true);
	}

	public boolean join(UserBean user) {
		return 1 == sqlsession.insert("User.join", user);
	}

	public UserBean login(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		UserBean user = sqlsession.selectOne("User.login", datas);
		return user;
	}

	public boolean checkId(String userid) {
		return 0 == (Integer)sqlsession.selectOne("User.checkId",userid);
	}
}
