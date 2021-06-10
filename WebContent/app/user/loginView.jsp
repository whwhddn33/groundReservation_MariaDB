<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <div class="wrap_remember">
        <span class="wrap_checkbox">
          <input type="checkbox" id="remember_id">
          <label for="remember_id">
            <i class="far fa-check-square fa-1x"></i>
            <strong>Remember me</strong>
          </label>
        </span>
        <span class="wrap_forget_pw">
          <a href="#" class="forget_pw">Forget password?</a>
        </span>
      </div>

      <button id="login_btn" type='button' class='signin_btn' onclick="tryLogin();">Login</button>
      
      <div class="naver_login" id="naverIdLogin"></div>
    </form>

    <div>
      <p class='accunt_desc'>Not a member?</p>
      <a href="${pageContext.request.contextPath}/app/user/joinView.me" class="link_account">Create account</a>
    </div>
  </body>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
  <script src="${pageContext.request.contextPath}/assets/js/user/loginView.js"></script>
</html>