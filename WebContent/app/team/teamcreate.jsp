<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>[HIGROUND]새 팀 생성</title>
<meta charset="utf-8" http-equiv="Content-Type" content="text/html"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/team/teamcreate.css" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">
		
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		<!-- Main -->
			<section id="main" class="wrapper sidebar left">
				<div class="inner">
					<!-- 내용 -->
					<c:choose>
						<c:when test="${login_session eq null}">
							로그인후 이용해주세요!
						</c:when>
						<c:otherwise>
							<div class="content team_create">
								<div class="title main-title">
								    <h2 class="title-name">새 팀 생성</h2>
	  							</div>
	  							<!-- title main-title end -->
	  							<div class="createwrap">
	  								<div class="formwrap">
			  							<form class="createform" enctype="multipart/form-data" name="createform" method="post" action="${pageContext.request.contextPath}/team/TeamCreateOk.te">
											<label>팀명 
												<input type="text" name="teamname" id="teamname" oninput="checkName()"/>
												<span id="checkText"></span>
											</label>
											<!-- 팀명 end -->
											<label>주장이름
												<input type="text" name="captainname" id="captainname" value="${login_session.username}" readonly="readonly"/>	
												<span id="checkInput"></span>
											</label>
											<!-- 주장이름 end -->
											<input type="hidden" name="teamtel" id="teamtel" value="${login_session.userphone }"/>
											<!-- 전화번호 end -->
											<label>지역 선택
												<select name="teamlocal" id="teamlocal">
															<option value="non_select">- 지역 선택  -</option>
															<option>서울특별시</option>
															<option>서울시 강남구</option>
															<option>서울시 강동구</option>
															<option>서울시 강북구</option>
															<option>서울시 강서구</option>
															<option>서울시 관악구</option>
															<option>서울시 광진구</option>
															<option>서울시 구로구</option>
															<option>서울시 금천구</option>
															<option>서울시 노원구</option>
															<option>서울시 도봉구</option>
															<option>서울시 동대문구</option>
															<option>서울시 동작구</option>
															<option>서울시 마포구</option>
															<option>서울시 서대문구</option>
															<option>서울시 서초구</option>
															<option>서울시 성동구</option>													
															<option>서울시 성북구</option>
															<option>서울시 송파구</option>
															<option>서울시 양천구</option>
															<option>서울시 영등포구</option>
															<option>서울시 용산구</option>
															<option>서울시 은평구</option>
															<option>서울시 종로구</option>
															<option>서울시 중구</option>
															<option>서울시 중랑구</option>
															<option>경기도 고양시</option>
															<option>경기도 과천시</option>
															<option>경기도 광명시</option>
															<option>경기도 광주시</option>													
															<option>경기도 구리시</option>
															<option>경기도 군포시</option>
															<option>경기도 김포시</option>													
															<option>경기도 남양주시</option>
															<option>경기도 동두천시</option>
															<option>경기도 부천시</option>
															<option>경기도 성남시</option>
															<option>경기도 수원시</option>
															<option>경기도 시흥시</option>
															<option>경기도 안산시</option>
															<option>경기도 안성시</option>
															<option>경기도 안양시</option>
															<option>경기도 양주시</option>
															<option>경기도 여주시</option>
															<option>경기도 오산시</option>
															<option>경기도 용인시</option>
															<option>경기도 의왕시</option>
															<option>경기도 의정부시</option>
															<option>경기도 이천시</option>
															<option>경기도 파주시</option>
															<option>경기도 평택시</option>
															<option>경기도 포천시</option>
															<option>경기도 하남시</option>
															<option>경기도 화성시</option>
															<option>인천광역시</option>
															<option>전라남도 강진군</option>
															<option>경상남도 거제시</option>
															<option>경상남도 거창군</option>
															<option>경상북도 경산시</option>
															<option>경상북도 경주시</option>
															<option>충청남도 계룡시</option>
															<option>경상북도 고령군</option>
															<option>경상남도 고성군</option>
															<option>전라북도 고창군</option>
															<option>전라남도 고흥군</option>
															<option>전라남도 곡성군</option>
															<option>충청남도 공주시</option>
															<option>전라남도 광양시</option>
															<option>광주광역시 광주시</option>
															<option>충청북도 괴산군</option>
															<option>전라남도 구례군</option>
															<option>경상북도 구미시</option>
															<option>전라북도 군산시</option>
															<option>경상북도 군위군</option>
															<option>충청남도 금산군</option>
															<option>기타지역</option>
															<option>전라북도 김제시</option>
															<option>경상북도 김천시</option>
															<option>경상남도 김해시</option>
															<option>전라남도 나주시</option>
															<option>전라북도 남원시</option>
															<option>경상남도 남해군</option>
															<option>충청남도 논산시</option>
															<option>충청북도 단양군</option>
															<option>전라남도 담양군</option>
															<option>충청남도 당진시</option>
															<option>대구광역시 대구시</option>
															<option>대전광역시 대전시</option>
															<option>전라남도 목포시</option>
															<option>전라남도 무안군</option>
															<option>전라북도 무주군</option>													
															<option>경상북도 문경시</option>
															<option>경상남도 밀양시</option>
															<option>충청남도 보령시</option>
															<option>전라남도 보성군</option>
															<option>충청북도 보은군</option>
															<option>경상북도 봉화군</option>
															<option>부산광역시 부산시</option>
															<option>전라북도 부안군</option>
															<option>충청남도 부여군</option>
															<option>경상남도 사천시</option>
															<option>경상남도 산청군</option>
															<option>경상북도 상주시</option>
															<option>제주도 서귀포시</option>
															<option>충청남도 서산시</option>													
															<option>충청남도 서천군</option>
															<option>경상북도 성주군</option>
															<option>세종특별자치시 세종시</option>
															<option>전라북도 순창군</option>
															<option>전라남도 순천시</option>
															<option>전라남도 신안군</option>
															<option>충청남도 아산시</option>
															<option>경상북도 안동시</option>
															<option>경상남도 양산시</option>
															<option>전라남도 여수시</option>
															<option>전라남도 영광군</option>
															<option>경상북도 영덕군</option>
															<option>충청북도 영동군</option>
															<option>전라남도 영암군</option>													
															<option>경상북도 영양군</option>
															<option>경상북도 영주시</option>
															<option>경상북도 영천시</option>
															<option>충청남도 예산군</option>
															<option>경상북도 예천군</option>
															<option>충청북도 옥천군</option>
															<option>전라남도 완도군</option>
															<option>전라북도 완주군</option>
															<option>경상북도 울릉군</option>
															<option>울산광역시 울산시</option>
															<option>경상북도 울진군</option>
															<option>충청북도 음성군</option>
															<option>경상남도 의령군</option>
															<option>경상북도 의성군</option>													
															<option>전라북도 익산시</option>
															<option>전라북도 임실군</option>
															<option>전라남도 장성군</option>
															<option>전라북도 장수군</option>
															<option>전라남도 장흥군</option>
															<option>전라북도 전주시</option>
															<option>전라북도 정읍시</option>
															<option>제주도 제주시</option>
															<option>충청북도 제천시</option>
															<option>충청북도 증평군</option>
															<option>전라남도 진도군</option>
															<option>전라북도 진안군</option>
															<option>경상남도 진주시</option>
															<option>충청북도 진천군</option>													
															<option>경상남도 창녕군</option>
															<option>경상남도 창원시</option>
															<option>충청남도 천안시</option>
															<option>경상북도 청도군</option>
															<option>경상북도 청송군</option>
															<option>충청남도 청양군</option>
															<option>충청북도 청주시</option>
															<option>충청북도 충주시</option>
															<option>경상북도 칠곡군</option>
															<option>충청남도 태안군</option>
															<option>경상남도 통영시</option>
															<option>경상북도 포항시</option>
															<option>경상남도 하동군</option>
															<option>경상남도 함안군</option>													
															<option>경상남도 함양군</option>
															<option>전라남도 함평군</option>
															<option>경상남도 합천군</option>
															<option>전라남도 해남군</option>
															<option>충청남도 홍성군</option>
															<option>전라남도 화순군</option>
														</select>
											</label>
											<!-- 지역선택 end -->	
											<label>창단 년도
													<select name="teamfoundyear" id="teamfoundyear">
																<option value="non_select">- 창단 년도  -</option>
																<c:forEach var="i" begin="1961" end="2021" step="1">
																	<option value = "${i}">${i }</option>
																</c:forEach>
													</select>
											</label>	
											<!-- 창단년도 end -->
											<label>실력
													<select name="teamlevel" id="teamlevel">
														<option value="non_select">- 실력 선택 -</option>
														<option>상</option>
														<option>중상</option>
														<option>중</option>
														<option>중하</option>
														<option>하</option>
													</select>
											</label>			
											<!-- 실력 end -->
											<label>나이(부터)
												<select name="startage" id="startage">
													<option value="non_select">- 나이 선택 -</option>
													<c:forEach var="i" begin="10" end="60" step="10">
														<option>${i }대 초반</option>
														<option>${i }대 중반</option>
														<option>${i }대 후반</option>
													</c:forEach>
												</select>
											</label>	
											<!-- 나이(부터) end -->
											<label>나이(까지)
												<select name="stopage" id="stopage">
													<option value="non_select">- 나이 선택 -</option>
													<c:forEach var="i" begin="10" end="60" step="10">
														<option>${i }대 초반</option>
														<option>${i }대 중반</option>
														<option>${i }대 후반</option>
													</c:forEach>
												</select>
											</label>	
											<!-- 나이(까지) end -->  
											<label>유니폼색
												<input type="text" name="uniformcolor" id="uniformcolor" placeholder="ex) 파란색 상의"/>
											</label>		
											<!-- 유니폼색 end -->	
											<label>색 어웨이
												<input type="text" name="uniformaway" id="uniformaway" placeholder="ex) 노란 줄무늬"/>	
											</label>
											<!-- 색 어웨이 end -->
											<label>팀 유형
												<input type="text" name="controllabel" id="controllabel" placeholder="ex) 동아리 풋살팀"/>	
											</label>
											<!-- 팀 유형 end -->
											<label>팀 로고
												<div class="filebox"> 
													<%-- <%-- 파일명이 보이는 부분 --%>
													<input class="uploadname" value="파일 선택" disabled="disabled">
													<%-- 임의로 만든 파일첨부 버튼 --%>
													<label for="ex_filename">파일 선택</label> 
													<%-- 진짜 파일첨부 되는 부분 --%>
													<input type="file" id="ex_filename" name="teamlogo_image" class="upload-hidden">
													<%-- 파일 삭제 버튼 --%>
													<input type="button" value="첨부삭제" onclick="cancleFile('teamlogo_image')">
												</div>	
											</label>
													<!-- filebox end -->
		 									<div class="actions_div" id="actions_div">
													<ul class="actions">
														<li><input type="button" value="생성" class="primary" onclick="javascript:sendIt();"/></li>
														<li><input type="reset" value="초기화"/></li>
													</ul>
		 									</div>
											<!-- 전송 end -->
			  							</form>	
			  							<!-- createform end  -->
		  							</div>
		  							<!-- formwrap end -->
	  							</div>
	  							<!-- createwrap end -->
							</div>
							<!-- content end -->
						</c:otherwise>
					</c:choose>

			</section>

	<!-- Scripts -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.0.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/team/teamcreate.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script> var contextPath = "${pageContext.request.contextPath}";</script>
	<script>
		jQuery.browser = {};
		(function () {
		    jQuery.browser.msie = false;
		    jQuery.browser.version = 0;
		    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
		        jQuery.browser.msie = true;
		        jQuery.browser.version = RegExp.$1;
		    }
		})();
		function cancleFile(teamlogo){
			var fcheck=false;
			if($.browser.msie){
				$('input[name="'+teamlogo+'"]').replaceWith(('input[name="'+teamlogo+'"]').clone(true));
				fcheck=true;
			}else{
				$("input[name='"+teamlogo+"']").val("");
				fcheck=true;
			}
			if(fcheck){
				$('.uploadname').val("파일 선택");
			}
		}	
	</script>
	
</body>
</html>