<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>[HIGROUND]REVIEW</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
		<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
	</head>
	<body class="is-preload">

				
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		

		<!-- Main -->
			<section id="main" class="wrapper sidebar review left">
				<div class="inner">

					<header class="major">
						<h2>REVIEW</h2>
						<p>다양한 후기로 더 꼼꼼히</p>
					</header>

					<!-- Content -->
					<div class="content">
						<table border="1">
							<thead>
								<tr>
									<td>이미지</td>
									<td>닉네임</td>
									<td>제목</td>
									<td>날짜</td>
									<td>조회</td>
								</tr>
							</thead>
							<tbody>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td><img src="/images/review1.jpg" class="img"></td>
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-02-21</td>
									<td>0회</td>
								</tr>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td><img src="/images/review2.jpg" class="img"></td>
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-03-05</td>
									<td>0회</td>
								</tr>
								<tr onclick="location.href='/app/board/view.jsp'">
									<td><img src="/images/review3.jpg" class="img"></td>
									<td>PLAYER1</td>
									<td>TITLE</td>
									<td>2021-03-07</td>
									<td>0회</td>
								</tr>
							</tbody>
						</table>
						<a href="/app/board/write.jsp" class="button small">글쓰기</a>
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
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.dropotron.min.js"></script>
			<script src="/assets/js/jquery.scrollex.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>