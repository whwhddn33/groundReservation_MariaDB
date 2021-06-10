<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>[HIGROUND]자유게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board/board.css" />
		<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
		<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
	</head>
	<body class="is-preload">
		<c:set var="list" value="${requestScope.BoardList}"/>
		<c:set var="nowPage" value="${requestScope.nowPage}"/>
		<c:set var="startPage" value="${requestScope.startPage }"/>
		<c:set var="endPage" value="${requestScope.endPage }"/>
		<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
		<c:set var="totalPage" value="${requestScope.totalPage }"/>
				
		<!-- header -->
		<jsp:include page="/header.jsp"></jsp:include>
		

		<!-- Main -->
			<section id="main" class="wrapper qna">
				<div class="inner">
					<header class="major">
						<h2>자유게시판</h2>
					</header>

					<!-- Content -->
					<div class="content">
						<p>전체 글 개수 : ${totalCnt}</p>
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
											<tr id = contentslist onclick="location.href='${pageContext.request.contextPath}/board/boardView.bo?&boardnum=2&num=${board.getListnum()}'">
												<td>${board.getListnum()}</td>
												<td>${board.getListtitle()}</td>
												<td>${board.getUserid()}</td>
												<td>${board.getListdate()}</td>
												<td>${board.getReadcnt()}회</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr hegiht="50px" align="center">
											<td colspan="5">등록된 게시물이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
							<div align="center">
								<ul class="pagination">
										<li>
											<c:choose>
												<c:when test="${nowPage>1}">
													<a href="${pageContext.request.contextPath}/board/boardList.bo?num=2&page=${nowPage-1}" class="button">이전</a>
												</c:when>
											</c:choose> 
											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:choose>
													<c:when test="${i == nowPage }">
															[${i}]
														</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath}/board/boardList.bo?num=2&page=${i}" class="page active">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach> 
											<c:if test="${nowPage<totalPage}">
												<a href="${pageContext.request.contextPath}/board/boardList.bo?num=2&page=${nowPage+1}" class="button">다음</a>
											</c:if>
										</li>
								</ul>
							</div>	
						<a href="${pageContext.request.contextPath}/board/boardWrite.bo?num=${category}" class="small btn1">글쓰기</a>
					</div>
				</div>
			</section>

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