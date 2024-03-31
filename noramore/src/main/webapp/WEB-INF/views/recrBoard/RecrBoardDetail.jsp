<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty requestScope.currentPage}">
    <c:set var="page" value="${requestScope.currentPage}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoraMore</title>
<script type="text/javascript" src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function toggleCommentForm() {
    var commentForm = document.getElementById("commentForm");
    if (commentForm.style.display === "none") {
        commentForm.style.display = "block";
        selectrecrcomment();
    } else {
        commentForm.style.display = "none";
    }
}

function Alert(message) {
    alert(message);
}

// 페이지 로딩 시 alert 창 띄우기
window.onload = function() {
	if(${!empty message}){
    Alert("${message}");
	}
};

function selectrecrcomment() {
	var boardId = "${RecrBoard.boardId}";
	$.ajax({
        url: "selectrecrcomment.do",
        type: "post",
        dataType: "json",
        data: { BoardId: boardId },
        success: function(data) {
            // 서버로부터 받은 JSON 데이터를 처리합니다.
            for (var i = 0; i < data.length; i++) {
                var comment = data[i];
                
                // 각 요소를 하나의 <div>로 감싸줍니다.
                var commentDiv = $('<div></div>');
                
                // memberId를 <p> 태그 안에 넣고, <div> 안에 추가합니다.
                var memberIdParagraph = $('<p>' + comment.memberId + '</p>');
                commentDiv.append(memberIdParagraph);
                
                // context를 textarea 안에 넣고, <div> 안에 추가합니다.
                var contextTextarea = $('<textarea readonly>' + comment.context + '</textarea>');
                commentDiv.append(contextTextarea);
                
                // countSubComment가 0 이상인 경우에는 버튼과 함께 추가적인 <div>를 만들어서 넣습니다.
                if (comment.countSubComment > 0) {
                    var subCommentButton = $('<button onclick="toggleSubCommentList()">Show Sub Comments</button>');
                    commentDiv.append(subCommentButton);
                    
                    var subCommentListDiv = $('<div name="subCommentList" style="display: none;"></div>');
                    commentDiv.append(subCommentListDiv);
                }
                
                // lastUpdateDate를 5pt 크기로 <p> 태그 안에 넣고, <div> 안에 추가합니다.
                var lastUpdateDateParagraph = $('<p style="font-size: 6pt;">' + comment.lastUpdateDate + '</p>');
                commentDiv.append(lastUpdateDateParagraph);
                
                // commentDiv를 commentList에 추가합니다.
                $('#commentList').append(commentDiv);
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
        }
    });
}

function toggleSubCommentList() {
    var subCommentList = $('[name="subCommentList"]');
    subCommentList.toggle();
}

</script>
<style>
	.container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .boardRecr-div, .comment-div {
        	width: 1000px;
            padding: 20px;
            margin: 10px;
            border: 1px solid #ccc;
        }
</style>
</head>
<body>
<div class="container">
	<div class="boardRecr-div">
		<form action="#" method="post" enctype="multipart/form-data">
		    <div id="write" style="margin-bottom: 20px;">
		        <h1 style="text-align: left;">${RecrBoard.title}</h1>
		        <div class="line"></div>
		        <div style="text-align: left; margin-bottom: 10px;">
		            <button class="whiteBtn" onclick="moveListPage(); return false;">목록으로</button>
		            <button class="whiteBtn" style="float: right; background-color:pink; color:black;"
		                    onclick="report(); return false;">신고하기
		            </button>
		            <button class="whiteBtn" style="float: right; margin-right:10px;" onclick="signUp(); return false;">모집신청
		            </button>
		            <button class="whiteBtn" style="float: right; margin-right:10px;"
		                    onclick="checkRecrCondition(); return false;">모집조건
		            </button>
		        </div>
		        <textarea cols="30" rows="40" readonly>${RecrBoard.context}</textarea>
		        <div>
		            <p>첨부파일:</p>
		            <c:if test="${ !empty RecrBoard.recrOriginalFilename}">
		                <c:url var="rbdown" value="rbdown.do">
		                    <c:param name="ofile" value="${RecrBoard.recrOriginalFilename}"/>
		                    <c:param name="rfile" value="${RecrBoard.recrRenameFilename}"/>
		                </c:url>
		                <a href="${rbdown}">${RecrBoard.recrOriginalFilename}</a>
		            </c:if>
		            <c:if test="${ empty RecrBoard.recrOriginalFilename}">
		                <p>첨부파일 없음</p>
		            </c:if>
		        </div>
		        <p>시작 날짜 : ${RecrBoard.recrStartDate}</p>
		        <p>마감 날짜 : ${RecrBoard.recrEndDate}</p>
		        <p>장소 : ${RecrBoard.recrLocation}</p>
		    </div>		    
		</form>
	</div>
	<div class="comment-div">
		<!-- 댓글 보기 버튼 -->
		<div id="writeComment">
    		<button class="whiteBtn" onclick="toggleCommentForm(); return false;">댓글(${RecrBoard.commentCount})개</button>
		</div>
		<!-- 댓글 폼 -->
		<div id="commentForm" style="display: none;">
   		<form action="insertrecrcomment.do" method="post">
   		<input  type="hidden" name="memberId" value="${sessionScope.loginMember.memberID}">	
   		<input  type="hidden" name="boardId" value="${RecrBoard.boardId}">
   		<input  type="hidden" name="page" value="${page}">	
        <textarea name="context" cols="50" rows="5" required></textarea>
        <br>
        <input type="submit" value="댓글 등록">
    	</form>
    	<div id="commentList">
    	
    	</div>
		</div>
	</div>
</div>

</body>
</html>
