<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<c:import url="/WEB-INF/views/common/sideSample.jsp"/>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="currentPage" value="${requestScope.currentPage}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoraMore</title>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
function rbwriteform(){
	location.href = 'rbwriteform.do';
}
</script>
<style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #333;
        }
</style>
</head>
<body>

	<h1>모집게시판 전체 목록</h1>
	
	<button class="whiteBtn" style="float: right;  margin-right:10;" onclick="rbwriteform()">글 작성</button>
	
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
					<c:param name="page" value="${nowpage}" />
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
<c:import url="/WEB-INF/views/common/pagingView.jsp"/>
</body>
</html>