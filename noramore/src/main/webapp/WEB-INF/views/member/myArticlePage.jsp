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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#recr').click(function() {
        fetchBoardData('recruitment');
    });

    $('#free').click(function() {
        fetchBoardData('free');
    });
});

function fetchBoardData(boardType) {
    $.ajax({
        url: 'selectRecrBoadMemberId.do', // 서버의 URL 주소 (예시)
        type: 'GET',
        dataType: "json",
        data: {
            type: boardType,
            memberID: '사용자ID' // 로그인한 사용자의 ID를 어떻게 가져올지에 따라 달라질 수 있습니다.
        },
        success: function(data) {
            $('#box_act').html(data); // 가져온 데이터로 활동기록 테이블을 업데이트합니다.
        },
        error: function() {
            alert('데이터를 불러오는데 실패했습니다.');
        }
    });
}
</script>



<div id="box_act">
<h1>활동기록</h1>

<button id="recr">
	모집게시판
</button>

<button id="free">
	자유게시판
</button>


<hr>
	<table>
		<tr>
			<th class="title">활동여부</th>   
			<th class="title">제목</th>
			<th class="title">활동 시작일</th>
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
</div>


</body>
</html>