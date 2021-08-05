<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link href="${pageContext.request.contextPath}/assets/css/user/common.css" type="text/css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/css/user/loginView.css" type="text/css" rel="stylesheet" />
	<title>Insert title here</title>
</head>
<body class='doc_container'>
	
    <div class='login_logo'>
      <i class="far fa-user-circle fa-3x"></i>
    </div>
    <strong class='login_tit'>LOGIN</strong>
    <form class='form_wrap'  action="${pageContext.request.contextPath}/app/user/UserLoginOk.me" method="post" name="loginform">
      <div class='input_section'>
        <span class='input_icon'>
          <i class="far fa-user-circle fa-3x"></i>
        </span>
        <span class="input_text_wrap">
          <input id="user_id" type='text' class='input_text' placeholder="Userid" name="userid">
        </span>
      </div>
      <div class='input_section'>
        <span class='input_icon lock'>
          <i class="far fa-lock fa-2x"></i>
        </span>
        <span class="input_text_wrap">
          <input type='password' class='input_text' placeholder="Password" autocomplete="off" name="userpw">
        </span>
      </div>

      <button id="login_btn" type='button' class='signin_btn' onclick="tryLogin();">Login</button>
      
    </form>
  </body>
<script src="${pageContext.request.contextPath}/assets/js/user/loginView.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
var check = "${requestScope.check}";
$(document).ready(function(){
	console.log(check);
	if (check == 'notOK') {
		Swal.fire({
        icon: 'warning',
        title: '로그인 실패..!',
        text: '아이디와 비밀번호를 확인해주세요.',
    });
	}
});
</script>
</html>