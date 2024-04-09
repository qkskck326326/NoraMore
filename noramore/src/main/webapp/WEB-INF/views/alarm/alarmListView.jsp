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
<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/css/alarm.css">
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<style type="text/css">
a {
	color: #0174DF;
	font-weight: bold;
	text-decoration: underline;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br><br><br><br><br><br>
<h2 class="title">알람</h2>
<br>

	<table class="table" align="center" border="1" cellspacing="0" width="700">
		<tr>
			<th>번 호</th>
			<th>내 용</th>
			<th>발신일</th>
			<th>상 태</th>
		</tr>
		
		
		<!-- title, context, senderId 모두 a태그 적용 + a 태그 onclick 시 확인여부 'Y'로 update 요청보내기 -->
		<c:forEach items="${ requestScope.list }" var="a">
			<tr>
				<td>${ a.alarmId }</td>
				
			    <c:if test="${ a.checkedYN eq 'Y' }">
			    	<div class="checkedColor">
			   	</c:if>
				
				<c:if test="${ a.alarmKind eq 'COMM_FREE' || a.alarmKind eq 'COMM_RECR'}">
					<td>
						<c:if test="${ a.refCommentId <= 0}">
							글 <a href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&page=1&categoryId=${ a.categoryId }">'${ a.title }'</a> 에 새로운 댓글이 달렸습니다.
							<br>
							└ '${ a.senderId }' : <a href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&page=1&categoryId=${ a.categoryId }">'${ a.context }'</a>
						</c:if>
						<c:if test="${ a.refCommentId > 0}">
							'${ a.senderId }' 님의 답글 : <a href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&page=1&categoryId=${ a.categoryId }">'${ a.context }'</a>
						</c:if>
					</td>
				</c:if>
				
				<c:if test="${ a.alarmKind eq 'RECR_APPL' }">
					<td>
						'${ a.senderId }' 님께서 모집 <a href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&page=1&categoryId=${ a.categoryId }">'${ a.title }'</a> 에 신청하였습니다.
					</td>
				</c:if>
				
				<td>${ a.registDate }</td>
				
				<c:if test="${ a.checkedYN eq 'Y' }">
					<td>읽음</td>
				</c:if>
				<c:if test="${ a.checkedYN eq 'N' }">
					<td>안 읽음</td>
				</c:if>
				
			 	<c:if test="${ a.checkedYN eq 'Y' }">
			    	</div>
			   	</c:if>
			   	
			</tr>
		</c:forEach>

	</table>
</body>
</html>