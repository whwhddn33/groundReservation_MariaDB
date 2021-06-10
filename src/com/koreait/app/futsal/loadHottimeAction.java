package com.koreait.app.futsal;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.futsalDAO.FutsalDAO;
import com.koreait.app.futsalDAO.GroundHotTimeBean;
import com.koreait.app.futsalDAO.usageStatusBean;

public class loadHottimeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		FutsalDAO fdao = new FutsalDAO();
		String groundnum = request.getParameter("groundnum");
		String select = request.getParameter("select");
		
		System.out.println("groundnum : " + groundnum);
		System.out.println("select : " + select);
		List<GroundHotTimeBean> ghot;
		ghot = fdao.gethottime(groundnum);
		String DBF = fdao.getinfo(groundnum).getWeekDayBasicFee();
		String EBF = fdao.getinfo(groundnum).getWeekEndBasicFee();
		for (GroundHotTimeBean i : ghot) {
			System.out.println(i.getGroundfeenum());
		}
		
		usageStatusBean ubean = new usageStatusBean();
		
		ubean.setGroundnum(Integer.parseInt(groundnum));
		ubean.setReservationdate(select);
		fdao.getReservation(ubean);
		List<usageStatusBean> Status = fdao.getReservation(ubean);
		System.out.println("for문");
		for (usageStatusBean i : Status) {
			System.out.println("Status : "+i.getGroundtime());
		}
		System.out.println("for문");
		
		Gson g = new Gson();
		String json = g.toJson(ghot);
		String statusJson = g.toJson(Status);
		System.out.println(json);
		System.out.println(statusJson);
		
		PrintWriter out = response.getWriter();
		
		out.println("{\"json\" : "+json+",\"dayBasicFee\":"+DBF+",\"endBasicFee\":"+EBF+",\"statusJson\" : "+statusJson+"}");
		return null;
	}

	
}
