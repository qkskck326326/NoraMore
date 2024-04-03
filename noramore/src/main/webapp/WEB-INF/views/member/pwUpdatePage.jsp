<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 재설정 페이지</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<h1>비밀번호 재설정</h1>
<h5>비밀번호를 변경해주세요</h5>
<form action="pwChange.do" method="post" id="idBox" onsubmit="return validate();">
	아이디 : <input id="memberid" value="${ member2.memberID }"><br>
	비밀번호 : <input type="text" name="memberPWD" id="memberpwd"><br>
	재 확인 : <input type="text" name="memberPWD2" id="memberpwd2">
<input type="submit" value="확인">
</form>



</body>
</html>