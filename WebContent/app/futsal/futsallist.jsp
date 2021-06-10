<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>[HIGROUND]구장목록</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/futsal/calendar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/futsal/futsallist.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body id = "futsalbody"class="is-preload">


<jsp:include page="/header.jsp"></jsp:include>
	<!-- Main -->
	
	<section id="main" class="wrapper sidebar left">
		<div id="futsalinner" class="inner">
		
			<div id = futsalweather>
					<table>
					<tr>
					<td></td>
						<c:forEach var="i" begin="0" end="6" step="1">
							<td id = "DAY${i}"></td>
						</c:forEach>
					</tr>
					<tr>
					<td>날씨</td>
						<c:forEach var="i" begin="0" end="6" step="1">
							<td id ="SKY${i}"></td>
						</c:forEach>
					</tr>
					<tr>
					<td>강수확률</td>
						<c:forEach var="i" begin="0" end="6" step="1">
							<td id ="POP${i}"></td>
						</c:forEach>
					</tr>
					</table>
			</div>
			
			<hr/>
			
			<div id = mapwrapper>
				<div id = makeMap></div>
			</div>
			
			<div id = line></div>
			
			<div id = calenderwrapper>
				<div id="calendarForm" style="font-size: 8px;"></div>
			</div>
			
				<!-- Content -->
			<div id = "futsalcontent" class="contents">
				<div id = loading>구장목록을 불러오는중입니다</div>
			</div>
			
		</div>
		
	</section>

</body>
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/futsal/calenderMaker.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a65f037167fc6cf2621aa6deace22ee2&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/assets/js/futsal/ajaxlist.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/futsal/weatherSetter.js"></script>
	<script>
	</script>
<script>
var contextPath = "${pageContext.request.contextPath}";
$(document).ready(function(){
	var getdangi = ${getDangi};
	var getjungi = ${getJungi};
	var getupdateTime = ${updateTime};
	weatherSetter(getdangi,getjungi,getupdateTime);
 	insertDate();
	function insertDate(){
		var today = new Date();
		date = today.getDate();
		for (var i = 0; i < 7; i++) {
			$("#DAY"+i).text(date+i);	
		}
	}
});

</script>
</html>