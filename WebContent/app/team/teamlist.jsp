<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[HIGROUND]팀 목록</title>
<meta charset="utf-8" http-equiv="Content-Type" content="text/html" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/team/teamlist.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/team/teamsidebar.css" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
</head>
<body class="is-preload">
	<c:set var="list" value="${requestScope.teamList}" />
	<c:set var="nowPage" value="${requestScope.nowPage}" />
	<c:set var="startPage" value="${requestScope.startPage }" />
	<c:set var="endPage" value="${requestScope.endPage }" />
	<c:set var="totalCnt" value="${requestScope.totalCnt }" />
	<c:set var="totalPage" value="${requestScope.totalPage }" />
	
	
			
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		
	<!-- Main -->
	 	<!-- 팀 목록 -->
			<secion id="main" class="wrapper sidebar left">
				<div class="inner">
					<div class="content teamlist">
						<div class="title main-title">
								<h2 class="title-name">팀 목록</h2>
						</div>	
							<div class="team-table-wrapper">
								<table class="alt">
									<thead>
										<tr>
											<th width="50%">팀 명</th>
											<th width="20%">연령대</th>
											<th width="19%">지역</th>
											<th width="11%">팀 유형</th>
										</tr>
										<c:choose>
											<c:when test="${list!=null}">
												<c:forEach var="team" items="${list}">
													<tr align="center" valign="middle"
														onmouseover="this.style.backgroundColor='#e0f7fa'"
														onmouseout="this.style.backgroundColor=''">
														<td><a href="${pageContext.request.contextPath}/team/TeamDesc.te?teamNo=${team.getTeamNo()}">
																${team.getTeamName() } </a></td>
														<td>${team.getStartAge() } ~ ${team.getStopAge() }</td>
														<td>${team.getTeamLocal() }</td>
														<td>${team.getControlLabel() }</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr hegiht="50px" align="center">
														<td colspan="5">등록된 팀이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
								</table>
							</div>
						<!-- 페이징 -->
									<div align="center">
										<ul class="pagination">
												<li>
													<c:choose>
														<c:when test="${nowPage>1}">
															<a href="${pageContext.request.contextPath}/team/TeamList.te?page=${nowPage-1}" class="button">이전</a>
														</c:when>
													</c:choose> <c:forEach var="i" begin="${startPage}" end="${endPage}">
													<c:choose>
														<c:when test="${i == nowPage }">
																[${i}]
															</c:when>
														<c:otherwise>
															<a href="${pageContext.request.contextPath}/team/TeamList.te?page=${i}" class="page active">${i}</a>
														</c:otherwise>
													</c:choose>
													</c:forEach> <c:if test="${nowPage<totalPage}">
														<a href="${pageContext.request.contextPath}/team/TeamList.te?page=${nowPage+1}" class="button">다음</a>
													</c:if>
												</li>
										</ul>
									</div>			
					</div>
			</secion>


			
<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>


















