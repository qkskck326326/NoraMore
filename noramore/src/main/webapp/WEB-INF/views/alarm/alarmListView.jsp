<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 확인 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<h2 class="title">알람</h2>
<br>

	<table class="table" align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번호</th>
			<th>금지어</th>
			<th>등록일자</th>
			<th>관리</th>
		</tr>
		
		<c:forEach items="${ requestScope.list }" var="a">
			<tr>
				<td>${ a.alarmId }</td>
				<td>${ a.alarm }</td>
				<td>${ a.registDate }</td>
				<td><button class="deletefb" onclick="return delFb('${ f.fbWord }');">삭제</button></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>