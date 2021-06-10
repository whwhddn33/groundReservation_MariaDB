<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Slate by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>[HIGROUND]${board.getListtitle()}</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board/board.css" />
		<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
		<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
	</head>
	<body class="is-preload">
		<c:set var="file" value="${requestScope.file}" />
				
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		
		<!-- Main -->
			<section id="main" class="wrapper boardView">
				<div class="inner">

					<header class="major">
						<h2>게시글 보기</h2>
					</header>
						<section>
							<div class="titleWrap">
								${board.getListtitle()}
							</div>
							<div class="table-wrapper">
								<table>
									<thead>
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>작성자</th>
										</tr>
									</thead>
									<tbody style="background:#eaeaea">
										<tr>
											<td>${board.getListnum() }</td>
											<td>${board.getListtitle() }</td>
											<td>${board.getUserid() }</td>
										</tr>
									</tbody>
								</table>
								<table style="border-top:#eaeaea solid 2px">
									<thead>
										<tr>
											<th>날짜</th>
											<th>조회</th>
										</tr>
									</thead>
									<tbody style="background:#eaeaea">
										<tr>
											<td>${board.getListdate() }</td>
											<td>${board.getReadcnt() }회</td>
										</tr>
									</tbody>
								</table>
								<div class="viewWrap">
									<div>${board.getListcontents() }</div>
								</div>
								<c:choose>
									<c:when test="${file != null}">
										<div class="imgWrap">
											<div>첨부파일</div>
											<div>
												<a href="${pageContext.request.contextPath}/board/fileDownload.bo?
												filename=${file.getFilename()}&realname=${file.getRealname()}">
												${file.getRealname()}
												</a>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="imgWrap">
											<div>첨부 파일이 없습니다.</div>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="btnWrap">
									<a href="/board/listModi.bo?num=${board.getListnum() }" class="btn2 small">수정</a>
									<a onclick="Delete('/board/listDel.bo?num=${board.getListnum()}')" class="btn3 small">삭제</a>
								</div>
							</div>
						</section>
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
			<script>
				function Delete(){
					confirm("정말 삭제하시겠습니까?");
				}
			</script>
	</body>
</html>