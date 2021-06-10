package com.koreait.app.futsalDAO;

public class GroundInfoBean {
	private String groundnum;
	private String epuserid;
	private String groundname;
	private String groundarea;
	private String userpostcode;
	private String useraddr;
	private String useraddrdetail;
	private String useraddretc;
	private String hashTag;
	private String weekDayBasicFee;
	private String weekEndBasicFee;
	private String imgname;
	private String imgrealname;
	
	

	public GroundInfoBean() {};
	
	public void setGroundnum(String groundnum) {
		this.groundnum = groundnum;
	}

	public String getGroundnum() {
		return groundnum;
	}
	
	public String getImgname() {
		return imgname;
	}
	
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	
	public String getImgrealname() {
		return imgrealname;
	}
	
	public void setImgrealname(String imgrealname) {
		this.imgrealname = imgrealname;
	}

	public String getEpuserid() {
		return epuserid;
	}
	
	public void setEpuserid(String epuserid) {
		this.epuserid = epuserid;
	}
	
	
	public String getGroundname() {
		return groundname;
	}
	public void setGroundname(String groundname) {
		this.groundname = groundname;
	}
	public String getGroundarea() {
		return groundarea;
	}
	public void setGroundarea(String groundarea) {
		this.groundarea = groundarea;
	}
	public String getUserpostcode() {
		return userpostcode;
	}
	public void setUserpostcode(String userpostcode) {
		this.userpostcode = userpostcode;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUseraddrdetail() {
		return useraddrdetail;
	}
	public void setUseraddrdetail(String useraddrdetail) {
		this.useraddrdetail = useraddrdetail;
	}
	public String getUseraddretc() {
		return useraddretc;
	}
	public void setUseraddretc(String useraddretc) {
		this.useraddretc = useraddretc;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getWeekDayBasicFee() {
		return weekDayBasicFee;
	}
	public void setWeekDayBasicFee(String weekDayBasicFee) {
		this.weekDayBasicFee = weekDayBasicFee;
	}
	public String getWeekEndBasicFee() {
		return weekEndBasicFee;
	}
	public void setWeekEndBasicFee(String weekEndBasicFee) {
		this.weekEndBasicFee = weekEndBasicFee;
	}
	
}
