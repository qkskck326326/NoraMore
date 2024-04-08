<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원관리 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/alarm.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br><br><br><br><br><br>
<h2 class="title">알림</h2>
<br>

	<table class="table" align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번호</th>
			<th>내 용</th>
			<th>발신일</th>
			<th>상 태</th>
		</tr>
		
		
		<!-- title, context, senderId 모두 a태그 적용 + a 태그 onclick 시 확인여부 'Y'로 update 요청보내기 -->
		<c:forEach items="${ requestScope.list }" var="a">

		</c:forEach>
	</table>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />
</body>

</html>