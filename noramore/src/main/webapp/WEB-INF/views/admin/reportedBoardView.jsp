<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>자유게시판 신고목록 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/alarm.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br><br><br><br><br><br>
<h2 class="title">신고된 게시글</h2>
<br>

	<table class="table" align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>게시판</th>
			<th>카테고리</th>
			<th>번 호</th>
			<th>글 제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>게시일</th>
			<th>신고</th>
		</tr>
		
		
		<!-- title, context, senderId 모두 a태그 적용 + a 태그 onclick 시 확인여부 'Y'로 update 요청보내기 -->
		<c:forEach items="${ requestScope.list }" var="a">
			<tr>
				<td>
					<c:if test=" ${ a.boardRef == 'RECR_BOARD' }">
						모집 
					</c:if>
					<c:if test=" ${ a.boardRef == 'FREE_BOARD' }">
						자유
					</c:if>
				</td>
				<td>${ a.categoryName }</td>
				<td>${ a.boardId }</td>
				<td>
					<c:if test=" ${ a.boardRef == 'RECR_BOARD' }">
						 <a href="${ pageContext.servletContext.contextPath }/rbdetail.do">${ a.title }</a>
					</c:if>
					<c:if test=" ${ a.boardRef == 'FREE_BOARD' }">
						<a href="${ pageContext.servletContext.contextPath }/fbdetail.do">${ a.title }</a>
					</c:if>
				</td>
				<td>${ a.memberID }</td>
				<td>${ a.readCount }</td>
				<td>${ a.registDate }</td>
				<td>${ a.reportCount }</td>
			</tr>
		</c:forEach> 
	</table>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />
</body>

</html>