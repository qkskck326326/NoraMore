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
/* $(document).ready(function() {
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
} */


function loadFreeBoard() {
    // recr 테이블의 내용을 숨김
    document.getElementById('recrTable').style.display = 'none';

	$.ajax({
		url : "selectFreeBoadMemberId.do",  //DispatcherServlet로 보냄
		type : "post",     //
		data : {memberID : ${sessionScope.loginMember.memberID}},
		dataType : "json",
		success : function(data) {
			console.log("success : " + data);   //String 리턴되온것을 Object로 받음

			//object --> string
			var str = JSON.stringify(data);

			//string --> json
			var json = JSON.parse(str);

			values = "";
			for ( var i in json.list) {
				values += "<tr><td>"
						+ json.list[i].flikeCount
						+ "</td><td><a href='/noramore/fbdetail.do?fboardId="
						+ json.list[i].fboardId 
						+ ", json.list[i].categoryId=" + json.list[i].categoryId
						+ "'>"
						+ decodeURIComponent(json.list[i].ftitle).replace(  //공백이 다 +로 표시되어 다 공백으로 바꿔줌
								/\+/gi, " ") + "</a></td><td>"
						+ json.list[i].fregist + "</td></tr>";
			}

			$('#freelist').html($('#freelist').html() + values);
			//$('#toplist').append(values);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			console.log("error : " + jqXHR + ", " + textStatus + ", "
					+ errorThrown);
		}
	}); //ajax

});


</script>



<div id="box_act">
<h1>활동기록</h1>



<div id="recrBtn" class="moveBtn">
		<c:url var="moveRecrBoard" value="selectRecrBoadMemberId.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ moveRecrBoard }">활동기록</a>
		
	</div>

<div id="freeBtn" class="moveBtn">
		<c:url var="moveFreeBoard" value="selectFreeBoadMemberId.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ moveFreeBoard }" onclick="loadFreeBoard();">자유게시판</a>
</div>
	



<hr>
	<table id="recrTable">
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
	
	
	<table id="freelist" border="1" cellspacing="0" width="350">
			<tr>
				<th>좋아요</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</table>
	
	
	
	
	<%-- <table>
		<tr>
			<th class="title">좋아요</th>   
			<th class="title">제목</th>
			<th class="title">등록일</th>
		</tr>
		<c:forEach var="fl" items="${list}">
		<c:url var="fbd" value="fbdetail.do">
			<c:param name="boardId" value="${fl.boardId}" />
			<c:param name="page" value="${page}" />
			<c:param name="categoryId" value="${categoryId}" />
		</c:url>
		<tr>
			<th>${fl.likeCount}</th>
			<th><a href="${fbd}">${fl.title}</a></th>
			<th>${fl.registDate}</th>
		</tr>
		</c:forEach>
	</table> --%>
	
	
	
</div>


</body>
</html>