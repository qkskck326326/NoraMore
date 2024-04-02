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

var cocoment = `
    <div id="cocomment">
        <form id="cocommentForm" action="insertrecrcocomment.do" method="post" style="display: none;">
            <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberID}">    
            <input type="hidden" name="boardId" value="${RecrBoard.boardId}">
            <input type="hidden" name="refCommentId" id="refCommentId" value=""> <!-- 대댓글의 경우 참조하는 댓글 ID를 여기에 설정 -->
            <input type="hidden" name="page" value="${page}">    
            <textarea name="context" cols="50" rows="5" required></textarea>
            <br>
            <input type="submit" value="댓글 등록">
        </form>
        <div id="commentList"></div>    
    </div>
`; 



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
            // 받은 JSON 데이터를 처리하여 HTML에 추가하는 작업 수행
            for (var i = 0; i < data.length; i++) {
                var comment = data[i];
                
                var memberIdInput = $('<input type="hidden" name="memberId" value="' + comment.memberId + '">');
                var commentIdInput = $('<input type="hidden" name="commentId" value="' + comment.commentId + '">');
                var contextTextarea = $('<textarea rows="5" cols="20" readonly>' + comment.context + '</textarea>');
                var lastUpdateDateParagraph = $('<p style="font-size: 8pt;">' + "작성자ID : " + comment.memberId + "&nbsp;&nbsp;&nbsp; 작성/수정 날짜: " + comment.lastUpdateDate + '</p>');

                // 각 댓글을 새로운 div로 감싸지 않고, 하나의 div에 모든 요소를 추가합니다.
                var commentDiv = $("<div style='text-align: left;'>");
                commentDiv.append(memberIdInput);
                commentDiv.append(commentIdInput);
                commentDiv.append(contextTextarea);
                commentDiv.append(lastUpdateDateParagraph);

                $('.comment-list').append(commentDiv);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error occurred:", error);
        }
    });
}





function moveListPage(){
	location.href = "rblist.do?page=${page}";
}

function closecocoment(button) {
    button.parent().remove();
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
	if(${RecrBoard.ageMinCondition eq 0}){
		minCon = "없음";
	}else{
		mincon = ${RecrBoard.ageMinCondition}
	}
	
	if(${RecrBoard.ageMaxCondition eq 0}){
		maxCon = "없음";
	}else{
		mincon = ${RecrBoard.ageMaxCondition}
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
	
	<div class="comment-list">
		
	
	</div>
	
</div>

</body>
</html>
