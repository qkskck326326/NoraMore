<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<%--
<% request.setCharacterEncoding("UTF-8");
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

--%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  추가한 부분 -->
<script type="text/javascript" src="SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- ***** -->
<link rel="stylesheet" href="resources/css/style.css">
		<script type="text/javascript"
			src="/noramore/resources/js/jquery-3.7.0.min.js"></script>	
<title>Insert title here</title>
<%--
<script type="text/javascript">
// 스마트 에디터 초기화
$(function () {
    $('#smartEditor').froalaEditor();
});

var contextValue = $('#smartEditor').val();
console.log(contextValue);

</script>
 --%>



</head>
<body>
	
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"> -->
		
    <form action="freeboardinsert.do" method="post" enctype="multipart/form-data" >
	<%-- <input type="hidden" value="<%= vo.getUserId() %>" name="writer"> --%>
	<section id="write">
		<!-- <h1>글쓰기</h1>
		<div class="line"></div> -->
		
		<p>작성자</p>
		<input type="text" name="memberId" readonly value="${ sessionScope.loginMember.memberID }">
		
		<p>카테고리</p>
		<input type="text" placeholder="카테고리를 입력하세요." name="categoryId">
		
		<p>글 제목</p>
		<input type="text" placeholder="글 제목을 입력하세요." name="title" <%--id = "title"--%>>
		
		<p>본문</p>
		<textarea rows="10" cols="5" placeholder="본문을 입력하세요." name="context" ></textarea> 
		<!--  추가한 부분 ***************************************** -->
		<!-- SmartEditor2  30 70 -->
	<%--
<div class="jsx-2303464893 editor">
	<div class="fr-box fr-basic fr-top" role="application">
		<div class="fr-wrapper show-placeholder" dir="auto" style="overflow: scroll;">
			<textarea name="context" id="smartEditor"
				style="width: 100%; height: 412px;"></textarea>
		</div>
	</div>
</div>

 --%>
 	
<!-- ******************************************************************************* -->
		<p>첨부파일</p>
		<input type="file" id="file" name="upfile">
						
		
		<!-- <button type="button"  onclick="checkInput()"  >글쓰기</button>
		<input type="submit" class="none"> -->
		
		
		<button type="submit" id="savebutton">글쓰기</button> &nbsp; 
		<button type="reset">취소</button> &nbsp; 
		
		
	</section>
</form>




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
<%--
<!-- SmartEditor2 -->
<script type="text/javascript">

//스마트에디터2.0관련 .js입니다.
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
		sSkinURI : "SmartEditor2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false
		}
	});

	$(function() {
		$("#savebutton").click(function() {
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []); 
			//textarea의 id를 적어줍니다.

			var selcatd = $("#selcatd > option:selected").val();
			var title = $("#title").val();
			//var content = document.getElementById("smartEditor").value;;
			var content = oEditors.getById["smartEditor"].getIR(); 
			// 가져온 값이 null인지 또는 빈 문자열인지 확인
		    // ************가져온 부분 *************************
		    if (!content) {
		        alert("본문을 작성해주세요.");
		        oEditors.getById["smartEditor"].exec("FOCUS");
		        return;
		    }
		 <!-- ********없어도 되는 코드 smartEditor 관련 MVC구성 안해도됨****** -->   
		     $.ajax({
       url: 'saveContext.do', // 올바른 컨트롤러로 수정
       type: 'POST',
       data: { context: content },
       success: function(response) {
           // 서버로부터의 응답을 처리합니다.
           console.log(response); // 성공했을 경우 콘솔에 출력
       },
       error: function(xhr, status, error) {
           // 오류 발생 시 처리합니다.
           console.error(error); // 오류 메시지 콘솔에 출력
       }
   });
		<!-- ********************************************** -->   
		    // ********* 추가한 부분 *************

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
	})

--%>


</script>
