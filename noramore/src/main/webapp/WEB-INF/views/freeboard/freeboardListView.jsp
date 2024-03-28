<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/style.css">
		<script type="text/javascript"
			src="/resources/js/jquery-3.7.0.min.js"></script>
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
                    sortRecent();
                } else if (selectedOption === "author") {
                    sortViews();
            };

            function sortRecent() {
                console.log("최신순 정렬 실행");
            }

            function sortViews() {
                console.log("조회순 정렬 실행");
            }

            function sortLikes() {
                console.log("좋아요순 정렬 실행");
            }
            
            function sortTitle(){
            	 console.log("글제목 정렬 실행");
            
            }
            function sortAuthor(){
            	console.log("작성자 정렬 실행");
            }
        };
        };
    </script>		
</head>
<body>
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
		<button onclick="location.href='freeboarddetail.do';" class="blueBtn">글쓰기</button>
		<form action="board.jsp" method="get">

			<div class="position">
				<p>검색하기</p>
				<div class="search">
					<input type="text" name="pos">
					<button>검색</button>
				</div>
			</div>
		</form>
	<div class="position">
        <p>정렬 기준</p>
    <div class="dropdown">
        <select id="sortingSelect">
            <option value="recent">최신순</option>
            <option value="views">조회순</option>
            <option value="likes">좋아요순</option>
        </select>
    </div>
    <!-- 띄어쓰기 -->
    <p>항목 선택</p>
    <div class="dropdown">
        <select id="itemSelect">
            <option value="title">글제목</option>
            <option value="author">작성자</option>
        </select>
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
			<c:forEach var="fl" items="${list}">
	            <c:url var="fbd" value="fbdetail.do">
					<c:param name="bnum" value="${b.boardNum}" />
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

	</section>
</body>
</html>