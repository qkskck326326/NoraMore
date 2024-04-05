<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/sideSample.jsp" />
<%-- <c:import url="/WEB-INF/views/common/sideSample.jsp"/> --%>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="page" value="${requestScope.currentPage}" />
</c:if>
<c:set var="categoryId" value="1"/>
<c:if test="${!empty requestScope.message}">
	<c:set var="category" value="${requestScope.category}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoraMore</title>
<style type="text/css">
#boardrecr {
	top: 150px;
	left: 10%;
	margin-left: 200px;
}
</style>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/dropdown.css">
<script type="text/javascript"
	src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	function rbwriteform() {
		location.href = 'rbwriteform.do?page=' + ${page};
	}

	function selectCategory(value) {
		$("#category").text(value).val(value);
	}
	
</script>
<style type="text/css">
.search{
	border: 1px solid #15bef5;
    border-radius: 7px;
    padding: 0 3px;
    display: flex;
    flex-direction: row;
    align-items: center;
    height: 27px;
}

</style>
</head>
<body>
	<section id="board">
		<h1>모집게시판 전체 목록</h1>


	<!-- <div class="dropdown">
		    <button class="dropbtn" id="category" name="category" value="">Dropdown</button>
		    <div class="dropdown-content">
		        <a onclick="selectCategory('볼링')">볼링</a>
		        <a onclick="selectCategory('클라이밍')">클라이밍</a>
		        <a onclick="selectCategory('싸이클')">싸이클</a>
		        <a onclick="selectCategory('헬스')">헬스</a>
		        <a onclick="selectCategory('수상레저')">수상레저</a>
		        <a onclick="selectCategory('등산')">등산</a>
		    </div>
		</div> -->
		

	<%-- 검색 --%>
	<section style='width: 1200px; border: 0px; margin: 10px 0;'>
		<form id="" class="" action="search.do" method="post" >
		검색 기준: <div class="dropdown">
	        <select id="" name="action">
	            <option value="title">글제목</option>
	            <option value="author">작성자</option>
	        </select>
    	</div>
			<fieldset style='width: 1200px; border: 0px;'>
				<div class="search" style='width: 180px;'>
					<input name="keyword" style="width:140; height:25;">
					<button>검색</button>
				</div> &nbsp; 
				한 페이지에 출력할 목록 갯수 : <select name="limit">
					<option value="10" selected>10</option>
					<option value="15">15</option>
					<option value="20">20</option>
				</select> &nbsp; 
			</fieldset>
			<input  type="hidden" name="categoryId" value="${categoryId}">
		</form>
	</section>
		
		<button class="whiteBtn" style="" onclick="rbwriteform()">글작성</button>
		<table style='width: 1200px;'>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자ID</th>
				<th>조회수</th>
			</tr>
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

		</table>
		<br>
	</section>

	<c:import url="/WEB-INF/views/common/pagingView.jsp" />
</body>
</html>