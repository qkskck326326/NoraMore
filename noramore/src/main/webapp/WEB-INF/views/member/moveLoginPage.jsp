<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginPage.css" />
</head>
<body>

<div id="loginForm"  >	
	<form id="box_in" action="login.do" method="post">
	<h1 align="center">로그인</h1>
	<label>아이디 : <input type="text" name="userId" id="uid" class="pos" placeholder="아이디"></label>
	<br><br>
	<label>암 호 : <input type="password" name="userPwd" id="upwd" class="pos" placeholder="암호"></label>
	<br><br>
	<label for="remember-check">
            	  <input type="checkbox" id="remember-check">아이디 저장하기
    </label>
	<input type="submit" value="로그인">
	</form>
</div>

</body>
</html>