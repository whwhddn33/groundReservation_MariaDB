<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>[HIGROUND]</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/board/board.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="./images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="/header.jsp"></jsp:include>
	<!-- Banner -->
	<section id="banner">
		<article>
			<img src="images/visual01.jpg" alt="" />
			<div class="inner">
				<h2><a href="#">Magna tempus. Sed feugiat.</a></h2>
			</div>
		</article>
		<article>
			<img src="images/visual02.jpg" alt="" />
			<div class="inner">
				<h2>
					<a href="#">Aliquam veroeros nullam.</a>
				</h2>
			</div>
		</article>

		<article>
			<img src="images/visual03.jpg" alt="" />
			<div class="inner">
				<h2>
					<a href="#">Consequat dolore adipiscing.</a>
				</h2>
			</div>
		</article>
	</section>
	<div id="faq">
		<a href="app/board/faq.jsp"><i class="fas fa-comment-dots"></i>도움말</a>
	</div>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/loginsingup.js"></script>
</body>
</html>