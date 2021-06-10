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
<div class="join-logo-title">기업회원 가입</div>
    <div class='join-form-wrapper'>

      <form class="form-container"  action="${pageContext.request.contextPath}/app/user/EnterpriseUserJoinOk.me" method="post" name="joinform">
        <p class="input-wrapper">
          <label><input type="text" name="epuserid" placeholder="아이디" class="input-text" onkeyup="checkId();"></label>  
          <span id="checkText" style="color:red; font-size:14px;"></span>
        </p>
        <p class="input-wrapper">
          <label><input type="password" name="epuserpw" placeholder="비밀번호(대문자,소문자,숫자,특수기호 포함)" class="input-text"></label>
        </p>
        
        <p class="input-wrapper">
          <label><input type="text" name="epusername" placeholder="업체명" class="input-text"></label>
        </p>
        
        <p class="input-wrapper">
          <label><input type="text" name="epuserphone" placeholder="기업전화번호" class="input-text"></label>
        </p>
        <p class="input-wrapper">
          <label><input type="text" name="epusernumber" placeholder="사업자번호" class="input-text"></label>
        </p>
        <input type="submit" value="회원가입" class="input-button">
      </form>
    </div>
  </body>
</html>