<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인 페이지</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script> <!--  절대경로를 el로 처리함 -->
<script type="text/javascript">


</script>

</head>
<body>
<h1>아이디 찾기</h1>
<h5>고객님의 정보와 일치하는 아이디 목록입니다</h5>

<input type="text" name="memberid" value="${ member2 }" readonly>

</body>
</html>