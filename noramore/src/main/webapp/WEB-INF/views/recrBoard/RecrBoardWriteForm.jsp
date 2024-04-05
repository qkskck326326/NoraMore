<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/views/common/sideSample.jsp"%> --%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="categoryId" value="1"/>
<c:if test="${!empty requestScope.message}">
	<c:set var="categoryId" value="${requestScope.categoryId}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"src="/noramore/resources/js/jquery-3.7.0.min.js"></script>	
<script type="text/javascript" src="SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "editorTxt",
	sSkinURI: "SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			alert("아싸!");	
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});


$("#savebutton").click(function() {
	oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []); 
	//textarea의 id를 적어줍니다.

	var selcatd = $("#selcatd > option:selected").val();
	var title = $("#title").val();
	var content = document.getElementById("editorTxt").value;;

	if (selcatd == "") {
		alert("카테고리를 선택해주세요.");
		return;
	}
	if (title == null || title == "") {
		alert("제목을 입력해주세요.");
		$("#title").focus();
		return;
	}
	if(content == "" || content == null || content == '&nbsp;' || 
			content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
		alert("본문을 작성해주세요.");
		oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
		return;
	} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
	
	var result = confirm("발행 하시겠습니까?");
	
	if(result){
		alert("발행 완료!");
		$("#noticeWriteForm").submit();
	}else{
		return;
	}
});


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("searchAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}


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
        	 alert("종료 날짜를 시작 날짜 이전 날짜로 지정 할 수 없습니다");
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
        // 추가적인 입력 필드의 유효성 검사를 수행할 수 있습니다.
        
        return true;
    }

    // 폼 제출 시 입력 값 검증
    $('form').submit(function() {
        return validateInput();
    });

    
});

</script>

<title>Insert title here</title>

</head>
<body>
	
		
<form action="insertrb.do" method="post" enctype="multipart/form-data" >

	<!-- 필요한 값// 카테고리 나중에 추가 -->
	<input  type="hidden" name="memberId" value="${sessionScope.loginMember.memberID}">	
	<input  type="hidden" name="categoryId" value="${categoryId}">
	<input  type="hidden" name="page" value="${page}">
	
	
	<section id="write">
		<h1>모집글</h1>
		<div class="line"></div>
		
		<p id="title">글 제목*</p>
		<input  type="text" placeholder="글 제목을 입력하세요." name="title" style="display: inline-block;">
		
		<p id="context">본문*</p>
		<textarea rows="30" cols="70" placeholder="본문을 입력하세요." id="editorTxt" name="context"></textarea>
		
		<p>첨부파일</p>
		<input type="file" id="file" name="upfile">
		
		<div style="margin: 20px">			
		    <p id="sDate" style="display: inline-block; width: 110px;">활동시작 날짜*</p>
		    <input  type="date" name="recrActStartDate" style="display: inline-block; width: 200px;"> &nbsp;
				
		    <p id="eDate" style="display: inline-block; width: 110px;">활동마감 날짜*</p>
		    <input type="date" name="recrActEndDate" style="display: inline-block;; width: 200px;">
		    
		    <div>
			    <div>
			        <p id="mr" style="margin-top: 20px; display: inline;">모집인원*</p>
			        <input name="maxRecr1" type="number" style="display: inline; margin-top: 20px;">
			        <p style="margin-top: 20px; display: inline;">성별 조건</p>
			        <select name="genderCondition">
				        <option value="" selected>상관없음</option>
				        <option value="M">남자만</option>
				        <option value="F">여자만</option>
  					</select>
			    </div>
				<div>
					<p id="mr" style="margin-top: 20px; display: inline;">최소나이</p>
			        <input name="ageMinCondition1" type="number" style="display: inline; margin-top: 20px;">
			        <p id="mr" style="margin-top: 20px; display: inline;">최대나이</p>
			        <input name="ageMaxCondition1" type="number" style="display: inline; margin-top: 20px;">
				</div>
			</div>

		</div>
		
		<p>장소</p>
		<div style="display: flex; align-items: center;">
    		<input type="text" placeholder="주소를 입력해주세요" id="searchAddress" name="recrLocation" readonly 
    		style="width: 100%; height: 45px; margin-bottom: 21px; padding: 20px; border: 1px solid #000; border-radius: 7px;">
   			<button style="width: 150px; height: 45px; margin-left: 10px; margin-bottom: 21px; padding: 20px; border: 1px solid #000; border-radius: 7px; font-size: 16px;
    font-weight: bold;" onclick="sample4_execDaumPostcode(); return false;" >주소 검색</button>
		</div>
		<button type="submit" id="savebutton" onclick="insertRecrBoard()">글쓰기</button>
	</section>
</form>



</body>
</html>

<script type="text/javascript" src = "resources/js/notice-write.js"></script>