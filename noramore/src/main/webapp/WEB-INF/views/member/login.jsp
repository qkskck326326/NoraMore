<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
</head>
<body>

<h2>Login</h2>

<%-- 로그인 폼 --%>
	<form name = "로그인" action="login.do" method="post"> <!-- 로그인 Survlet 로 보냄  -->
		<label>아이디: <input type="text" name="userId" id="uid" class="pos"></label><br> <!-- getparameter과 같아야함 -->
		<label>암호 : <input type="password" name="userPwd" id="upwd" class="pos"></label><br> <!-- name이 컨트롤러로 감 -->
		<input type="submit" value="로그인">
	</form>

</body>
</html>