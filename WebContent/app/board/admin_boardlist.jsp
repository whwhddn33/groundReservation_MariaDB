<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>[HIGROUND]게시물 관리하기</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
	<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">
		<c:set var="userid" value="${session_id.getUserid()}"/>
		<c:set var="list" value="${requestScope.BoardList}" />
		
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">

					<header class="major">
						<h2>게시물 관리하기</h2>
					</header>
					<!-- Content -->
					<div class="content">
						<table border="1">
								<thead>
									<tr>
										<td>번호</td>
										<td>제목</td>
										<td>작성자</td>
										<td>날짜</td>
										<td>조회</td>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${list != null and fn:length(list) > 0 }">
										<c:forEach var="board" items="${list}">
											<tr onclick="location.href='${pageContext.request.contextPath}/admin/adminView.bo?num=${board.getListnum()}'">
												<td>${board.getListnum() }</td>
												<td>${board.getListtitle() }</td>
												<td>${board.getUsernum() }</td>
												<td>${board.getListdate() }</td>
												<td>${board.getReadcnt() }회</td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
								</tbody>
							</table>
					</div>
				</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<p class="copyright">&copy; Untitled Corp. All rights reserved. Lorem ipsum dolor sit amet feugiat tempus aliquam.</p>
					<ul class="menu">
						<li><a href="#">Terms<span> of Use</span></a></li>
						<li><a href="#">Privacy<span> Policy</span></a></li>
						<li><a href="#">Legal<span> Information</span></a></li>
					</ul>
				</div>
			</footer>

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