package com.koreait.app.futsalDAO;

public class usageStatusBean {
	private String statusnum;
	private int groundnum;
	private String groundtime;
	private String reservationnum;
	private String reservationdate;
	
	public usageStatusBean() {}
	
	public int getGroundnum() {
		return groundnum;
	}
	public void setGroundnum(int groundnum) {
		this.groundnum = groundnum;
	}
	public String getReservationdate() {
		return reservationdate;
	}
	public void setReservationdate(String reservationdate) {
		this.reservationdate = reservationdate;
	}
	public String getStatusnum() {
		return statusnum;
	}
	public void setStatusnum(String statusnum) {
		this.statusnum = statusnum;
	}
	public String getGroundtime() {
		return groundtime;
	}
	public void setGroundtime(String groundtime) {
		this.groundtime = groundtime;
	}
	public String getReservationnum() {
		return reservationnum;
	}
	public void setReservationnum(String reservationnum) {
		this.reservationnum = reservationnum;
	}
}
