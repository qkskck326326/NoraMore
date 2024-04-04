<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="page" value="${requestScope.currentPage}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoraMore</title>
<c:url var="insertappl" value="insertappl.do">
	<c:param name="RecrBoard" value="${RecrBoard}" />
	<c:param name="Member" value="${loginMember}" />
</c:url>
<c:url var="updateBoard" value="updateboard.do">
	<c:param name="boardId" value="${RecrBoard.boardId}" />
</c:url>
<c:url var="deleteBoard" value="deleteboard.do">
	<c:param name="boardId" value="${RecrBoard.boardId}" />
	<c:param name="page" value="${page}" />
</c:url>
<c:url var="rblist" value="rblist.do">
	<c:param name="page" value="${page}" />
</c:url>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"
	src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function toggleCommentForm() {
    // writecommentForm 요소를 선택
    var writecommentForm = document.getElementById("writecommentForm");
    
    // writecommentForm의 display 속성 값을 확인하여 표시되어 있는지 여부를 확인
    if (writecommentForm.style.display === "none") {
        // 표시되어 있지 않다면 보이도록 설정
        writecommentForm.style.display = "block";
    } else {
        // 표시되어 있다면 숨김
        writecommentForm.style.display = "none";
    }
    
    // comment-list 요소를 선택
    var commentList = document.querySelector(".comment-list");
    
    // comment-list의 display 속성 값을 확인하여 표시되어 있는지 여부를 확인
    if (commentList.style.display === "none") {
        // 표시되어 있지 않다면 보이도록 설정
        commentList.style.display = "block";
    } else {
        // 표시되어 있다면 숨김
        commentList.style.display = "none";
    }
}

function Alert(message) {
    alert(message);
}

// 페이지 로딩 시 alert 창 띄우기
window.onload = function() {
	selectrecrcomment()
	if(${!empty message}){
    Alert("${message}");
	}
};




function selectrecrcomment() {
    var bId;
    if (${!empty RecrBoard.boardId}) {
        bId = "${RecrBoard.boardId}";
    } else {
        bId = "${boardId}";
    }
    $.ajax({
        url: "selectrecrcomment.do",
        type: "POST",
        dataType: "json",
        data: { BoardId: bId },
        success: function(data) {
        	
            for (var i = 0; i < data.length; i++) {
                var comment = data[i];
                
                var memberIdInput = $('<input type="hidden" name="memberId" value="' + comment.memberId + '">');
                var commentIdInput = $('<input type="hidden" name="commentId" value="' + comment.commentId + '">');
                var contextTextarea = $('<textarea rows="5" cols="20" readonly>' + comment.context + '</textarea>');
                var lastUpdateDateParagraph = $('<p style="font-size: 8pt;">' + "작성자ID : " + comment.memberId + "&nbsp;&nbsp;&nbsp; 작성/수정 날짜: " + comment.lastUpdateDate + '</p>');

                if(comment.refCommentId == 0){
                	var commentDiv = $("<div id='commentForm'>");
                }else{
                	var commentDiv = $("<div id='cocommentForm' style='left-margin: 100px;'>");
                }
                commentDiv.append(memberIdInput);
                commentDiv.append(commentIdInput);
                commentDiv.append(contextTextarea);
                commentDiv.append(lastUpdateDateParagraph);
                commentDiv.append("<button class='info-button' data-id='" + comment.commentId + "' onclick='updatecomment(" + comment.commentId + ", \"" + comment.context + "\")'>수정하기</button>");
                commentDiv.append("<button class='info-button' data-id='" + comment.commentId + "' onclick='deletecomment(" + comment.commentId + ")'>삭제하기</button>");
                var refCommentId1 = parseInt(comment.commentId);
                console.log(refCommentId1);
                
                if(comment.refCommentId == 0){
                commentDiv.append('<div id="cocomment">' +
                	    '<form id="cocommentForm" action="insertrecrcocomment.do" method="post">' +
                	    '<input type="hidden" name="memberId" value="' + "${sessionScope.loginMember.memberID}" + '">' +
                	    '<input type="hidden" name="boardId" value="' + "${RecrBoard.boardId}" + '">' +
                	    '<input type="hidden" name="refCommentId1" value="' + comment.commentId + '">' +
                	    '<input type="hidden" name="page" value="' + "${page}" + '">' +
                	    '<textarea name="context" cols="50" rows="5" required></textarea>' +
                	    '<br>' +
                	    '<input type="submit" value="대댓글 등록">' +
                	    '</form>' +
                	    '<div id="commentList"></div>' +
                	    '</div>');
                }
                
                
                $('.comment-list').append(commentDiv);
            }
            
            
        },
        error: function(xhr, status, error) {
            console.error("Error occurred:", error);
        }
    });
}


function moveListPage(){
	location.href = "${rblist}";
}



function deletecomment(commentId) {
    // deleteComment URL 생성
    var boardId = "${RecrBoard.boardId}"; // JSP 변수를 JavaScript 문자열로 가져옵니다.
    var page = "${page}"; // JSP 변수를 JavaScript 문자열로 가져옵니다.
    var deleteCommentUrl = "deletecomment.do?boardId=" + boardId + "&commentId=" + commentId + "&page=" + page;

    // 생성된 URL로 리디렉션
    location.href = deleteCommentUrl;
}

function checkRecrCondition(){
	var minCon;
	var maxCon;
	var genderCon;
	if("${RecrBoard.ageMinCondition}" === "0"){
		minCon = "없음";
	}else{
		minCon = "${RecrBoard.ageMinCondition}"
	}
	
	if("${RecrBoard.ageMaxCondition}" === "0"){
		maxCon = "없음";
	}else{
		maxCon = "${RecrBoard.ageMaxCondition}"
	}
	
	if(${empty RecrBoard.genderCondition}){
		genderCon = "없음";
	}else{
		if(${RecrBoard.genderCondition eq "M"}){
			genderCon = "남자만";
		}else if(${RecrBoard.genderCondition eq "F"}){
			genderCon = "여자만";
		}
	}
	
	var con = "신청 최소나이 : " + minCon + "/  신청 최대 나이 : " + maxCon + "\n 성별 제한 : " + genderCon;
	
	alert(con);
}

function insertappl(){
	location.href = "${insertappl}";
}//

function updateBoard(){
	location.href = "${updateBoard}";
}

function deleteBoard(){
	location.href = "${deleteBoard}";
}

function deletecomment(commentId1) {
    var commentId = commentId1;
	console.log(commentId);
    // 삭제할 댓글의 commentId 값을 서버로 전송하는 AJAX 요청
    $.ajax({
        url: 'deletecomment.do',
        type: 'POST',
        data: { commentId: commentId, boardId: "${RecrBoard.boardId}", page: "${page}" },
        success: function(response) {
            alert('댓글이 성공적으로 삭제되었습니다.');
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error('댓글 삭제 중 오류가 발생했습니다:', error);
        }
    });

    location.reload(); 
}

function updatecomment(commentId1, context1){
	var commentId = commentId1;
	var ncontext = context1
	var context = prompt("수정할 내용", ncontext);
	console.log(context);
	$.ajax({
        url: 'updatecomment.do',
        type: 'POST',
        data: { commentId: commentId, boardId: "${RecrBoard.boardId}", page: "${page}", context: context },
        success: function(response) {
            alert('댓글이 성공적으로 수정되었습니다.');
        },
        error: function(xhr, status, error) {
            // 오류 처리
            console.error('댓글 수정 중 오류가 발생했습니다:', error);
        }
    });
	
	location.reload(); 
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
	margin-left: 10px;
}

.comment-list {
	width: 1000px;
	padding: 20px;
    margin: 10px;
    margin-left: 10px;
    /*margin-left: '.boardRecr-div'와 동일한 값;  '.boardRecr-div'의 왼쪽 여백과 일치하도록 이 값을 조정하세요 */
}

#commentForm {
    text-align: left;
    margin-bottom: 15px;
}

#cocommentForm {
    text-align: left;
    margin-bottom: 15px;
    margin-left: 100px;
}
</style>
</head>
<button onclick="updatecomment()">수정하기</button>
<body>
	<div class="container">
		<div class="boardRecr-div">
			<form action="#" method="post" enctype="multipart/form-data">
				<div id="write" style="margin-bottom: 20px;">
					<h1 style="text-align: left;">${RecrBoard.title}</h1>
					<div class="line"></div>
					<div style="text-align: left; margin-bottom: 10px;">
						<button class="whiteBtn" onclick="moveListPage(); return false;">목록으로</button>
						<button class="whiteBtn"
							style="float: right; background-color: pink; color: black;"
							onclick="report(); return false;">신고하기</button>
						<button class="whiteBtn" style="float: right; margin-right: 10px;"
							onclick="insertappl(); return false;">모집신청</button>
						<button class="whiteBtn" style="float: right; margin-right: 10px;"
							onclick="checkRecrCondition(); return false;">모집조건</button>
					</div>
					<textarea cols="30" rows="40" readonly>${RecrBoard.context}</textarea>
					<div>
						<p>첨부파일:</p>
						<c:if test="${ !empty RecrBoard.recrOriginalFilename}">
							<c:url var="rbdown" value="rbdown.do">
								<c:param name="ofile" value="${RecrBoard.recrOriginalFilename}" />
								<c:param name="rfile" value="${RecrBoard.recrRenameFilename}" />
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
			
			<button class="whiteBtn" onclick="updateBoard() ">수정하기</button>
			<button class="whiteBtn" onclick="deleteBoard() ">삭제하기</button>
			
		</div>
		<div class="comment-div">
			<!-- 댓글 보기 버튼 -->
			<div id="writeComment">
				<button class="whiteBtn"
					onclick="toggleCommentForm(); return false;">댓글(${RecrBoard.commentCount})개</button>
			</div>
			<!-- 댓글 작성 폼 -->
			<div id="writecommentForm" style="display: none;">
				<form action="insertrecrcomment.do" method="post">
					<input type="hidden" name="memberId"
						value="${sessionScope.loginMember.memberID}"> <input
						type="hidden" name="boardId" value="${RecrBoard.boardId}">
					<input type="hidden" name="page" value="${page}">
					<textarea name="context" cols="50" rows="5" required></textarea>
					<br> <input type="submit" value="댓글 등록">
				</form>
				<div id="commentList"></div>
			</div>
		</div>

		<div class="comment-list" style='display: none; text-align: left;'></div>

	</div>

	<%-- var writecocomentform = `
                    <div id="cocomment">
                        <form id="cocommentForm" action="insertrecrcomment.do" method='post'>
                            <input type="hidden" name="memberId" value='"${sessionScope.loginMember.memberID}"'>    
                            <input type="hidden" name="boardId" value="${RecrBoard.boardId}">
                            <input type="hidden" name="refCommentId1" value="${comment.commentId}"> 
                            <input type="hidden" name="page" value="${page}">    
                            <textarea name="context" cols="50" rows="5" required></textarea>
                            <br>
                            <input type="submit" value="댓글 등록">
                        </form>
                        <div id="commentList"></div>    
                    </div>
                `;  --%>

</body>
</html>
