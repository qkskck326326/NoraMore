<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<%-- <c:import url="/WEB-INF/views/common/sideSample.jsp"/> --%>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="page" value="${requestScope.currentPage}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoraMore</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/dropdown.css">
<script type="text/javascript" src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function rbwriteform(){
	location.href = 'rbwriteform.do?page=' + ${page};
}

function selectCategory(value){
	$("#category").text(value).val(value);
}

</script>
</head>
<body>

	<h1>모집게시판 전체 목록</h1>
	
	
	<div class="dropdown">
    <button class="dropbtn" id="category" name="category" value="">Dropdown</button>
    <div class="dropdown-content">
        <a onclick="selectCategory('볼링')">볼링</a>
        <a onclick="selectCategory('클라이밍')">클라이밍</a>
        <a onclick="selectCategory('싸이클')">싸이클</a>
        <a onclick="selectCategory('헬스')">헬스</a>
        <a onclick="selectCategory('수상레저')">수상레저</a>
        <a onclick="selectCategory('등산')">등산</a>
    </div>
</div>
	
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자ID</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="rl" items="${list}">
	            <c:url var="rbd" value="rbdetail.do">
					<c:param name="boardId" value="${rl.boardId}" />
					<c:param name="page" value="${page}" />
				</c:url>
                <tr>
                    <th>${rl.boardId}</th>
                    <th><a href="${rbd}">${rl.title}</a></th>
                    <th>${rl.memberId}</th>
                    <th>${rl.readCount}</th>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<br>
<button class="whiteBtn" style="float: right;  margin-right:10;" onclick="rbwriteform()">글 작성</button>
<c:import url="/WEB-INF/views/common/pagingView.jsp"/>
</body>
</html>