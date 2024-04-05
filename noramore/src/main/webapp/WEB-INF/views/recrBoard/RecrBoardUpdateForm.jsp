<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/common/sideSample.jsp"%> --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="categoryId" value="1"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"src="/noramore/resources/js/jquery-3.7.0.min.js"></script>	
<script type="text/javascript" src="SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        $('input[name="title"]').on('input', function(){
            var title = $(this).val();
            if (title == '') {
                $('#title').text('글 제목*');
            } else {
                $('#title').text('글 제목');
            }
        });

        $('textarea[name="context"]').on('input', function(){
            var context = $(this).val();
            if (context == '') {
                $('#context').text('본문*');
            } else {
                $('#context').text('본문');
            }
        });

        $('input[name="recrActStartDate"]').on('input', function(){
            var start = $(this).val();
            if (start == '') {
                $('#sDate').text('활동시작 날짜*');
            } else {
                $('#sDate').text('활동시작 날짜');
            }
        });

        $('input[name="recrActEndDate"]').on('input', function(){
            var end = $(this).val();
            if (end == '') {
                $('#eDate').text('활동마감 날짜*');
            } else {
                $('#eDate').text('활동마감 날짜');
            }
            
            if($('input[name="recrActEndDate"]').val() < $('input[name="recrActStartDate"]').val()){
            	 alert("종료 날짜를 시작 날짜 이전 날짜로 지정 할 수 없습니다.");
            	 $('input[name="recrActEndDate"]').val(null);
            }
        });
        
        
        
        $('input[name="maxRecr1"]').on('input', function(){
            var maxRecr = $(this).val();
            if (maxRecr == '') {
                $('#mr').text('모집인원*');
            } else {
                $('#mr').text('모집인원');
            }
        });
        
        
        function validateInput() {
            var title = $('input[name="title"]').val();
            var context = $('textarea[name="context"]').val();
            var start = $('input[name="recrActStartDate"]').val();
            var end = $('input[name="recrActEndDate"]').val();
            var maxRecr = $('input[name="maxRecr1"]').val();
            var ageMinCondition = $('input[name="ageMinCondition1"]').val();
            var ageMaxCondition = $('input[name="ageMaxCondition1"]').val();
            
            if (title.trim() === '') {
                alert('글 제목을 입력하세요.');
                return false;
            }
            if (context.trim() === '') {
                alert('본문을 입력하세요.');
                return false;
            }
            if (start.trim() === '') {
                alert('활동 시작 날짜를 입력하세요.');
                return false;
            }
            if (end.trim() === '') {
                alert('활동 마감 날짜를 입력하세요.');
                return false;
            }
            if (maxRecr.trim() === '') {
                alert('모집인원을 입력하세요.');
                return false;
            }
           	if( ageMinCondition > ageMaxCondition){
           		alert('최소나이 조건을 최대나이 조건보다 크게 설정 할 수 없습니다.');
           		return false;
           	}
            
            return true;
        }

        // 폼 제출 시 입력 값 검증
        $('form').submit(function() {
            return validateInput();
        });
    
        
    });
    
    
function deleteFile(){
	var fileToDelete = document.getElementById("Ofile");
	fileToDelete.parentNode.removeChild(fileToDelete);
	document.getElementById("upfile").style.display = "inline";
	document.getElementById("deleteFlag").checked = true;
}//

  
</script>

<title>Insert title here</title>

</head>
<body>
	
		
<form action="updaterb.do" method="post" enctype="multipart/form-data" >

	<!-- 필요한 값// 카테고리 나중에 추가 -->
	<input  type="hidden" name="boardId" value="${RecrBoard.boardId}">	
	<input  type="hidden" name="memberId" value="${sessionScope.loginMember.memberID}">	
	<input  type="hidden" name="categoryId" value="${categoryId}">
	<input  type="hidden" name="page" value="${page}">
	<input type="hidden" name="recrOriginalFilename" value="${RecrBoard.recrOriginalFilename}">
	<input type="hidden" name="recrRenameFilename" value="${RecrBoard.recrRenameFilename}">
	
	<section id="write">
		
		<h1>모집글</h1>
		<div class="line"></div>
		
		<p id="title">글 제목*</p>
		<input  type="text" placeholder="글 제목을 입력하세요." name="title" style="display: inline-block;" value="${RecrBoard.title}">
		
		<p id="context">본문*</p>
		<textarea rows="30" cols="70" placeholder="본문을 입력하세요." name="context">"${RecrBoard.context}"</textarea>
		
		<p>첨부파일</p>
		<c:if test="${!empty RecrBoard.recrOriginalFilename}">
			<div id='Ofile'>
			${RecrBoard.recrOriginalFilename} &nbsp; 
			<button style='display: inline;' onclick='deleteFile()'>파일삭제</button> <br>
			</div>
			<input id='upfile' style='display: none;' type="file" name="upfile">
			<input id='deleteFlag' style='display: none;' type="checkbox" name="deleteFlag" value="yes">
		</c:if>
		<c:if test="${empty RecrBoard.recrOriginalFilename}">
			첨부된 파일 없음 <br>
			추가 : <input type="file" name="upfile">
		</c:if>
		
		<div style="margin: 20px">			
		    <p id="sDate" style="display: inline-block; width: 110px;">활동시작 날짜*</p>
		    <input  type="date" name="recrActStartDate" style="display: inline-block; width: 200px;" value='${RecrBoard.recrActStartDate}'> &nbsp;
				
		    <p id="eDate" style="display: inline-block; width: 110px;">활동마감 날짜*</p>
		    <input type="date" name="recrActEndDate" style="display: inline-block;; width: 200px;" value='${RecrBoard.recrActEndDate}'>
		    
		    <div>
			    <div>
			        <p id="mr" style="margin-top: 20px; display: inline;">모집인원*</p>
			        <input name="maxRecr1" type="number" style="display: inline; margin-top: 20px;" value="${RecrBoard.maxRecr}">
			        <p style="margin-top: 20px; display: inline;">성별 조건</p>
			        <select name="genderCondition">
				        <option value="" selected>상관없음</option>
				        <option value="M">남자만</option>
				        <option value="F">여자만</option>
  					</select>
			    </div>
				<div>
					<p id="mr" style="margin-top: 20px; display: inline;">최소나이</p>
			        <input name="ageMinCondition1" type="number" style="display: inline; margin-top: 20px;" value="${RecrBoard.ageMinCondition}">
			        <p id="mr" style="margin-top: 20px; display: inline;">최대나이</p>
			        <input name="ageMaxCondition1" type="number" style="display: inline; margin-top: 20px;" value="${RecrBoard.ageMaxCondition}">
				</div>
			</div>

		</div>
		
		<p>장소</p>
		<input type="text" placeholder="주소를 입력해주세요" id="where" name="recrLocation">
		
		<button type="submit" onclick="updateRecrBoard()">수정 완료</button>
	</section>
</form>



</body>
</html>