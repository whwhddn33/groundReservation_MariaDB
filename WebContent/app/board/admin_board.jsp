<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>[HIGROUND]게시판 관리하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">
	<c:set var="list" value="${requestScope.BoardList}" />

	<!-- header -->
	<jsp:include page="/header.jsp"></jsp:include>

	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">

			<header class="major">
				<h2>게시판 관리하기</h2>
			</header>
			
			<a onclick="addBoard()" class="button small">추가</a>
			
			<!-- Content -->
			<div class="content">
			
				<!-- Board Menu Start -->
				<div class="AdminBoardWrap">
					<div class="parentMenu">
						<c:choose>
							<c:when test="${list != null and fn:length(list) > 0 }">
								<c:forEach var="board" items="${list}">
									<div class="item">
										<p>${board.getBoardname()}<a
												onclick="Delete(${board.getBoardnum()})">삭제</a><a
												onclick="modify(${board.getBoardnum()})">수정</a>
										</p>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
				
				<form
					action="${pageContext.request.contextPath}/board/adminWrite.bo"
					method="post" name="boardForm" class="boardForm">
					<input type="hidden" name="name" class="name" />
				</form>
				
				<form
					action="${pageContext.request.contextPath}/board/adminDelete.bo"
					method="post" name="delForm" class="delForm">
					<input type="hidden" name="num" class="num" />
				</form>
				
				<form
					action="${pageContext.request.contextPath}/board/adminModify.bo"
					method="post" name="modiForm" class="modiForm">
					<input type="hidden" name="modinum" class="modinum" /> <input
						type="hidden" name="modiname" class="modiname" />
				</form>
				
			</div>
		</div>
	</section>


	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<script>
	
		function addBoard(){
			let datas = prompt("추가할 게시판의 이름을 입력해주세요");
			$(".name").val(datas);
			$(".boardForm").submit();
		}
		
		function modify(num){
			let ans = prompt("수정할 이름을 입력해주세요");
			if(ans){
				$(".modinum").val(num);
				$(".modiname").val(ans);
				$(".modiForm").submit();
			}
		}
		function Delete(num){
			let ans = confirm("정말 삭제하시겠습니까?");
			if(ans){
				$(".num").val(num);
				$(".delForm").submit();
			}
		}
	</script>

</body>
</html>