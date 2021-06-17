<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Header -->
	<div id=indexBtn style="display: none"></div>
	<c:choose> 
		<c:when test="${enterprisenumber ne null}">
		<header id="header">
			<h1>
				<a href="${pageContext.request.contextPath}/index.jsp"><img src="images/logo.png" class="logo"></span></a>
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="#" class="submenu fa-angle-down">구장관리</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/futsalFrontController/futsallist.fu">구장현황</a></li>
							<li><a href="${pageContext.request.contextPath}/futsalFrontController/groundregistpage.fu">구장등록</a></li>
							<li><a href="${pageContext.request.contextPath}/futsalFrontController/registlistpage.fu?epuserid=${login_session.epuserid}">등록구장리스트</a></li>
						</ul>
						
					<!-- <li><a href="elements.html">Elements</a></li> -->
					<li><a href="${pageContext.request.contextPath}/app/user/logOut.me" class="button"
							id="logOutBtn">Log Out</a></li>
				</ul>
			</nav>
		</header>
		</c:when>
		<c:otherwise>
		<header id="header">
		
			<h1>
				<a href="${pageContext.request.contextPath}/index.jsp"><img
					src="${pageContext.request.contextPath}/images/logo.png"
					class="logo"></a>
			</h1>
	
			<nav id="nav">
				<ul>
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li><a href="#" class="submenu fa-angle-down">Ground</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/futsalFrontController/futsallist.fu">구장현황</a></li>
						</ul>
					</li>
					<li><a href="#" class="submenu fa-angle-down">Team</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/team/teamCreate.te">팀 생성</a></li>
							<li><a href="${pageContext.request.contextPath}/team/TeamList.te">팀 목록 보기</a></li>
						</ul>
					<c:choose>
						<c:when test="${login_session.userid eq 'admin'}">
						
							<li><a href="#" class="submenu fa-angle-down">Board</a>
								<ul>
									<li><a	href="${pageContext.request.contextPath}/board/boardList.bo?num=2">자유게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/board/boardList.bo?num=3">FAQ</a></li>
								</ul>
							</li>
							
							<li><a href="#" class="submenu fa-angle-down">Admin</a>
								<ul>
									<li><a	href="${pageContext.request.contextPath}/admin/board.bo">게시판관리</a></li>
									<li><a	href="${pageContext.request.contextPath}/admin/boardlist.bo">게시물관리</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="#" class="submenu fa-angle-down">Board</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/board/boardList.bo?num=2">자유게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/board/boardList.bo?num=3">FAQ</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
	
					<c:choose>
						<c:when test="${login_session ne null}">
							<li>
								<a href="${pageContext.request.contextPath}/app/user/logOut.me" class="button" id="logOutBtn">Log Out</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="#" onclick="signupBtnClick()" class="button">SignUp</a></li>
							<li><a href="#" onclick="loginBtnClick()" class="button">Login</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</header>
		</c:otherwise>
	</c:choose> 
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/loginsingup.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>

</html>