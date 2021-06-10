<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>[HIGROUND]구장리스트</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/groundregist.css" />
<link href="${pageContext.request.contextPath}/assets/css/user/indexBox.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favi.png" type="image/x-icon">
</head>
<body class="is-preload">
	<!-- header -->
	<jsp:include page="/header.jsp"></jsp:include>

	<section id="main" class="wrapper sidebar left">
		<div id="registlistinner" class="inner">
			<div id=mainStringwrapper>
				<div id=mainString>등록구장목록</div>
				<a href="${pageContext.request.contextPath}/futsalFrontController/registlistLoad.fu?epuserid=${login_session.epuserid}">리스트</a>
			</div>
				<div class=contents>
					<table>
						<tr>
							<th>번호</th>
							<th>이미지</th>
							<th>구장이름</th>
							<th>주소</th>
							<th>구장면적</th>
							<th>해시태그</th>
							<th>수정</th>
						</tr>
						<c:forEach varStatus="status" var="i" items="${loadlist}">
							<tr>
								<td>${status.count}</td>
								<td><img alt="이미지없음" src="<%-- ${pageContext.request.contextPath}/app/futsal/img/${i.imgrealname} --%>"/></td>
								<td>${i.groundname}</td>
								<td>${i.useraddr}</td>
								<td>${i.groundarea}</td>
								<td>${i.hashTag}</td>
								<td><a href = "${pageContext.request.contextPath}/delList.fu?listnum=${i.groundnum}&epuserid=${login_session.epuserid}">삭제</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
		</div>
	</section>
	


</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
/* $(document).ready(function() {
	var epuserid = "${login_session.getEpuserid()}"
	var tags = '';
	var lastsign = 0;
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		$.ajax({
			url : ctx+"/futsalFrontController/registlistLoad.fu",
			type : "POST",
			data : {"epuserid" : epuserid},
			dataType : "json"
		})
		.done(function(data) {
			console.log("통신성공");
			console.log(data);
			tagsStack(data, tags);
		}).fail(function(xhr, error) {
			console.log("통신실패");
			$(".contents").text(".fail");
			console.log("code:" + xhr.status
					+ "\n" + "message:"
					+ xhr.responseText + "\n"
					+ "error:" + error);
		})
	function tagsStack(data) {
		console.log(data.json.length)
		tags += "<table><tr><th>번호</th><th>이미지</th><th>구장이름</th><th>주소</th><th>구장면적</th><th>해시태그</th><th>수정</th></tr>"
		for (i = 0; i < data.json.length; i++) {
			tags +="<tr>"
			tags +="<td>번호 : " +i+ "</td>"
			tags +="<td><img alt='이미지' src=''></td>"
			tags +="<td>구장이름 : "+ data.json[i].groundname + "</td>"
			tags +="<td>주소 : " + data.json[i].useraddr+ "</td>"
			tags +="<td>구장면적 : "+ data.json[i].groundarea + "</td>"
			tags +="<td>" + data.json[i].hashTag+ "</td>"
			tags +="<td><a href = '${pageContext.request.contextPath}/delList.fu?listnum="+data.json[i].groundnum+"' id = 'deletebtn' type = button >삭제</a></td>";
			tags +="</tr>"
		}
		tags +="</table>";
		$(".contents").html(tags);
	}
}); */

</script>

</html>