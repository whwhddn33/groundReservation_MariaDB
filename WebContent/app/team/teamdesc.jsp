<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE HTML>
<html>
<head>
<title>[HIGROUND]${requestScope.teamName }</title>
<meta charset="utf-8" http-equiv="Content-Type" content="text/html"/>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/team/teamdesc.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">
		
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>

		<!-- Main -->
			<section id="main" class="wrapper sidebar left">
				<div class="inner">
					<!-- 내용 -->
						<c:set var="teamName" value="${requestScope.teamName }"/>
						<c:set var="teamLocal" value="${requestScope.teamLocal }"/>
						<c:set var="teamLevel" value="${requestScope.teamLevel }"/>
						<div class="content teamdesc">
							<div class="title main-title">
							    <h2 class="title-name">팀 정보</h2>
  							</div>
  							<!-- title main-title end -->
  							<div class="desc_wrap">
	  							<div class="team_logo">
									<div class="logo_circle">
									<div class="logo_image">
	  								</div>
									<!-- logo_circle end -->							
									</div>
	  								<!-- logo_image end -->
	  							</div>	
	  							<!-- team_logo end -->
	  							<div class="team_info">
	  								<div class="info_wrap">
		  								<div class="team_name_view">
		  									${teamName }
		  								</div>
		  								<!-- team_name_view end -->
		  								<div class="info_list">
		  									<ul>
		  										<li>지역 : ${teamLocal }</li>
		  										<li>레벨 : ${teamLevel }</li>
		  									</ul>
		  								</div>
		  								<!-- info_list end -->
		  								<div class="join_button"> 
		  									<a href = "${pageContext.request.contextPath}/team/TeamJoin.te?teamNo=${teamNo}" class="button small">가입하기</a>
		  								</div>
		  								<!-- join_button end -->
	  								</div>
	  								<!-- info_wrap end -->
	  							</div>	
	  							<!-- team_info end -->
<!-- 	  							<div class="middle_wrap">
		  							<div class="winning_rate">
		  								<div class="table_wrap">
			  								<table class="winning_table">
			  									<thead>
									              <tr>
									                <th rowspan="2">총</th>
									                <th rowspan="2">승</th>
									                <th rowspan="2">무</th>
									                <th rowspan="2">패</th>
									                <th rowspan="2">승률</th>
									                <th colspan="2">경기당</th>
									              </tr>
									              <tr>
									                <th>득점</th>
									                <th>실점</th>
									              </tr>
									            </thead>
									            <tbody>
									              <tr>
									                <td>-</td>
									                <td>-</td>
									                <td>-</td>
									                <td>-</td>
									                <td>-</td>
									                <td>-</td>
									                <td>-</td>
									              </tr>
									           </tbody>
			  								</table>
		  								</div>
		  								table_wrap end
		  							</div>
		  							winning_rate end
		  							<div class="score_chart">
		  								<div class="chart_wrap">
		  									<div class="chart" id="chart">
		  									</div>
		  									chart end
		  								</div>
		  								chart_wrap end
		  							</div>
		  							score_chart end
	  							</div> -->
	  							<!-- middle_wrap end -->
	  							<div class="member_wrap">
	  								<div class="blank_space">
	  									선수 명단
	  								</div>
	  								<!-- blank_space end -->
	  								<table class="member_list">
										<thead>
											<tr>
												<th>이름</th>
												<th>닉네임</th>
												<th>키</th>
												<th>몸무게</th>
												<th>사용발</th>
												<th>주포지션</th>
												<th>부포지션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" items="${memberList}">
											<tr align="center">
												<td>${i.username}</td>
												<td>${i.nickname}</td>
												<td>${i.userheight}</td>
												<td>${i.userweight}</td>
												<td>${i.usefoot}</td>
												<td>${i.mainposition}</td>
												<td>${i.minorposition}</td>
											</tr>
											</c:forEach>
										</tbody>
										<tfoot>
										</tfoot>
									</table>
	  							</div>
<!-- 	  							<div class="schedule_wrap">
	  								<div class="blank_space">
	  									경기 일정
	  								</div>
	  								blank_space end
	  								<table class="match_schedule">
										<thead>
											<tr>
												<th width="7%">번호</th>
												<th width="20%">날짜</th>
												<th width="53%">상대 팀명</th>
												<th width="20%">경기 장소</th>
											</tr>
										</thead>
										<tbody>
											<tr hegiht="50px" align="center">
												<td colspan="5">경기 일정이 없습니다.</td>
											</tr>
										</tbody>
										<tfoot>
										</tfoot>
									</table>
	  							</div> -->
	  							<!-- schedule_wrap end -->
							</div>
							<!-- desc_wrap end -->
						</div>
						<!-- content end -->
<!-- Sidebar -->
						<div class="sidebar">
 							<div class="joined_team">
 								가입팀명
 							</div>
 							<!-- joined_team end -->
 							<div class="create_team">
 								새 팀 생성하기
 							</div>
 							<!-- create_team end -->
						</div>
				</div>
			</section>

	<!-- Scripts -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/team/teamdesc.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script> var contextPath = "${pageContext.request.contextPath}";</script>
</body>
</html>