package com.koreait.app.boardDAO;

public class ListBean {
	
	int listnum;
	int usernum;
	String userid;
	String listtitle;
	String listcontents;
	String listdate;
	int readcnt;
	int boardnum;
	
	public int getListnum() {
		return listnum;
	}
	public void setListnum(int listnum) {
		this.listnum = listnum;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getListtitle() {
		return listtitle;
	}
	public void setListtitle(String listtitle) {
		this.listtitle = listtitle;
	}
	public String getListcontents() {
		return listcontents;
	}
	public void setListcontents(String listcontents) {
		this.listcontents = listcontents;
	}
	public String getListdate() {
		return listdate;
	}
	public void setListdate(String listdate) {
		this.listdate = listdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
}
