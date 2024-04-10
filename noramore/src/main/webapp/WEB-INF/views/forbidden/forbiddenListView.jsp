<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/forbiddenPage.css"  rel="stylesheet">
<title>금지어관리 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<!-- JavaScript 코드 -->
<script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

// 팝업 열기 함수
function openPopup() {
  document.getElementById("popup").style.display = "block";
}

// 팝업 닫기 함수
function closePopup() {
  document.getElementById("popup").style.display = "none";
}
function dupFbCheck(){
	//사용 가능한 아이디인지 확인하는 함수 : ajax 기술 사용해야 함
	
	$.ajax({
		url: "fbchk.do",
		type: "post",
		data: { fbWord: $('#fbtext').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				alert("등록이 완료되었습니다.");
				$('.popup-content')[0].submit();
				$('#fbtext').val('');
			}else if(data == "dup"){
				alert("이미 등록된 금지어입니다.");
				$('#fbtext').val('');
			}else{
				alert("다시 확인해주세요.");
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	
	return false;  //버튼 클릭이벤트 취소 (submit 버튼에 클릭이벤트 전달을 막기 위함)
}

/* function delFb(fbWord){
	$.ajax({
		url: "fbdelete.do",
		type: "post",
		data: { fbWord: fbWord },
		success: function(result){
			if(result == "delete"){
				alert("금지어 < " + fbWord + " > 가 삭제되었습니다");
				$('tr:has(td:contains("' + fbWord + '"))').remove();
				});
			}else{
				alert("오류! 금지어 삭제를 실패했습니다.");
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}
 */
 function delFb(fbWord) {
	    $.ajax({
	        url: "fbdelete.do",
	        type: "post",
	        data: { fbWord: fbWord },
	        success: function(result) {
	            if (result == "delete") {
	                alert("금지어 < " + fbWord + " > 가 삭제되었습니다");
	                location.reload();
	              
	            } else {
	                alert("오류! 금지어 삭제를 실패했습니다.");
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
	        }
	    });
	}
 
 window.onload = function() {
	    // URL의 쿼리 문자열에서 keyword 값을 가져옴
	    var urlParams = new URLSearchParams(window.location.search);
	    var keyword = urlParams.get('keyword');

	    // 가져온 keyword 값을 입력 필드에 설정
	    if (keyword) {
	        document.getElementById('fbsearch').value = keyword;
	    }
	}

	// 검색어 입력 필드가 변경될 때 실행되는 함수
	document.getElementById('fbsearch').addEventListener('input', function() {
	    // 입력 필드의 값
	    var keyword = this.value;

	    // 현재 URL의 쿼리 문자열을 가져옴
	    var urlParams = new URLSearchParams(window.location.search);
	    
	    // 검색어를 쿼리 문자열에 추가 또는 업데이트
	    urlParams.set('keyword', keyword);

	    // 변경된 쿼리 문자열을 현재 페이지의 URL에 적용하여 업데이트
	    history.replaceState(null, null, "?" + urlParams.toString());
	});
</script>

</head>
<body>
<c:import url="/WEB-INF/views/admin/adminSidebar.jsp" />
<h2 class="title" style="padding-top: 100px">금지어 관리</h2>
<div class="container">
		<div class="search" >
		<a class="listRollback" href="${ pageContext.servletContext.contextPath }/fblist.do">전체 목록</a>
		&nbsp; &nbsp;
		<form action="fbsearch.do">
			<input type="hidden" name="action" value="forbidden">
			<input type="search" name="keyword" id="fbsearch" placeholder="검색할 금지어를 입력하세요"> &nbsp; &nbsp;
			<input type="submit" class="fbsubmit" value="검색">&nbsp; &nbsp;
			<select name="limit">
				<option value="10" selected>10</option>
				<option value="15" >15</option>
				<option value="20" >20</option>
			</select>
		</form>&nbsp; &nbsp; &nbsp;
		<button class="new" onclick="openPopup();">등록하기</button>
		</div>


	<!-- 팝업 -->
	<div id="popup" class="popup">
	  <form action="fbinsert.do" class="popup-content" onsubmit="return dupFbCheck();">
	  	<h4 class="fbenroll">새 금지어 등록</h4><p>
	    <span class="close" onclick="closePopup();">&times;</span> <!-- 팝업 닫기 버튼 -->
	    <input id="fbtext" type="text" placeholder="입력해주세요" name="fbWord" maxlength="30">&nbsp; <!-- 팝업 내부의 input 태그 -->
	    <input class="fbsubmit" type="submit" value="등록">
	  </form>
	</div>
	<br>

		<table class="table" align="center" border="1" cellspacing="0" width="700">
			<tr>
				<th>번호</th>
				<th>금지어</th>
				<th>등록일자</th>
				<th>관리</th>
			</tr>
			
			<c:forEach items="${ requestScope.list }" var="f">
				<tr>
					<td>${ f.fbId }</td>
					<td>${ f.fbWord }</td>
					<td>${ f.registDate }</td>
					<td><button class="deletefb" onclick="return delFb('${ f.fbWord }');">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
</div>
<br>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />
</body>
</html>