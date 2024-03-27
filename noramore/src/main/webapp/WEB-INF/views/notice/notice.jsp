<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    --%>
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/side.css">
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>





<table align="center" border="1" cellspacing="0" width="700">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>첨부파일</th>
		<th>조회수</th>
	</tr>
	
	<c:forEach items="${ requestScope.list }" var="b">
		<tr>
			<td align="center">${ b.boardNum }</td>
			<td>			
			<c:if test="${ b.boardLev eq 2 }">
			&nbsp; &nbsp; ▶ 
			</c:if>			
			<c:if test="${ b.boardLev eq 3 }">
			&nbsp; &nbsp; &nbsp; &nbsp; ▶▶
			</c:if>			
			
			<c:url var="bd" value="bdetail.do">
				<c:param name="bnum" value="${ b.boardNum }" />
				<c:param name="page" value="${ nowpage }" />
			</c:url>
			<a href="${ bd }">${ b.boardTitle }</a>
			</td>
			<td align="center">${ b.boardWriter }</td>
			<td align="center">${ b.boardDate }</td>
			<td align="center">
			
			<c:if test="${ !empty b.boardOriginalFileName }">
			◎
			</c:if>			
			<c:if test="${ empty b.boardOriginalFileName }">
			&nbsp;
			</c:if>			
			</td>
			<td align="center">${ b.boardReadCount }</td>
		</tr>
	</c:forEach>
	
</table>
</body>
</html>