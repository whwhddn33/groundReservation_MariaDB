package com.koreait.app.futsalDAO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class FutsalDAO {
	SqlSession sqlsession;
	SqlSessionFactory sqlfactory = SqlMapConfig.getInstance();
	
	public FutsalDAO(){
		sqlsession = sqlfactory.openSession(true);
	}
	public String updateTime() {
		Date todayinfo = new Date();
	    SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
	    System.out.println(dateForm.format(todayinfo));
	    String toDay = dateForm.format(todayinfo);
		return toDay;
	}
	
	public String getDangi() {
	    StringBuffer urlBuilder = new StringBuffer("http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst"); /*URL*/
	    HttpURLConnection conn = null;
	    StringBuffer sb = null;

	    Date todayinfo = new Date();
	    SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHH");
	    System.out.println(dateForm.format(todayinfo));
	    String toDay = dateForm.format(todayinfo).substring(0,8);
		if(Integer.parseInt(dateForm.format(todayinfo).substring(8,10))<5){
			toDay = Integer.toString(Integer.parseInt(dateForm.format(todayinfo).substring(0,8))-1);
		}
		System.out.println(toDay);
		String servieceKey = "9wu4WtdTXi9E8J%2BSHJaNedqlut%2BqgKK27XyUr9CwiXZt3P2nZj0j6Uh%2Fg8x3eG9ZZU8iq6Mlgx5kcucAV7jAUw%3D%3D";
		try {
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+servieceKey); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(servieceKey, "UTF-8")); /*공공데이터포털에서 받은 인증키*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("300", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
			urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(toDay, "UTF-8")); /*15년 12월 1일발표*/
			urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0500", "UTF-8")); /*05시 발표*/
			urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*예보지점 X 좌표값*/
			urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*예보지점의 Y 좌표값*/
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
			    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			sb = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
			    sb.append(line);
			}
			rd.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        conn.disconnect();
        System.out.println(sb.toString());
        return sb.toString();
	}

	public String getJungi() {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /*URL*/
		String servieceKey = "9wu4WtdTXi9E8J%2BSHJaNedqlut%2BqgKK27XyUr9CwiXZt3P2nZj0j6Uh%2Fg8x3eG9ZZU8iq6Mlgx5kcucAV7jAUw%3D%3D";
        HttpURLConnection conn = null;
		StringBuilder sb = null;
		
	    Date todayinfo = new Date();
	    SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMddHH");
	    System.out.println(dateForm.format(todayinfo));
	    String toDay = dateForm.format(todayinfo).substring(0,8)+"0600";
		if(Integer.parseInt(dateForm.format(todayinfo).substring(8,10))<6){
			toDay = Integer.toString(Integer.parseInt(dateForm.format(todayinfo).substring(0,8))-1)+"0600";
		}
		System.out.println("jungiToDay : "+toDay);
		
		try {
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "="+servieceKey); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode(servieceKey, "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON)Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode("11B00000", "UTF-8")); /*하단 참고자료 참조*/
	        urlBuilder.append("&" + URLEncoder.encode("tmFc","UTF-8") + "=" + URLEncoder.encode(toDay, "UTF-8")); /*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력-최근 24시간 자료만 제공*/
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			    rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
			    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
			    sb.append(line);
			}
			rd.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        conn.disconnect();
        System.out.println(sb.toString());
    
		return sb.toString();
	}

	public List<GroundInfoBean> getgroundlist(int tryCount) {
		int startNum = (10*tryCount)-9;
		int endNum = (startNum+9);
		System.out.print("startNum : ");
		System.out.println(startNum);
		System.out.print("endNum : ");
		System.out.println(endNum);
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startNum", startNum);
		datas.put("endNum", endNum);
		List<GroundInfoBean> loadlist = sqlsession.selectList("Futsal.loadlist",datas);
		
		return loadlist;
	}
	
	
	
	public GroundInfoBean getinfo(String groundnum) {
		return sqlsession.selectOne("Futsal.getinfo", groundnum);
	}
	
	public int insertgroundinfo(GroundInfoBean ginfobean) {
		return sqlsession.insert("Futsal.groundregist", ginfobean);
	}
	public int insertWeekDayHotTime(HashMap<String, String> weekDayHotTimeMap) {
		return sqlsession.insert("Futsal.weekDayHotregist", weekDayHotTimeMap);
	}
	
	public int insertWeekEndHotTime(HashMap<String, String> weekDayHotTimeMap) {
		return sqlsession.insert("Futsal.weekEndHotregist", weekDayHotTimeMap);
	}
	public List<GroundInfoBean> getregistlist(String epuserid) {
		List<GroundInfoBean> loadlist = sqlsession.selectList("Futsal.registloadlist",epuserid);
		return loadlist;
	}
	public int delList(String listNum) {
		return sqlsession.delete("Futsal.delList",listNum);
	}
	public int delhottime(String listNum) {
		return sqlsession.delete("Futsal.delHottime",listNum);
	}
	public List<GroundHotTimeBean> gethottime(String groundnum) {
		return sqlsession.selectList("Futsal.getHottime",groundnum);
	}
	public List<usageStatusBean> getReservation(usageStatusBean ubean) {
		return sqlsession.selectList("Futsal.getstatus",ubean);
	}
	public int insertReservation(HashMap<String, String> reservationInfo) {
		return sqlsession.insert("Futsal.insertReservation",reservationInfo);
	}

	public Integer returnSeq() {
		return sqlsession.selectOne("Futsal.returnseq");
	}
	public int InsertUsagstatus(usageStatusBean ubean) {
		return sqlsession.insert("Futsal.insertUsagstatus",ubean);
	}
	public int statusCheck(HashMap<String, String> check) {
		return sqlsession.selectOne("Futsal.statusCheck",check);
	}

	public Integer getPay(HashMap<String, String> checkInfo) {
		return sqlsession.selectOne("Futsal.getPay",checkInfo);
	}
	public int getWDBasicFee(String groundnum) {
		return sqlsession.selectOne("Futsal.getWDB",groundnum);
	}
	public int getWEBasicFee(String groundnum) {
		return sqlsession.selectOne("Futsal.getWEB",groundnum);
	}
	
}
