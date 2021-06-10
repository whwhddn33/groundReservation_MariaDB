<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[HIGROUND]Board</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board/board.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body>

	<!-- header -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- contents -->
	<section id="main" class="wrapper qna">
				<div class="inner">
					<header class="major">
						<h2>게시판이름</h2><!-- 게시판이름 -->
					</header>
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
							<tbody id = contentslist>
								<tr onclick="location.href='${pageContext.request.contextPath}/board/boardView.bo?&boardnum=2&num=${board.getListnum()}'">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<a href="${pageContext.request.contextPath}/board/boardWrite.bo?num=${category}" class="small btn1">글쓰기</a>
					</div>
				</div>
			</section>
</body>
<script>
$(document).ready(function(){
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	function writeContents(){
		$.ajax({
			url : ctx+"/",
			type : "get",
			data: {},
			dataType:"JSON"
		})
		.done(function(data){
			$(#contentslist).html()
		})
		.fail(function(xhr,error){
			
		})
	}	
})

</script>

	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/jquery.dropotron.min.js"></script>
	<script src="/assets/js/jquery.scrollex.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
</html>