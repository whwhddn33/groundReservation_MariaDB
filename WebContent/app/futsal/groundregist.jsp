<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[HIGROUND]구장등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/groundregist.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body>

	<!-- header -->
	<jsp:include page="/header.jsp"></jsp:include>

	<section id="main" class="wrapper sidebar left">
		<div id="registinner" class="inner">
			<div id = regist>
				<div id = mainStringwrapper>
					<div id = mainString>구장등록하기</div>
				</div>
					<!-- 폼태그-->
				<form name = registForm action="${pageContext.request.contextPath}/futsalFrontController/groundregist.fu" method="post" enctype="multipart/form-data">
					<div id = form1wrapper>
						<div class = infoString>구장이름</div>
							<input name ="groundname" type="text" placeholder="구장이름"><br>
					
						<div class = infoString>구장면적</div>
							<input class = area name = "groundarea1" type="text" placeholder="가로">
							x
							<input class = area name = "groundarea2" type="text" placeholder="세로"><br>
							<br>
							<label id = filelable for = file>이미지등록</label>
							<input type="file" name = file id = file >
						<div class = infoString>구장주소</div>
						<div class="input-wrapper flex">
							<input type="text" name="userpostcode" id="sample6_postcode"
								placeholder="우편번호" class="input-address-text">
							<input type="button" onclick="sample6_execDaumPostcode()"
								value="우편번호 찾기" class="input-button"><br>
						</div>
							<br>	
						<input type="text" name="useraddr" id="sample6_address"
							placeholder="주소" class="input-address-text"><br>


						<div class="input-wrapper flex">
							<input type="text" name="useraddrdetail"
								id="sample6_detailAddress" placeholder="상세주소"
								class="input-address-text" style="display: none;"> 
								
							<input type="text"
								name="useraddretc" id="sample6_extraAddress" placeholder="참고항목"
								class="input-address-text" style="display: none;">
								
							<div id = makeMap></div>
						</div>
						<div class = infoString>해쉬태그</div>
							구장의편의시설, 특징등을 적어주세요(ex 편의점,샤워장,11v11,5v5...)
							<input id = hashtag type="text" placeholder="해쉬태그">
							<button id = tagregbtn type="button" onclick ='tagstack()'>태그등록</button>
							<div id = tagdisplay></div>
							<input id = Hashinput type="text" name = hashTag style="display: none;">
							<input id = epuserid type="text" name = epuserid style="display: none;">
					</div>	
							<br>
					<div id = weekwrapper>
						<div id = weekday>
							<div class = infoString>평일기본가격입력</div>
							<input name = "weekDayBasicFee" type="text" placeholder="기본가"><br>
							<div id = weekDayHot></div>
						</div>
						
						<div id = weekend>
								<div class = infoString>주말기본가격입력</div>
									<input name = weekEndBasicFee type="text" placeholder="기본가"><br>
								<div id = weekEndHot></div>
						</div>
					</div>
					<br>
					<div id = submitwrapper>
							<button id = registbtn type="button" onclick = 'Hashinputtag("${login_session.getEpuserid()}")'>등록하기</button>
					</div>
				</form>
				
				<!-- 폼태그-->
				
			</div>
		</div>
	</section>


</body>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a65f037167fc6cf2621aa6deace22ee2&libraries=services"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=563cdd8507ac7e3ee9a21bace94dd5e2&libraries=services"></script> -->
<script src="${pageContext.request.contextPath}/assets/js/futsal/groundregist.js"></script>
</html>