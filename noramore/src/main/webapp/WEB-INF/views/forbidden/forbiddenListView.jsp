<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noramore</title>
</head>
<body>
<a href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시글관리</a>

<table align="center" border="1" cellspacing="0" width="700">
	<tr>
		<th>번호</th>
		<th>금지어</th>
		<th>등록일자</th>
	</tr>
	
	<c:forEach items="${ requestScope.list }" var="b">
		<tr>
			<td align="center">${ f.fbId }</td>
			<td align="center">${ f.fbWord }</td>
			<td align="center">${ f.registDate }</td>
		</tr>
	</c:forEach>

<%-- <c:import url="/WEB-INF/views/common/pagingView.jsp" /> --%>
</table>
</body>
</html>