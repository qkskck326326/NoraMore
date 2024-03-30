<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="Page" value="${requestScope.currentPage}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url var="insertAppl" value="insertappl.do">
	<c:param name="boardId" value="${RecrBoard.boardId}" />
	<c:param name="memberID" value="${loginMember.memberID}" />
</c:url>
<c:url var="reportRecr" value="reportrecr.do">
	<c:param name="boardId" value="${RecrBoard.boardId}" />
	<c:param name="memberID" value="${loginMember.memberID}" />
</c:url>
<c:set var="currentPage" value="${requestScope.currentPage}" />
<%-- <c:set var="" value="${}" />
<c:set var="" value="${}" />
<c:set var="" value="${}" /> --%>
<script type="text/javascript" src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function signUp(){
	var maxAge = ${RecrBoard.ageMaxCondition};
	var minAge = ${RecrBoard.ageMinCondition};
	var gender = "${RecrBoard.genderCondition}";
	//var mAge = ${ScssionScope.loginMember.age}; 
	//var mGender ${ScssionScope.loginMember.gender};
	
    maxAge = (maxAge == 0) ? 999 : maxAge;
    //minAge = (minAge == 0) ? 0 : minAge;
	
    if ((gender != "" && (mAge >= minAge && mAge <= maxAge) && gender === mGender) || (gender == "" && (mAge >= minAge && mAge <= maxAge))) {
    	location.href = "${insertAppls}";
    } else {
        alert("신청에 실패했습니다 \n 모집 조건을 확인해 주세요");
    }
}//

function checkRecrCondition(){  
	var maxAge = ${RecrBoard.ageMaxCondition};
	var minAge = ${RecrBoard.ageMinCondition};
	var gender = "${RecrBoard.genderCondition}";
	var maxRecr = ${RecrBoard.maxRecr};
	var nowRecr = ${RecrBoard.nowRecr};
	if (${RecrBoard.ageMaxCondition} == 0) {
		maxAge = "없음";
	}

	if (${RecrBoard.ageMinCondition} == 0) {
		minAge = "없음";
	}

	if (${ empty RecrBoard.genderCondition}) {
		gender = "없음";
	}
	alert("최소나이제한 : " + minAge + "\n 최대나이제한 : " + maxAge + "\n 성별조건 : " + gender 
			+ "\n모집현황 : " + nowRecr + "명/" + maxRecr + '명');
}//


function moveListPage(){
	location.href = "rblist.do";
}

function report() {
	location.href = "reportrecr.do";
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
<form action="#" method="post" enctype="multipart/form-data" >
	<%-- <input type="hidden" value="<%= vo.getUserId() %>" name="writer"> --%>
	<div id="write">
		<h1 style="text-align: left;">${RecrBoard.title}</h1>
		<div class="line"></div>
		<div>
			<button class="whiteBtn" onclick="moveListPage(); return false;">목록으로</button>
			<button style="float: right; background-color:pink; color:black;" class="whiteBtn" onclick="report(); return false;">신고하기</button>
			<button style="float: right;  margin-right:10;" class="whiteBtn" onclick="signUp(); return false;">모집신청</button>
			<button style="float: right;  margin-right:10;" class="whiteBtn" onclick="checkRecrCondition(); return false;">모집조건</button>
		</div>

		<textarea cols="30" rows="40" readonly>${RecrBoard.context}</textarea>
		
		<c:if test="${ !empty RecrBoard.recrOriginalFilename}">
		<p>첨부파일</p>
			<c:url var="rbdown" value="rbdown.do">
				<c:param name="ofile" value="${RecrBoard.recrOriginalFilename}"/>
				<c:param name="rfile" value="${RecrBoard.recrRenameFilename}"/>
			</c:url>
			<a href="${rbdown}">
			${RecrBoard.recrOriginalFilename}</a>
		</c:if>
		<c:if test="${ empty RecrBoard.recrOriginalFilename}">
			<p>첨부파일 없음</p>
		</c:if>
						
		<p>시작 날짜 : ${RecrBoard.recrStartDate}</p>
		<p>마감 날짜 : ${RecrBoard.recrEndDate}</p>
		
		<p>장소 : ${RecrBoard.recrLocation}</p>
		
		

	</div>
</form>
</body>
</html>