<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/loginPage.css" />

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function enroll(){	
	location.href = "enrollPage.do";
}
<!-- <script src="/noramore/resources/js/kakao.min.js"></script> -->
</script>

</head>
<body>

<div id="loginForm">	
<div id="box_in">
	<form  name= "로그인" action="login.do" method="post">
		<h1 >로그인</h1>
		<label><input type="text" name="memberID" id="mid" class="pos" placeholder=" Id" ></label>
		<label><input type="password" name="memberPWD" id="mpwd" class="pos" placeholder=" Password"></label>
		
		<label for="remember-check" id="remember-check">
	            	  <input type="checkbox" > 아이디 저장하기
	    </label>
		<input type="submit" value="로그인">	
	</form>
	
		<hr>
		<div id="find">
		<a href="findIDPage.do">아이디찾기</a> / <a href="findPWPage.do">비밀번호찾기</a>
		</div>
		
		
		
		

		
		
	<div id="k_id_login" class="social_login" style="text-align:center;">
		<c:url var="kurl" value="${ requestScope.kakaourl }" />
		<a href="${ kurl }" class="cp">
			<img src="${ pageContext.servletContext.contextPath }/resources/images/kakao_login.png" alt="카카오 로그인">
		</a>
	</div> 
	    <button class='social_login' id= "naver" onclick="">네이버로 1초만에 로그인하기</button><br>
		<button class='social_login' id= "google" onclick="">구글로 1초만에 로그인하기</button><br>
		
		<div id="enroll">아직도 회원이 아니신가요?</div>
		<button class='button' onclick="enroll();">회원가입</button><br>
	
	<!-- 카카오 로그인 창으로 이동 -->
 
<br>
<!-- 네이버 로그인 창으로 이동 -->
<%-- <div id="naver_id_login" class="social_login" style="text-align:center;">
	<c:url var="nurl" value="${ requestScope.naverurl }" />
	<a href="${ kurl }" class="cp">
		<img src="resources/images/naver_login.png" 
		alt="네이버 로그인">
	</a>
</div>  --%>
	
	
	
</div>
	
</div>

</body>
</html>