package com.koreait.app.futsal;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.usageStatusBean;

public class reservationRegistAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		FutsalDAO fdao = new FutsalDAO();
		ActionForward forward = new ActionForward();
		String[] reservation = request.getParameterValues("reservationTime");
		String reserInfo = "";
		for (int i = 0; i < reservation.length; i++) {
			if(i>0) {
				reserInfo += ","+reservation[i];
			}else {
				reserInfo += reservation[i];
			}
		}
		System.out.println(reserInfo);
		String pay = request.getParameter("pay");
		String select = request.getParameter("select");
		int weekCode = Integer.parseInt(request.getParameter("weekCode"));
		System.out.println("weekCode : "+weekCode);
		String userid = request.getParameter("userid");
		System.out.println(userid);
		String groundnum = request.getParameter("groundnum");
		System.out.println(groundnum);
//=======================injection검사=======================
		int wdbf = 0;
		int webf = 0;
		if (weekCode == 1|| weekCode == 6)weekCode = 1;
		else weekCode = 0;
		if (weekCode == 0) {
			wdbf = fdao.getWDBasicFee(groundnum);
			System.out.println("평일기본요금 : "+wdbf);
		}else {
			webf = fdao.getWEBasicFee(groundnum);
			System.out.println("주말기본요금 : "+webf);
		}
		HashMap<String, String> checkInfo = new HashMap<>();
		checkInfo.put("groundnum", groundnum);
		checkInfo.put("weekCode", Integer.toString(weekCode));
		int serverCheckPayVal = 0;
		Integer getPay = 0;
		int stack = 0;
		for (int i = 0; i < reservation.length; i++) {
			checkInfo.put("groundtime", reservation[i]);
			getPay = fdao.getPay(checkInfo);
			
			if (getPay != null) {
				serverCheckPayVal += getPay;
			}else {
				stack++;
			}
		}
		System.out.println(stack);
		if (weekCode == 0) {
			serverCheckPayVal += (stack*wdbf);
		}else {
			serverCheckPayVal += (stack*webf);
		}
		System.out.println("pay : "+ pay);
		System.out.println("serverCheckPayVal : "+ serverCheckPayVal);
//=======================DB등록=======================		
		if(serverCheckPayVal == Integer.parseInt(pay)) {
			System.out.println("일치");
			HashMap<String, String> reservationInfo = new HashMap<>();
			reservationInfo.put("reserInfo", reserInfo);
			reservationInfo.put("userid", userid);
			reservationInfo.put("pay", pay);
			reservationInfo.put("select", select);
			reservationInfo.put("groundnum", groundnum);
			if(fdao.insertReservation(reservationInfo)==1) {
				int reserNum = fdao.returnSeq();
				System.out.println("예약정보번호 : "+reserNum);
				usageStatusBean ubean = new usageStatusBean();
				ubean.setGroundnum(Integer.parseInt(groundnum));
				ubean.setReservationdate(select);
				ubean.setReservationnum(Integer.toString(reserNum));
				for (int i = 0; i < reservation.length; i++) {
					String groundtime = Integer.toString(Integer.parseInt(reservation[i])+1);
					ubean.setGroundtime(groundtime);
					System.out.println("for문속 : "+ubean.getGroundtime());
					fdao.InsertUsagstatus(ubean);
				}
			}
		}
		
		forward.setPath(request.getContextPath()+"/reservation.fu?groundnum="+groundnum);
		forward.setRedirect(true);
		return forward;
	}

}
