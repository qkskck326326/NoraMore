<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/enrollPage.css" />
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script> <!--  절대경로를 el로 처리함 -->
<script type="text/javascript">


function validate(){

	var pwdValue = $('#userpwd').val();
	var pwdValue2 = $('#userpwd2').val();
	
	if(pwdValue !== pwdValue2){   // == : 값만 일치하는지, === : 값과 자료형이 일치하는지
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("userpwd2").value = "";  // 두 번째 비밀번호 필드의 값을 비웁니다.
		document.getElementById("userpwd").select();  // 첫 번째 비밀번호 필드를 선택합니다.
		return false;  //전송 취소함
	}
	
	//아이디의 값 형식이 요구한 대로 작성되었는지 검사
	//암호의 값 형식이 요구한 대로 작성되었는지 검사
	//정규표현식(Regular Expression) 사용함
	
	return true;  //전송보냄
}

function dupIDCheck(){
	//사용 가능한 아이디인지 확인하는 함수 : ajax 기술 사용해야 함
	
	$.ajax({  //서버에서 값이 돌아와도 새로고침이 되지 않고 현재페이지는 바뀌지 않고 응답만 받음. 비동기 통신.
		url: "idchk.do",
		type: "post",   
		data: { userid: $('#userid').val() }, //userid로 되어 있는 메소드를 보냄
		success: function(data){  //온 결과 값.기본이 text임 
			console.log("success : " + data);
			if(data == "ok"){   
				alert("사용 가능한 아이디입니다.");
				$('#userpwd').focus();
			}else{
				alert("이미 사용중인 아이디입니다.");
				$('#userid').select();
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	
	window.onload = function(){
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
	}
</script>
</head>
<body>
<div id="entire">
<h1 align="center">회원가입</h1>
<br>
<!-- 사진파일 첨부시 enctype="multipart/form-data" 속성 추가함 -->
<form action="enroll.do" id="enrollForm" method="post" onsubmit="return validate();">  
<!-- form에는 submit버튼 1개만 만들수 있음 --> <!--  return을 붙여야 이 값을 보낼지 말지 가능함. -->


	<h5>회원 정보를 입력해 주세요. (* 표시는 필수입력 항목입니다.)</h5>
*아이디 <br>
		<input type="text" name="userId" id="userid" class="input" required>&nbsp;  <!-- name은 vo의 필드값과 같아야 함 --> <!-- required : 필수항목 -->	
		<input type="button" value="중복체크" onclick="return dupIDCheck();">
		<br>
		
	
	*암호<br>
	<input type="password" name="userPwd" id="userpwd" class="input" required>
	
			<div id="myphoto">
				<img src="/first/resources/member_photofiles/preview.jpg" id="photo" 				
				style="width:150px;height:160px;border:1px solid navy;display:block;"
				alt="사진을 드래그 드롭하세요."
				style="padding:0;margin:0;">
			</div>
			<br>

*암호확인<br>
	<input type="password" id="userpwd2" class="input" required><br>
*이름<br>
	<input type="text" name="userName" class="input" required><br>
*주민번호<br>
	<input type="text" name="social_id" class="input" required><br>
	<input type="file" name="photofile" id="photofile" value="첨부파일"><br>

*성별<br>
	
		<input type="radio" name="gender" value="M" id="m" > 남자 &nbsp; 
		<input type="radio" name="gender" value="F" id="f" > 여자 
		<br>

*이메일<br>
<input type="email" name="email" class="input" required><br>
	
	
</div>
</body>
</html>