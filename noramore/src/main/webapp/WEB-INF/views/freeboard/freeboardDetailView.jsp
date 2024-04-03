<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="/WEB-INF/views/common/sideSample.jsp"%> --%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  
<c:url var="insertAppl" value="insertApp.do">
	<c:param name="boardId" value="${FreeBoard.boardId}" />
	<c:param name="memberID" value="${loginMember.memberID}" />
</c:url>
-->

<c:url var="fbdel" value="freeboarddelete.do">
	<c:param name="boardId" value="${ FreeBoard.boardId }" />
	<c:param name="freeRenameFileName"
		value="${ FreeBoard.freeRenameFileName }" />
</c:url>

<c:url var="fbup" value="fbupview.do">
	<c:param name="boardId" value="${ FreeBoard.boardId }" />
	<c:param name="page" value="${ currentPage }" />
</c:url>

<script type="text/javascript"
	src="/noramore/resources/js/jquery-3.7.0.min.js"></script>

<script type="text/javascript">
	function requestDelete() {
		//게시글(원글, 댓글, 대댓글) 삭제 요청 함수
		location.href = "${ fbdel }";
	}

	function moveUpdatePage() {
		//게시글 (원글, 댓글, 대댓글) 수정 페이지로 이동 처리 함수
		location.href = "${ fbup }";
	}
</script>
<title>NoraMore</title>


<style>
div {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<form action="freeboardlist.do" method="post"
		enctype="multipart/form-data">
		<%-- <input type="hidden" value="<%= vo.getUserId() %>" name="writer"> --%>
		<div id="write">
			<h1 style="text-align: left;">${FreeBoard.title}</h1>
			<div class="line"></div>
			<div>
				<button class="whiteBtn" onclick="moveListPage(); return false;">목록으로</button>
				<button style="float: right; background-color: pink; color: black;"
					class="whiteBtn" onclick="report(); return false;">신고하기</button>

			</div>

			<textarea cols="30" rows="40" readonly>${FreeBoard.context}</textarea>

			<c:if test="${ !empty FreeBoard.freeOriginalFileName}">
				<p>첨부파일</p>
				<c:url var="fbdown" value="fbdown.do">
					<c:param name="ofile" value="${FreeBoard.freeOriginalFileName}" />
					<c:param name="rfile" value="${FreeBoard.freeRenameFileName}" />
				</c:url>
				<a href="${fbdown}"> ${FreeBoard.freeOriginalFileName}</a>
			</c:if>
			<c:if test="${ empty FreeBoard.freeOriginalFileName}">
				<p>첨부파일 없음</p>
			</c:if>

			<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button>
			&nbsp;
			<button onclick="requestDelete(); return false;">글삭제</button>
			&nbsp;


		</div>
	</form>

	<!--************************* 댓글/대댓글 추가한 부분 ************************************ -->
	
	<h1>댓글 목록</h1>

<c:forEach var="comment" items="${comments}">
    <div>
        <p>작성자</p> 
        <input type="text" name="memberId" readonly value="${ sessionScope.loginMember.memberID }">
        <p>내용: ${comment.context}</p>
        <p>등록일자: ${comment.registDate}</p>
        <!-- 댓글의 답글 출력 -->
        <ul>
            <c:forEach var="reply" items="${comment.replies}">
                <li>${reply.memberId}님의 답글: ${reply.context}</li>
            </c:forEach>
        </ul>
        <!-- 답글 작성 폼 -->
        <form action="/addFreeReply" method="post">
            <input type="hidden" name="parentId" value="${comment.commentId}" />
            <input type="text" name="replyContent" placeholder="답글을 작성하세요" />
            <input type="submit" value="등록" />
        </form>
    </div>
</c:forEach>

<h2>새로운 댓글 작성</h2>
<form action="/addFreeComment" method="post">
     <p>작성자</p> 
        <input type="text" name="memberId" readonly value="${ sessionScope.loginMember.memberID }">
    <br>
    <textarea name="context" placeholder="댓글 내용을 입력하세요"></textarea><br>
    <input type="submit" value="댓글 작성" />
</form>
	
	
	
	
	<!-- ******************************************************************* -->

		<!-- <script>
	$("#where").on("click",function(e){
		new daum.Postcode({
		    oncomplete: function(data) {
		        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        
		        $("#where").val(data.address);
		        console.log(data);
		        console.log(data.address);
		    }
		}).open();
	})
	
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	    checkInput();
	  };
	}, true);
	let title = $("input[name='title']");
	let sub = $("input[name='sub']");
	let file = $("input[name='file']");
	let price = $("input[name='price']");
	let start = $("input[name='start']");
	let end = $("input[name='end']");
	let mainlocation = $("input[name='mainlocation']");
	let sublocation = $("input[name='sublocation']");
	function checkInput() {
		if(title.val() == "") {
			alert("제목란이 비어져있습니다.");
			title.focus();
			return;
		}
		if(sub.val() == "") {
			alert("본문이 비어져있습니다.");
			sub.focus();
			return;
		}
		if(file.val() == "") {
			alert("사진이 비어져있습니다.");
			file.focus();
			return;
		}
		if(price.val() == "") {
			alert("가격이 비어져있습니다.");
			price.focus();
			return;
		}if(mainlocation.val() == "") {
			alert("주소가 비어져있습니다.");
			mainlocation.focus();
			return;
		}
		if(sublocation.val() == "") {
			alert("상세주소가 비어져있습니다.");
			sublocation.focus();
			return;
		}
		
		$("input[type='submit']").click();
	}
	
	$("#file").on("change", function(e){
		var f = e.target.files[0];
		console.log(f);
		if(!f.type.match("image*")){ //match도 사용 가능
			$("#img__preview").val("");
			alert('이미지만 첨부할 수 있습니다.');
			return;
		}
		var filename = f.name;
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
		}

		reader.readAsDataURL(f);


	});
</script>
	 -->
</body>
</html>