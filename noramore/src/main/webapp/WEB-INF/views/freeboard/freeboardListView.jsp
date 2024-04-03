<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<c:set var="currentLimit" value="${ requestScope.limit }" />
<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/style.css">
	<link rel="stylesheet" href="resources/css/dropdown.css">
	<script type="text/javascript" src="/resources/js/jquery-3.7.0.min.js"></script>
	
		<title>Insert title here</title>

<script type="text/javascript">
    window.onload = function () {
        var sortingSelect = document.getElementById("sortingSelect");
        var itemSelect = document.getElementById("itemSelect");

        sortingSelect.onchange = function () {
            var selectedOption = sortingSelect.value;

            if (selectedOption === "recent") {
                sortRecent();
            } else if (selectedOption === "views") {
                sortViews();
            } else if (selectedOption === "likes") {
                sortLikes();
            }
        };
        
        itemSelect.onchange = function () {
            var selectedOption = itemSelect.value;
            if (selectedOption === "title") {
                sortTitle();
            } else if (selectedOption === "author") {
                sortAuthor();
            }
        };
    };

    function sortRecent() {
    	 location.href = "freerecentlist.do";
    	 console.log("최신순 정렬 실행");
    }

    function sortViews() {
    	location.href = "freeviewslist.do";
    	console.log("조회순 정렬 실행");
    }

    function sortLikes() {
    	 location.href = "freelikeslist.do";
    	 console.log("좋아요순 정렬 실행");
    }
    
    function sortTitle(){
        console.log("글제목 정렬 실행");
    }
    
    function sortAuthor(){
        console.log("작성자 정렬 실행");
    }
    
    function selectCategory(value){
        $("#category").text(value).val(value);
    }
</script>

</head>
<body>

<%-- 항목별 검색 기능 추가 --%>
<fieldset id="ss">
	<legend>검색할 항목을 선택하세요.</legend>
	<input type="radio" name="item" id="title"> 제목 &nbsp;
	<input type="radio" name="item" id="writer"> 작성자 &nbsp;	
</fieldset>
<br>

<%-- 검색 항목별 값 입력 전송용 폼 만들기 --%>
<%-- 제목 검색 폼 --%>
<form id="titleform" class="sform" action="fbsearchTitle.do" method="post">
	<input type="hidden" name="action" value="title">	
<fieldset>
	<legend>검색할 제목을 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="10" selected>10</option>
		<option value="15" >15</option>
		<option value="20" >20</option>
	</select> &nbsp; 
	<input type="submit" value="검색">
</fieldset>
</form>

<%-- 작성자 검색 폼 --%>
<form id="writerform" class="sform" action="fbsearchWriter.do" method="post">
	<input type="hidden" name="action" value="writer">	
<fieldset>
	<legend>검색할 작성자를 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="10" selected>10</option>
		<option value="15" >15</option>
		<option value="20" >20</option>
	</select> &nbsp; 
	<input type="submit" value="검색">
	
</fieldset>

</form>
<!--  
<%-- 정렬 기준 조회순 --%>

<form id="viewform" class="sform" action="freeviewslist.do" method="post">
	<input type="hidden" name="action" value="view">
	
<fieldset>
	<input type="submit" value="최신순">
	
</fieldset>

</form>	

-->


	<section id="board">

		<h1>자유게시판</h1>
		<div class="line"></div>
		<%
		if (request.getParameter("pos") != null) {
		%>
		<h3>
			'<%=request.getParameter("pos")%>' 근처 검색 결과
		</h3>
		<%
		}
		%>
		<button onclick="location.href='freeboardwrite.do';" class="blueBtn">글쓰기</button>
		<!--  <button onclick="location.href='freeboardwrite.do';" class="blueBtn">글쓰기</button>-->
		<form action="board.jsp" method="get">

			<div class="position">
				<p>항목 선택</p>
    <div class="dropdown">
        <select id="itemSelect">
            <option value="title">글제목</option>
            <option value="author">작성자</option>
        </select>
    </div>
				<p>검색하기</p>
				<div class="search">
					<input type="text" name="pos">
					<button>검색</button>
				</div>
			</div>
		</form>
		
			<div class="position2">
        <p>정렬 기준</p>
    <div class="dropdown">
        <select id="sortingSelect">
            <option value="recent">최신순</option>
            <option value="views">조회순</option>
            <option value="likes">좋아요순</option>
        </select>
    </div>
    
   	 </div>
   	     
   	 
   	<!-- 추가한 부분 *********************************** -->
   	
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
		<!-- ****************************************** -->
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
			<c:forEach var="fl" items="${ requestScope.list }">
	            <c:url var="fbd" value="fbdetail.do">
					<c:param name="boardId" value="${fl.boardId}" />
					<c:param name="page" value="${nowpage}" />
				</c:url>
                <tr>
                    <td>${fl.boardId}</td>
                    <td><a href="${fbd}">${fl.title}</a></td>
                    <td>${fl.memberId}</td>
                    <td>${fl.readCount}</td>
                </tr>
            </c:forEach>	
				
			
			</tbody>
			

		</table>
		<!-- 추가한 부분 **************** -->
<br>
 <c:import url="/WEB-INF/views/common/pagingView.jsp"/> 

<!-- 추가한 부분 **************** -->
	</section>

</body>
</html>