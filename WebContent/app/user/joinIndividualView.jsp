<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/user/common.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/user/joinView.css" type="text/css" rel="stylesheet" />
</head>
<body class="doc-container">
    <div class="join-logo-title">개인회원 가입</div>
    <div class='join-form-wrapper'>

      <form class="form-container"  action="${pageContext.request.contextPath}/app/user/UserJoinOk.me" method="post" name="joinform">
        <p class="input-wrapper">
          <label><input type="text" name="userid" placeholder="아이디" class="input-text" onkeyup="checkId();"></label>  
          <span id="checkText" style="color:red; font-size:14px;"></span>
        </p>
        <p class="input-wrapper">
          <label><input type="password" name="userpw" placeholder="비밀번호(대문자,소문자,숫자,특수기호 포함)" class="input-text"></label>
        </p>
        <p class="input-wrapper">
          <label><input type="text" name="username" placeholder="이름" class="input-text"></label>
        </p>
        <p class="input-wrapper sex-list">
          <span id="male-btn">
            <input id="male-radio" name="usergender" type="radio" value="m" class="sex-list" checked><label>남</label>
          </span>
          <span id="female-btn">
            <input id="female-radio" name="usergender" type="radio" value="w" class="sex-list" ><label>여</label>
          </span>
        </p>
        <p class="input-wrapper">
          <label><input type="text" name="userphone" placeholder="핸드폰번호" class="input-text"></label>
        </p>

        <div class="input-wrapper flex">
          <input type="text" name="userpostcode" id="sample6_postcode" placeholder="우편번호" class="input-address-text">
          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="input-button"><br>
        </div>
        
        <input type="text" name="useraddr" id="sample6_address" placeholder="주소" class="input-address-text"><br>
        
        
        <div class="input-wrapper flex">
          <input type="text" name="useraddrdetail" id="sample6_detailAddress" placeholder="상세주소" class="input-address-text">
          <input type="text" name="useraddretc" id="sample6_extraAddress" placeholder="참고항목" class="input-address-text">
        </div>

        <input type="button" value="회원가입" onclick="sendit();" class="input-button">
      </form>
    </div>
  </body>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/user/joinView.js"></script>
</html>