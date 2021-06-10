<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Slate by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>[HIGROUND]FAQ</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board/board.css" />
		<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
		<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
	</head>
	<body class="is-preload">

				
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		

		<!-- Main -->
		<section id="main" class="wrapper faq">
			<div class="inner">
				<header class="major">
					<h2>FAQ</h2>
					<p>자주 묻는 질문</p>
				</header>

				<!-- Content -->
					<div class="content">
						<table border="1">
							<tbody>
								<tr>
									<td class="toggleTr">Q. 환불을 받고싶어요</td>
									<td class="hideTr">
										<div>
											A. 카카오톡 채널로 아래의 내용을 작성해서 보내주시면 확인 후 안내해 드립니다.<br><br>
											예약한 구장의 환불 규정을 먼저 확인 후 문의해주세요<br>
											(평일, 주말 10시 ~ 23시)<br><br>
											- 예약 구장 : <br>
											- 예약 날짜, 시간 : <br> 
											- 예약자명 : <br>
											- 결제수단 (가상계좌, 카드결제) : <br>
											- 환불정보 (은행명,계좌번호,예금주) : <br>
										</div>	  
									</td>
								</tr>
								<tr>
									<td class="toggleTr">Q. 환불 규정을 확인하고 싶어요.</td>
									<td class="hideTr">
										<div>
											A. 환불 규정 확인은 다음과 같이 가능합니다.<br><br>
											- PC<br>
											1) 사이트 접속<br>
											2) 구장 선택 (예약 버튼 클릭)<br>
											3) 아래 환불규정, 변경규정 확인하기<br><br>
											- MOBILE<br>
											1) 사이트 혹은 앱 접속<br>
											2) 구장 선택<br>
											3) 구장 사진 클릭<br>
											4) 아래 환불규정, 변경규정 확인하기<br>
										</div>
									</td>
								</tr>
								<tr>
									<td class="toggleTr">Q. 구장 연락처를 확인하고 싶어요.</td>
									<td class="hideTr">
										<div>
											A. 구장 연락처는 예약이 확정되면 카카오톡으로 자동 안내 됩니다.
										</div>
									</td>
								</tr>
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