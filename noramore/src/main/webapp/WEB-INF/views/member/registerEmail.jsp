<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증 완료</title>
</head>
<body>
	<script type="text/javascript">
		var memberEmail = '${memberEmail}';

		alert(memberEmail + '님 회원가입을 축하합니다. 이제 로그인이 가능 합니다. 확인버튼을 누르면 로그인 페이지로 이동합니다.');

		self.location = "/member/moveLoginPage";
	</script>
</body>
</html>