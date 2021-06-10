<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
   Slate by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
<head>
<title>[HIGROUND]${groundinfo.groundname}</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/futsal/reservation.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/futsal/calendar.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css"></style>
</head>
<body class="is-preload">
	
	<!-- header -->
	<jsp:include page="/header.jsp"></jsp:include>
	
   <!-- main -->
    <section id="main" class="wrapper sidebar left">
        <div class="inner" id="reservationinner">
        
            <div id = first>
                <div id = groundimg style="background-image: url('${pageContext.request.contextPath}/app/futsal/img/${groundinfo.imgrealname}');"></div>
                <div id=groundinfo>
                    <h2>구장이름</h2>
                        <div class = content>${groundinfo.groundname}</div>
                    <h2>주소</h2>
                        <div class = content>${groundinfo.useraddr}</div>
                </div>
            </div>
        


            <div id = second>
                <div class="calander">
                    <div id = calendarForm></div>
                </div>
                <div class="reservation">
	               	<table>
	               		<thead>
	               			<tr>
	               				<td>시간</td>
	               				<td>요금</td>
	               				<td>예약현황</td>
	               			</tr>
	               		</thead>
	               		<tbody id = reservation>
	               			<tr><td>원하는 예약일을 선택해주세요<td><tr>
	               		</tbody>
	               		
	               	</table>
	            	<div id = payresult>결제금액</div>
		            	<button onclick = "send()">예약하기</button>
		            	<button onclick = "reset()">리셋</button>
		            	
		            	<form id = reservationform action="${pageContext.request.contextPath}/reservationRegist.fu" style="display: none">
		            		
		            	</form>
            		</div>
            </div>
            
            
<!--             <div class="last" id = review>
	            <div class="review wrapper">
					<header class="major">
						<h2>REVIEW</h2>
						<p>다양한 후기로 더 꼼꼼히</p>
					</header>
	
					Content
					<div class="contents">
						<table border="1">
							<thead>
								<tr>
									<td>닉네임</td>
									<td>제목</td>
									<td>날짜</td>
									<td>조회</td>
								</tr>
							</thead>
							<tbody>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-02-21</td>
									<td>0회</td>
								</tr>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-03-05</td>
									<td>0회</td>
								</tr>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-03-07</td>
									<td>0회</td>
								</tr>
							</tbody>
						</table>
						<a href="/board/boardWrite.bo" class="small btn1">글쓰기</a>
					</div>
				</div>
            </div> -->
         </div>
            
            
			
					 
			
        
	
    </section>


</body>
<script src="${pageContext.request.contextPath}/assets/js/futsal/calenderMaker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/loginsingup.js"></script>
<script>
var payresult = 0;
var select = '';
var selectYear = '';
var selectMonth = '';
var selectDate = '';
$(document).ready(function(){
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var groundnum = ${groundnum};
	var tags = '';
	 console.log("select : " + select);
	
	/* callAjax(); */
	$("#calendarForm").on("click","td",function(){
		var selectYear = $("#year").text();
		var selectMonth = $("#month").text();
		var selectDate = $(".select_day").text();
		select = selectYear+"."+(selectMonth.length==1?"0"+selectMonth:selectMonth)+"."+(selectDate.length==1?"0"+selectDate:selectDate);
		console.log("click : "+select);
		callAjax();
	})
	
	$(".reservation").on("click","tr",function(){
		if($(this).hasClass("checkedreservation") == true){
			console.log("클래스있음");
			$(this).removeClass("checkedreservation");
			payresult -= parseInt($(this).find(".payinfo").text().substr(0,5));
			tags = tags.replace('<input type="text" name = reservationTime value = '+$(this).attr("id")+'>','');
			console.log(tags);
			$("#reservationform").html(tags);
			$("#payresult").html(payresult);
		}else{
			console.log("클래스없음");
			$(this).addClass("checkedreservation");
			payresult += parseInt($(this).find(".payinfo").text().substr(0,5));
			if(tags.indexOf('<input type="text" name = reservationTime value = '+$(this).attr("id")+'>') == -1){
				tags +='<input type="text" name = reservationTime value = '+$(this).attr("id")+'>';
			}
			$("#reservationform").html(tags)
			$("#payresult").html(payresult);
		}
	})

	
	function callAjax(){
		$.ajax({
			url : ctx+"/loadHottime.fu?groundnum="+groundnum+"&select="+select,
			type : "get",
			dataType:"JSON"
		})
		.done(function(data){
			var tags = '';
			var statusArr = new Array(12);
			var feeArr = new Array(12);
			payresult = 0;
			$("#payresult").html(payresult);
			console.log(data);
			if(data.statusJson != null){
				for (var k = 0; k < data.statusJson.length; k++) {
					statusArr[data.statusJson[k].groundtime-1] ="예약불가";
				}
				for (var l = 0; l < statusArr.length; l++) {
					if(statusArr[l] == null){
						statusArr[l] = "예약가능";
					}
				}
					console.log(statusArr);
			}else{
				for (var m = 0; m < statusArr.length; m++) {
					statusArr[m] = "예약가능";
				}
			}
			if(new Date(select).getDay() == 0 || new Date(select).getDay()==6){
				for (var i = 0; i < data.json.length; i++) {
					if(data.json[i].groundweek == 1){
						feeArr[data.json[i].groundtime]=data.json[i].groundhottimefee;
					}
				}
				for (var j = 0; j < feeArr.length;j++) {
					if(statusArr[j] == "예약불가")continue;
					tags += '<tr id = '+j+'>'
					tags += '<td>'+(((j+1)*2)-2)+'시~'+((j+1)*2)+'시 </td>'
					if (feeArr[j] == null)tags += '<td class = payinfo>'+data.endBasicFee+'원 </td>';
					else tags += '<td class = payinfo>'+feeArr[j]+'원 </td>';
					tags += '<td class = status>'+statusArr[j]+'</td>'
					tags += '</tr>'
				}
			}
			else{
				for (var i = 0; i < data.json.length; i++) {
					if(data.json[i].groundweek == 0){
						feeArr[data.json[i].groundtime]=data.json[i].groundhottimefee;
					}
				}
				
				for (var j = 0; j < feeArr.length;j++) {
					if(statusArr[j] == "예약불가")continue;
					tags += '<tr id = '+j+'>'
					tags += '<td>'+(((j+1)*2)-2)+'시~'+((j+1)*2)+'시 </td>'
					if (feeArr[j] == null)tags += '<td class = payinfo>'+data.dayBasicFee+'원 </td>';
					else tags += '<td class = payinfo>'+feeArr[j]+'원 </td>';
					tags += '<td class = status>'+statusArr[j]+'</td>'
					tags += '</tr>'
				}
			}
			$("#reservation").html(tags);
			
		})
		.fail(function(xhr,error){
			console.log("통신실패");
			$(".contents").text(".fail");
			console.log("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
		})
	}
	
});
function reset(){
	console.log("리셋버튼클릭");
	$(".reservation").find("tr").removeClass("checkedreservation");
	console.log(payresult);
	payresult = 0;
	$("#payresult").html(payresult);
}
function send(){
	console.log(select);
	console.log($("#payresult").text());
	
	weekCode = new Date(select).getDay();
	$('#reservationform').append('<input id = userid type="text" name = userid value='+"${login_session.userid}"+'>');
	$('#reservationform').append('<input type="text" name = groundnum value='+"${requestScope.groundnum}"+'>');
	$('#reservationform').append('<input type = text name = pay value = '+$("#payresult").text()+'>');
	$('#reservationform').append('<input type = text name = select value = '+select+'>');
	$('#reservationform').append('<input type = text name = weekCode value = '+weekCode+'>');
	if ($("#userid").val() == null || $("#userid").val() =='') {
		alert("로그인후 이용가능합니다.");
	}else{
		$('#reservationform').submit();
	}
}
</script>
</html>
