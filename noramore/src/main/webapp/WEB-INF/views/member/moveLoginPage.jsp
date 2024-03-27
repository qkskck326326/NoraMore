<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginPage.css" />
<script type="text/javascript">
function EnrollPage(){	
	location.href = "moveEnrollPage.do";
}

</script>


</head>
<body>

<div id="loginForm"  >	
	<form id="box_in" action="login.do" method="post">
	<h1 >로그인</h1>
	<label><input type="text" name="userId" id="uid" class="pos" placeholder=" Id" ></label>
	<label><input type="password" name="userPwd" id="upwd" class="pos" placeholder=" Password"></label>
	
	<label for="remember-check" id="remember-check">
            	  <input type="checkbox" > 아이디 저장하기
    </label>
	<input type="submit" value="로그인">

	<hr>
	<div id="find">
	<a href="">아이디찾기</a> / <a href="">비밀번호찾기</a>
	</div>
	
	<button class='social_login' id= "kakao" onclick="">카카오로 1초만에 로그인하기</button><br>
    <button class='social_login' id= "naver" onclick="">네이버로 1초만에 로그인하기</button><br>
	<button class='social_login' id= "google" onclick="">구글로 1초만에 로그인하기</button><br>
	
	<div id="enroll">아직도 회원이 아니신가요?</div>
	<button class='button' onclick="EnrollPage();">회원가입</button><br>
	
	</form>
	
</div>

</body>
</html>