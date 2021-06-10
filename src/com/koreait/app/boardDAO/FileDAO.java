package com.koreait.app.boardDAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class FileDAO {
	SqlSessionFactory sqlfactory = SqlMapConfig.getInstance();
	SqlSession sqlsession;
	public FileDAO() {
		sqlsession = sqlfactory.openSession(true);
	}
	
	public boolean insertFile(FileBean file) {
		return sqlsession.insert("File.insertFile",file)==1;
	}

	public FileBean getListInFile(int num, int boardnum) {
		HashMap<String, Integer> requestnum = new HashMap<>();
		requestnum.put("boardnum", boardnum);
		requestnum.put("listnum", num);
		return sqlsession.selectOne("File.getListInFile",requestnum);
	}
}