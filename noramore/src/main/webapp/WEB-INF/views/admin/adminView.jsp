<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br><br><br><br><br><br>
<h2 class="title">관리자 메인</h2>
<br>
	<table class="table" align="center" border="1" cellspacing="0" width="400">
		<tr>
			<th>어제 가입한 회원</th>
			<th>${ flow.enrollYesterday } 명</th>
		</tr>
	</table>
	<table class="table" align="center" border="1" cellspacing="0" width="400">
			<th>오늘 가입한 회원</th>
			<th>${ flow.enrollToday } 명</th>
	</table>
	<br>
	<table class="table" align="center" border="1" cellspacing="0" width="400">
			<th>어제 탈퇴한 회원</th>
			<th>${ flow.withdrawalYesterday } 명</th>
	</table>
	<table class="table" align="center" border="1" cellspacing="0" width="400">
			<th>오늘 탈퇴한 회원</th>
			<th>${ flow.withdrawalToday } 명</th>
	</table>
</body>

</html>