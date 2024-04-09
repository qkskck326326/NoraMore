<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" type="text/css" href="resources/css/myArticle.css" />
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

 <c:import url="/WEB-INF/views/member/mypageSidebar.jsp" /> 

<h1>활동기록</h1>

<button id="recr">모집게시판</button>
<button id="free">자유게시판</button>

	<table style='width: 1200px;'>
		<tr>
			<th>활동여부1</th>   
			<th>제목</th>
			<th>활동 시작일</th>
		
		</tr>
		<c:forEach var="rl" items="${list}">
		<c:url var="rbd" value="rbdetail.do">
			<c:param name="boardId" value="${rl.boardId}" />
			<c:param name="page" value="${page}" />
			<c:param name="categoryId" value="${categoryId}" />
		</c:url>
		<tr>
			<th>
			<c:if test="${rl.recrActStartDate != null && rl.recrActEndDate == null}">
				활동중
			</c:if>
			<c:if test="${rl.recrActStartDate != null && rl.recrActEndDate != null}">
				활동종료
			</c:if>
			
			</th>
			<th><a href="${rbd}">${rl.title}</a></th>
			<th>${rl.recrActStartDate}</th>
		</tr>
		</c:forEach>

	</table>



</body>
</html>