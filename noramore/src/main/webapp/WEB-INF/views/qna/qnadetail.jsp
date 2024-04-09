<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/views/common/sideSample.jsp" />
<c:import url="/WEB-INF/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"
	src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>


<c:url var="qd" value="qdelete.do">
	<c:param name="boardId" value="${ qna.boardId }" />
	<c:param name="rfile" value="${ qna.renameFilePath }" />
</c:url>
<c:url var="qup" value="qmoveup.do">
	<c:param name="boardId" value="${ qna.boardId }" />
</c:url>

<!-- button 기능들  -->
<script>
	function moveUpdatePage() {
		// 수정 페이지로 이동하는 코드
		/* var form = document.createElement('form');
		form.method = 'POST';
		form.action = '${nu}';
		document.body.appendChild(form);
		form.submit(); */
		location.href = "${qup}";
	}
	function requestDelete() {
		location.href = "${qd}";
	}
	function goToList() {
		// 목록 페이지로 이동하는 코드
		window.location.href = 'qlist.do';
	}
	
	// 댓글 작성 function
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
	
	function selectqnacomment() {
	    var bId;
	    if (${!empty Qna.boardId}) {
	        bId = "${Qna.boardId}";
	    } else {
	        bId = "${boardId}";
	    }
	    $.ajax({
	        url: "selectqnacomment.do",
	        type: "POST",
	        dataType: "json",
	        data: { BoardId: bId },
	        success: function(data) {
	        	
	            for (var i = 0; i < data.length; i++) {
	                var comment = data[i];
	                
	                var memberIdInput = $('<input type="hidden" name="memberId" value="' + comment.memberId + '">');
	                var commentIdInput = $('<input type="hidden" name="commentId" value="' + comment.commentId + '">');
	                var contextTextarea = $('<textarea class="commentForm" rows="5" cols="20" readonly>' + comment.context + '</textarea><br>');
	                var lastUpdateDateParagraph = $('<p style="font-size: 10pt;">' + "작성자ID : " + comment.memberId + "&nbsp;&nbsp;&nbsp; 작성/수정 날짜: " + comment.lastUpdateDate + '</p>');

	                if(comment.refCommentId == 0){
	                	var commentDiv = $("<div id='commentForm' style=''>");
	                }else{
	                	var commentDiv = $("<div id='cocommentForm' style='left-margin: 100px;'>");
	                }
	                commentDiv.append(lastUpdateDateParagraph);
	                commentDiv.append(memberIdInput);
	                commentDiv.append(commentIdInput);
	                commentDiv.append(contextTextarea);  
	                if("${Qna.memberId}" === "${sessionScope.loginMember.memberID}"){
	                commentDiv.append("<button onclick='updatecomment(" + comment.commentId + ", \"" + comment.context + "\")'>수정하기</button>");
	                commentDiv.append("<button onclick='deletecomment(" + comment.commentId + ")'>삭제하기</button>");
	                }
	                var refCommentId1 = parseInt(comment.commentId);
	                
	                
	                if(comment.refCommentId == 0 && ${!empty sessionScope.loginMember}){
	                commentDiv.append('<div id="cocomment" style="width: 500px; height: 200px;">' +
	                	    '<form id="cocommentForm" action="insertqnacocomment.do" method="post" style="">' +
	                	    '<input type="hidden" name="memberId" value="' + "${sessionScope.loginMember.memberID}" + '">' +
	                	    '<input type="hidden" name="boardId" value="' + "${Qna.boardId}" + '">' +
	                	    '<input type="hidden" name="refCommentId1" value="' + comment.commentId + '">' +
	                	    '<input type="hidden" name="page" value="' + "${page}" + '">' +
	                	    '<textarea class="commentForm" name="context" cols="50" rows="5" required></textarea>' +
	                	    '<br>' +
	                	    '<button type="submit" >대댓글 등록</button>' +
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
</script>
</head>
<body>
	<br>


	<%-- <input type="hidden" value="<%= vo.getUserId() %>" name="writer"> --%>
	<section id="write">
		<h1 align="center">${ qna.boardId }번공지글상세보기</h1>
		<div class="line"></div>
		<br>
		<table>
			<tr>
				<th colspan="2"><c:if
						test="${!empty sessionScope.loginMember and 
						sessionScope.loginMember.memberID == qna.memberID or
						sessionScope.loginMember.adminYN == 'Y'}">
						<button class="blueBtn"
							style="float: right; margin-right: 30px; margin-left: 10px;"
							onclick="requestDelete(); return false;">삭제</button>
						<button class="blueBtn" style="float: right; margin-left: 10px;"
							onclick="moveUpdatePage(); return false;">수정</button>
					</c:if>
					<button class="whiteBtn" style="float: right;"
						onclick="goToList();">목록</button></th>
			</tr>
		</table>
		<br>


		<p>
			<span style="float: left;">글 제목 : ${ qna.title }</span> <span
				style="float: right;">작성자 : ${ qna.memberID }</span>
		</p>
		<br> <br>
		<p>작성일</p>
		<h3>${ qna.registDt }</h3>
		<br>
		<p>내용</p>
		<textarea rows="30" cols="70" name="sub" readonly>${ qna.substance }</textarea>

		<p>첨부파일</p>
		<td><c:if test="${ !empty qna.originalFilePath }">
				<c:url var="nfd" value="nfdown.do">
					<c:param name="ofile" value="${qna.originalFilePath }" />
					<c:param name="rfile" value="${qna.renameFilePath }" />
				</c:url>
				<a href="${ qfd }">${qna.originalFilePath }</a>
			</c:if> <c:if test="${ empty qna.originalFilePath }">&nbsp;	</c:if></td>
		<div class="comment-div">
			<button onclick="toggleCommentForm(); return false;">댓글(${Qna.commentCount})개</button>
			<!-- 댓글 작성 폼 -->

			<div id="writecommentForm" style="display: none;">
				<c:if test="${!empty sessionScope.loginMember}">
					<form action="insertqnacomment.do" method="post">
						<input type="hidden" name="memberId"
							value="${sessionScope.loginMember.memberID}"> <input
							type="hidden" name="boardId" value="${Qna.boardId}">
						<input type="hidden" name="page" value="${page}">
						<textarea class="commentForm" name="context" cols="50" rows="5"
							required></textarea>
						<br>
						<button type="submit">댓글 등록</button>
					</form>
				</c:if>
				<div id="commentList"></div>
				<div class="comment-list"
					style='display: none; text-align: left; padding: 0;'>
					<br>
				</div>
			</div>


		</div>

	</section>



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
<%-- 
<%@ include file="/WEB-INF/views/common/footer.jsp"%> --%>
</html>