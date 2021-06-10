package com.koreait.app.boardDAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class BoardDAO {
	SqlSessionFactory sqlfactory = SqlMapConfig.getInstance();
	SqlSession sqlsession; 
	public BoardDAO() {
		sqlsession = sqlfactory.openSession(true);
	}
	public List<BoardBean> getList(){
		List<BoardBean> BoardList = sqlsession.selectList("Board.BoardAll");
		return BoardList;
	}
	public List<BoardBean> getAllList(){
		List<BoardBean> BoardList = sqlsession.selectList("Board.ListAll");
		return BoardList;
	}
	public List<ListBean> getBoardList(int startRow,int endRow,String category){
		System.out.println("List<ListBean> getBoardList 실행");
		HashMap<String,Object> data = new HashMap<>();
		data.put("startRow",startRow);
		data.put("endRow", endRow);
		data.put("category", category);
		System.out.println(startRow);
		System.out.println(endRow);
		List<ListBean> BoardList = sqlsession.selectList("Board.BoardListAll",data);
		System.out.println(BoardList);
		return BoardList;
	}
	public ListBean getAdminList(int num){
		return sqlsession.selectOne("Board.adminList",num);
	}
	public ListBean getBoardList(int num){
		return sqlsession.selectOne("Board.boardList",num);
	}
	public int getBoardSeq() {
		return (Integer)sqlsession.selectOne("Board.BoardSeq");
	}
	public int getBoardCnt(int category) {
		System.out.println(category);
		return (Integer)sqlsession.selectOne("Board.BoardCnt",category);
	}
	public boolean BoardInsert(BoardBean board) {
		return sqlsession.insert("Board.insertBoard",board) == 1;
	}
	public boolean ListInsert(ListBean board) {
		System.out.println(board.getBoardnum());
		System.out.println(board.getListnum());
		System.out.println(board.getListcontents());
		System.out.println(board.getListtitle());
		System.out.println(board.getUserid());
		return sqlsession.insert("Board.insertList",board) == 1;
	}
	public boolean BoardDelete(int num) {
		return sqlsession.delete("Board.deleteBoard",num) == 1;
	}
	public boolean ListDelete(int num) {
		return sqlsession.delete("Board.deleteList",num) == 1;
	}
	public void BoardModify(int num, String name) {
		HashMap<String,Object> data = new HashMap<>();
		data.put("boardnum",num);
		data.put("boardname",name);
		sqlsession.update("Board.modifyBoard",data);
	}
	public void ListModify(String title, String content,int listnum) {
		HashMap<String,Object> data = new HashMap<>();
		data.put("listtitle",title);
		data.put("listcontents",content);
		data.put("listnum", listnum);
		sqlsession.update("Board.modifyList",data);
	}
	public void sumReadCnt(int num) {
		sqlsession.update("Board.sumReadCnt",num);
	}
	public int returnseq() {
		return sqlsession.selectOne("Board.returnseq");
	}
}
