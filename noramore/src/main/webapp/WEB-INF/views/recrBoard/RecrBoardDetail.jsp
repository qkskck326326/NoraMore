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
	var bId
	if(${!empty RecrBoard.boardId}){
		bId = "${RecrBoard.boardId}";
	}else{
		bId = "${boardId}";
	}
	$.ajax({
        url: "selectrecrcomment.do",
        type: "post",
        dataType: "json",
        data: { BoardId: bId },
        success: function(data) {
            // 서버로부터 받은 JSON 데이터를 처리합니다.
            for (var i = 0; i < data.length; i++) {
                var comment = data[i];
                
                // memberId를 숨은 input 요소에 할당합니다.
                $('#memberId').val(comment.memberId);
                
                // commentId를 숨은 input 요소에 할당합니다.
                $('#commentId').val(comment.commentId);
                
                // context를 textarea 요소에 할당합니다.
                $('#context').val(comment.context);
                
                // countSubComment가 1 이상인 경우에만 링크를 표시합니다.
                if (comment.countSubComment > 0) {
                    var subCommentLink = $('<a href="#" onclick="toggleSubCommentList()">더보기</a>');
                    $('#subCommentContainer').empty().append(subCommentLink);
                } else {
                    $('#subCommentContainer').empty(); // countSubComment가 0인 경우 요소를 비웁니다.
                }
                
                // lastUpdateDate를 <p> 태그에 6pt 크기로 할당합니다.
                var lastUpdateDateParagraph = $('<p style="font-size: 6pt;">' + comment.lastUpdateDate + '</p>');
                $('#lastUpdateDateContainer').empty().append(lastUpdateDateParagraph);
                
                // 각 comment를 commentList에 추가합니다.
                var commentDiv = $('<div></div>');
                commentDiv.append($('#memberId'));
                commentDiv.append($('#commentId'));
                commentDiv.append($('#context'));
                commentDiv.append($('#subCommentContainer'));
                commentDiv.append($('#lastUpdateDateContainer'));
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
    		<div id="commentList"></div>	
		</div>
	</div>
</div>

</body>
</html>
