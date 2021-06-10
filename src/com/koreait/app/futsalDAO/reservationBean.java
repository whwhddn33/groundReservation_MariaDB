package com.koreait.app.futsalDAO;

public class reservationBean {
	private String reservationnum;
	private String userid;
	private String groundtime;
	private String reservationdate;
	private String reservationpay;
	private String paydate;
	
	public reservationBean() {}
	
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReservationdate() {
		return reservationdate;
	}
	public void setReservationdate(String reservationdate) {
		this.reservationdate = reservationdate;
	}
	public String getReservationpay() {
		return reservationpay;
	}
	public void setReservationpay(String reservationpay) {
		this.reservationpay = reservationpay;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	
	
	
}
