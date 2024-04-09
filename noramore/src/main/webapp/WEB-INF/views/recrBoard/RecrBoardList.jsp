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
<c:if test="${!empty requestScope.categoryId}">
	<c:set var="categoryId" value="${requestScope.categoryId}" />
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=여기에_발급받은_자바스크립트_키를_입력하세요&libraries=services"></script>
<script type="text/javascript">




function rbwriteform(){
	if(${empty sessionScope.loginMember}){
		alert("로그인을 해야 합니다.");
		return;
	}
        var page = ${page};
        var categoryId = ${categoryId};
        location.href = 'rbwriteform.do?page=' + page + '&categoryId=' + categoryId;
        
        return false;
}

function check(){
	var limitSelect = document.getElementById('limitSelect');
    var limi = limitSelect.value;
    console.log(limi);
    
    var keywordE = document.getElementById('keyword');
    var keyword = keywordE.value;
    console.log(keyword);
    
    var actionE = document.getElementById('action');
    var action = actionE.value;
    console.log(action);
}

function changeFormAction() {
    var selectedValue = document.getElementById("action").value;
    document.getElementById("searchaction").action = selectedValue;
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
	
	<div id="map" style="width:100%;height:350px;"></div>   

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
	검색 기준: <div class="dropdown">
			    <select id="action" name="action" onchange="changeFormAction()">
			        <option value="searchrecrtitle.do">글제목</option>
			        <option value="searchrecrwriter.do">작성자ID</option>
			    </select>
			</div>
		<form id="searchaction" action="searchrecrtitle.do" method="post" >
			<fieldset style='width: 1200px; border: 0px;'>
				<div class="search" style='width: 180px;'>
					<input id="keyword" name="keyword" style="width:140; height:25;">
					<button type="submit">검색</button>
				</div> &nbsp; 
				한 페이지에 출력할 목록 갯수 : <select name="limit" id="limitSelect">
					<option value="10" selected>10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<c:set var="limi" value="${limit}" ></c:set>
				</select> &nbsp; 
				
			</fieldset>
			<input  type="hidden" name="categoryId" value="${categoryId}">
		</form>
		<button class="whiteBtn" style="float: right;" onclick="rbwriteform()">글작성</button>
	</section>
		
		<table style='width: 1200px;'>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자ID</th>
				<th>모집상황</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="rl" items="${list}">
				<c:url var="rbd" value="rbdetail.do">
					<c:param name="boardId" value="${rl.boardId}" />
					<c:param name="page" value="${page}" />
					<c:param name="categoryId" value="${categoryId}" />
				</c:url>
				<tr>
					<th>${rl.boardId}</th>
					<th><a href="${rbd}">${rl.title}</a></th>
					<th>${rl.memberId}</th>
					<th>${rl.nowRecr}명 / ${rl.maxRecr}명</th>
					<th>${rl.readCount}</th>
				</tr>
			</c:forEach>

		</table>
		<br>
	</section>

	<c:import url="/WEB-INF/views/common/pagingView+category.jsp" />
</body>
</html>