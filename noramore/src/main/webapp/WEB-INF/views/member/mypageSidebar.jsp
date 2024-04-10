<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/mypageSidebar.css" />
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>



<div id="boxLine">

	<span id="nicname">사용자 닉네임</span>
	<div class="box" style="background: #BDBDBD;">
	   <!--  <img class="profile_img" src="/images/health.png"> -->
	</div>
		
	</span>
	<hr>
	
	<div id="profileBtn" class="moveBtn">
		<c:url var="memberDetail" value="myinfo.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ memberDetail }">내 프로필</a>
	</div>
	
	<div id="gradeBtn" class="moveBtn">
		<c:url var="grade" value="grade.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ grade }">나의 등급</a>
	</div>
	
	<div id="acticleBtn" class="moveBtn">
		<c:url var="moveRecrBoard" value="selectRecrBoadMemberId.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ moveRecrBoard }">활동기록</a>
		
	</div>
	
	<div id="resign">
		<c:url var="resign" value="moveResign.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ resign }">회원탈퇴</a>
		
	</div>

</div>


</body>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script> <!--  절대경로를 el로 처리함 -->
<script type="text/javascript">


/* window.onload = function(){
	//선택한 사진파일 이미지 미리보기 처리
	var photofile = document.getElementById("photofile");
	photofile.addEventListener('change', function(event){		
		const files = event.currentTarget.files;
	    const file = files[0];
	    const myphoto = document.getElementById("photo");	    
	    console.log(file.name);
	    
	    const reader = new FileReader();
        reader.onload = (e) => {          
          myphoto.setAttribute('src', e.target.result);
          myphoto.setAttribute('data-file', file.name);
        };
        reader.readAsDataURL(file);    
	}); 
	
	 */
	 
	
	<%-- window.onload = function(){
		//사용 가능한 아이디인지 확인하는 함수 : ajax 기술 사용해야 함
		
		 <% var memberid = "${loginMember.memberID}"; %> 
		
		$.ajax({  
			url: "gradeImage.do",
			type: "post",
			data: { memberid: $('memberid').val() },
			success: function(data){ 
				console.log("success : " + data);
				
				if(data =="sprout"){
					$('#grade').html('<img src="resources/images/sprout.png" alt="sprout">');
				
				}
				 if(data == "grass"){   
					 $('#grade').html('<img src="resources/images/grass.png" alt="sprout">'); 
						
				}
				if(data == "flower"){
					$('#grade').html('<img src="resources/images/flower.png" alt="sprout">'); 
				}
				if(data == "tree"){
					$('#grade').html('<img src="resources/images/tree.png" alt="sprout">'); 
				
				}
				if(data == "forest"){
					$('#grade').html('<img src="resources/images/forest.png" alt="sprout">'); 
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
		return false;
	}

 --%>

</script>


</html>