<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<script src="./06-timer.js" defer></script>
    <link rel="stylesheet" href="./06-timer.css" />
<link rel="stylesheet" type="text/css" href="resources/css/enrollPage.css" />



<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
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
</script>







<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script> <!--  절대경로를 el로 처리함 -->
<script type="text/javascript">

	 


function validate(){
	
	var idValue = $('#memberid').val();
	var pwdValue = $('#memberpwd').val();
	var pwdValue2 = $('#memberpwd2').val();
	var nameValue = $('#membername').val();
	var birthValue = $('#birth').val();
	
	
	
	if (!/^[a-z][A-Za-z0-9]{5,11}$/.test(idValue)) {
	    document.getElementById("memberid").value = "";  
		document.getElementById("memberid").select();
	    return false;
	}

	//이름
	if(!/^[가-힝]{2,}$/.test(nameValue)){
		alert("성명 : 한글로 2글자 이상을 넣으세요");
		document.getElementById("membername").value = "";  
		document.getElementById("membername").select();
		return false;
	}
	
	
	
    
	

	
	 if(pwdValue !== pwdValue2){   // == : 값만 일치하는지, === : 값과 자료형이 일치하는지
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("memberpwd2").value = "";  // 두 번째 비밀번호 필드의 값을 비웁니다.
		document.getElementById("memberpwd").select();  // 첫 번째 비밀번호 필드를 선택합니다.
		return false;  //전송 취소함
	}
	
	if (!/^[A-Z][a-z\d]{5,11}[!@#]$/.test(pwdValue)) {
	    alert("비밀번호 : 첫글자는 영문 대문자, 마지막에 특수문자 넣어주세요. 6~12자 입력할 것!");
	    document.getElementById("memberpwd").value = "";
	    document.getElementById("memberpwd2").value = "";
		document.getElementById("memberpwd").select();
	    return false;
	}
	
	
	
	
	//아이디의 값 형식이 요구한 대로 작성되었는지 검사
	//암호의 값 형식이 요구한 대로 작성되었는지 검사
	//정규표현식(Regular Expression) 사용함	
	return true;  //전송보냄
}
 



function dupIDCheck(){
	//사용 가능한 아이디인지 확인하는 함수 : ajax 기술 사용해야 함
	$.ajax({  
		url: "idchk.do",
		type: "post",
		data: { memberID: $('#memberid').val() },
		success: function(data){ 
			console.log("success : " + data);
			if(data == "ok"){   
				alert("사용 가능한 아이디입니다.");
				 $('#memberpwd').focus();
				$("registerBtn").attr("disabled", false);
				$('#memberid').attr("readonly", true); 
			}else{
				alert("이미 사용중인 아이디입니다.");
				$('#memberid').select();
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	return false;
	
}
 

/* 
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
} */



</script>
</head>
<body>

<div id="entire" class="container">
<h1 align="center">회원가입</h1>
<br>
<!-- 사진파일 첨부시 enctype="multipart/form-data" 속성 추가함 -->
<form action="enroll.do" id="limit" class="enrollForm" method="post" onsubmit="return validate();">  
<!-- form에는 submit버튼 1개만 만들수 있음 --> <!--  return을 붙여야 이 값을 보낼지 말지 가능함. -->

	<h5>회원 정보를 입력해 주세요. (* 표시는 필수입력 항목입니다.)</h5>
	
	<div>
	<h3 class="list">*아이디<span id="idError"></span></h3>
		<span class="box int_id" >
		<input type="text" name="memberID" id="memberid" class="input" required></span>  <!-- name은 vo의 필드값과 같아야 함 --> <!-- required : 필수항목 -->	
		<input type="button" value="중복체크" onclick="return dupIDCheck();">
		<div class="success-message hide"></div>
    	<div class="failure-message hide">아이디는 6~12글자이어야 합니다</div>
    	<div class="failure-message2 hide">첫글자는 영소문자, 영어 또는 숫자만 가능합니다</div>
	</div>
	
		
	<div>
		<h3 class="list">*비밀번호<span id="pwError" ></span></h3>
		<span class="box int_id">
			<input type="password" name="memberPWD" id="memberpwd" class="input" maxlength="20" required>
		</span>
	</div>
	<div class="strongPassword-message hide">8글자 이상, 첫글자 영대문자, 소문자와 숫자 그리고 특수문자(@$!%*#?&)를 사용하세요</div>
	
	<div id="myphoto">
		<img src="/first/resources/member_photofiles/" id="photo" 				
		style="width:150px;height:160px;border:1px solid navy;display:block;"
		alt="사진을 드래그 드롭하세요."
		style="padding:0; margin:0;"> 
	</div>
	<br>
	
	<div>
		<h3 class="list">비밀번호 재확인<span id="pwCheckError"></span></h3>
		<span class="box int_id">
			<input type="password" id="memberpwd2" class="input" maxlength="20" required><br>
		</span>	
		<div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
	</div>
	
	<div>
		<h3 class="list">성명<span id="nameError"></span></h3>
		<span class="box int_id">
			<input type="text" name="memberName" id="membername" class="input" maxlength="20" required><br>
		</span>
	</div>
	
	<div>
		<h3 class="list">생년월일<span id="birthError"></span></h3>
		<span class="box int_id">
			<input type="date" name="birth" id="birth" class="input" required>
	</div>
	
	
	
	<div>
		<h3 class="list">성별</h3>
		<span class="box int_id">
			<input type="radio" name="gender" value="M" id="m" checked > 남자 &nbsp; 
			<input type="radio" name="gender" value="F" id="f" > 여자 
		</span>
	</div>
	<br>

    <!-- <div class="userInput">
        <h3 class="list">이메일<span id="emailError"></span></h3>
        <span class="emailInt" >
        <input type="text" name="email" id="emailBox" maxlength="20" class="input" > 
           <span> @ </span> 
              이메일 택일
              <select name= "email2" id="mailSelect" >
                 <option>이메일 선택</option>
                 <option>naver.com</option>
                 <option>gmail.com</option>
                 <option>daum.net</option>
                 <option>hotmail.com</option>
                 <option>nate.com</option>
                 <option>empas.com</option>
                 <option>freechal.com</option>
                 <option>lycos.co.kr</option>
                 <option>hanmir.com</option>
                 <option>dreamwiz.com</option>
                 <option>paran.com</option>
                 <option>직접입력</option>
              </select>
        </span>
     </div> -->
     
     <div class="form-group">
	     <div>
	  		<input class="form-control" placeholder="이메일을 입력해주세요." name="email" id="email" type="email">
	    	<div style="display: block; text-align: right;">
	      		<input type="button" value="인증하기"  class="btn btn-primary" id="emailAuth">
	    	</div>
	    	
	  		<input class="form-control" placeholder="인증 코드 6자리를 입력해주세요." maxlength="6" disabled="disabled" name="authCode" id="authCode" type="text" autofocus>
	  		<<!-- span class="target__time">
	            <span id="remaining__min">3</span> :
	            <span id="remaining__sec">00</span>
	          </span>-->
	          <span id="timer"> </span>
	          <button class="complete__target" id="complete" disabled="disabled" >인증완료</button>
	     </div> 
	      
  		<div id="emailAuthWarn"></div>
	</div>


	<input type="file" name="photoFilename" id="photoFilename" value="첨부파일"><br>
	<br>
	
	
	<div>
	   <h3 class="list">자택주소<span id="addressError"></span></h3>
	   <div id="address" class="int_id">
       <span>
       <input type="text" id="sample4_postcode" class="d_form mini line addressCheck" placeholder="우편번호" readonly>
       <input type="button" id="addressButton" class="d_form mini" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly>
       </span>
       <br>
		<input type="text" id="sample4_roadAddress" name="road" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" name="street" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span><br>
		<input type="text" id="sample4_detailAddress" name="detail" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" name="ref" placeholder="참고항목">
		       
       </div>
    </div>
    
	<br><br>
	<!-- 개인정보 수집 동의 -->
       <div class="userInput">
          <h3 class="list">개인정보 수집/이용동의<span id="consentError"></span></h3>
          <div id="informationConsent">
             <span id="consentBox">
                 <h3>개인정보 처리방침<span id="consentError"></span></h3>
                 <!-- 세부내용 중략 -->
             </span>
          </div>
          <label class="select"><input type="radio" id="check" name="check" value="동의">동의</label>
          <label class="select"><input type="radio" id="noneCheck"name="check" value="비동의" checked="checked">비동의</label>
      </div>


<br><br>
<input type="submit"  value="가입하기"   class="btn btn-lg btn-success btn-block" id="registerBtn"> &nbsp;
<!-- id="submit_button" -->
<input type="reset" value="작성취소"> &nbsp;
<a href="home.do">시작페이지로 이동</a>


</form>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script> <!--  절대경로를 el로 처리함 -->
<script type="text/javascript">


var codeNum = null;


//인증하기 버튼을 눌렀을 때 동작
$("#emailAuth").click(function() {
	const email = $("#email").val(); //사용자가 입력한 이메일 값 얻어오기
		
	//Ajax로 전송
    $.ajax({
    	url : 'emailAuth.do',
    	data : {
    		email : email
    	},
    	type : 'POST',
    	dataType : 'json',
    	success : function(result) {
    		console.log("result : " + result);
    		
    		
	    		var strCode = JSON.stringify(result);
	    		
	    		var json = JSON.parse(strCode);
	    		
	    		codeNum = json.code;
	    		
	    		$("#authCode").attr("disabled", false); 
	    		
	    		alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
	    		
    		}
    		
   		}
    }); //End Ajax
});


//인증 코드 비교
$("#authCode").on("keyup", function() {
	
	var inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
	
	console.log("입력코드 : " + inputCode);
	console.log("인증코드 : " + codeNum);
		
	
	
	if(inputCode == codeNum){
    	$("#emailAuthWarn").html('인증번호가 일치합니다.');
    	$("#emailAuthWarn").css('color', 'green');
		$('#emailAuth').attr('disabled', true);  //인증하기 버튼 비활성화
		$('#email').attr('readonly', true);  //이메일 읽기전용으로 변환
		$("#complete").attr("disabled", false); 
		

	}else{
    	$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
    	$("#emailAuthWarn").css('color', 'red');
    	$("#registerBtn").attr("disabled", true);
    	$("#complete").attr("disabled", true); 
    
	}
	
	return false;
});

//인증완료 클릭 시 
$("#complete").on("click", function() {
	var inputCode = $("#authCode").val();
	
	if(inputCode == codeNum){
		$("#emailAuthWarn").html('인증이 완료되었습니다.');
		$("#emailAuthWarn").css('color', 'green');
		$("#registerBtn").attr("disabled", false); 
		$("#complete").attr("disabled", true); 

	}else{
		$("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		$("#emailAuthWarn").css('color', 'red');
		$("#emailAuth").attr("disabled", false); 
		
	
	}
	
	return false;
});

/*  
$("#email").on("keyup", function() {
	var inputEmail = $("#email").val();
	if(inputEmail != null ){

		$("#complete").attr("disabled", false); 
	}
}); */ 

//--이메일 인증 타이머--------------------------------------------------------------------------


let timerInterval; // 타이머 인터벌을 저장할 변수

// 버튼 클릭 이벤트에 함수 바인딩
document.getElementById("emailAuth").addEventListener("click", function() {
    // 이전에 생성된 타이머 제거
    clearInterval(timerInterval);
    
    // 3분 타이머 시작
    startTimer();
});

// 3분 타이머 시작하는 함수
function startTimer() {
    let duration = 180; // 3분을 초로 설정
    updateTimer(duration); // 타이머 업데이트
    
    // 1초마다 타이머 감소
    timerInterval = setInterval(function() {
        duration--;
        updateTimer(duration); // 남은 시간 업데이트
        
        if (duration <= 0) {
            clearInterval(timerInterval); // 타이머 정지
            document.getElementById("timer").innerHTML = "시간이 만료되었습니다."; // 만료 메시지 표시
        }
    }, 1000);
}

// 타이머 표시 업데이트 함수
function updateTimer(duration) {
    const minutes = Math.floor(duration / 60); // 분 계산
    const seconds = duration % 60; // 초 계산
    document.getElementById("timer").innerHTML = minutes + "분 " + seconds + "초 남음"; // 타이머 업데이트
}
 </script>
 </div>



<script type="text/javascript">

//1. 아이디 입력창 정보 가져오기
let elInputUsername = document.querySelector('#memberid'); // input#username
//2. 성공 메시지 정보 가져오기
let elSuccessMessage = document.querySelector('.success-message'); // div.success-message.hide
//3. 실패 메시지 정보 가져오기 (글자수 제한 4~12글자)
let elFailureMessage = document.querySelector('.failure-message'); // div.failure-message.hide
//4. 실패 메시지2 정보 가져오기 (영어 또는 숫자)
let elFailureMessageTwo = document.querySelector('.failure-message2'); // div.failure-message2.hide


//1. 비밀번호 입력창 정보 가져오기
let elInputPassword = document.querySelector('#memberpwd'); // input#password
//2. 비밀번호 확인 입력창 정보 가져오기
let elInputPasswordRetype = document.querySelector('#memberpwd2'); // input#password-retype
//3. 실패 메시지 정보 가져오기 (비밀번호 불일치)
let elMismatchMessage = document.querySelector('.mismatch-message'); // div.mismatch-message.hide
//4. 실패 메시지 정보 가져오기 (8글자 이상, 영문, 숫자, 특수문자 미사용)
let elStrongPasswordMessage = document.querySelector('.strongPassword-message'); // div.strongPassword-message.hide


function idLength(value) {
	  return value.length >= 6 && value.length <= 12
	}


function onlyNumberAndEnglish(str) {
	  return /^[a-z][A-Za-z0-9]*$/.test(str);
	}
	

function strongPassword (str) {
	  return /^[A-Z](?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
	}
	
function isMatch (password1, password2) {
	  return password1 === password2;
	}
	
elInputUsername.addEventListener('keyup', function(){
//elInputUsername.onkeyup = function () {
	console.log("keyup");
	  // 값을 입력한 경우
	  if (elInputUsername.value.length !== 0) {
	    // 영어 또는 숫자 외의 값을 입력했을 경우
	    if(onlyNumberAndEnglish(elInputUsername.value) === false) {
	      elSuccessMessage.classList.add('hide');
	      elFailureMessage.classList.add('hide');
	      elFailureMessageTwo.classList.remove('hide'); // 영어 또는 숫자만 가능합니다
	    }
	    // 글자 수가 4~12글자가 아닐 경우
	    else if(idLength(elInputUsername.value) === false) {
	      elSuccessMessage.classList.add('hide'); // 성공 메시지가 가려져야 함
	      elFailureMessage.classList.remove('hide'); // 아이디는 4~12글자이어야 합니다
	      elFailureMessageTwo.classList.add('hide'); // 실패 메시지2가 가려져야 함
	    }
	    // 조건을 모두 만족할 경우
	    else if(idLength(elInputUsername.value) || onlyNumberAndEnglish(elInputUsername.value)) {
	      elSuccessMessage.classList.remove('hide'); // 사용할 수 있는 아이디입니다
	      elFailureMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
	      elFailureMessageTwo.classList.add('hide'); // 실패 메시지2가 가려져야 함
	    }
	  }
	  // 값을 입력하지 않은 경우 (지웠을 때)
	  // 모든 메시지를 가린다.
	  else {
	    elSuccessMessage.classList.add('hide');
	    elFailureMessage.classList.add('hide');
	    elFailureMessageTwo.classList.add('hide');
	  }
	});
	
	
elInputPassword.onkeyup = function () {

	  // console.log(elInputPassword.value);
	  // 값을 입력한 경우
	  if (elInputPassword.value.length !== 0) {
	    if(strongPassword(elInputPassword.value)) {
	      elStrongPasswordMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
	    }
	    else {
	      elStrongPasswordMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
	    }
	  }
	  // 값을 입력하지 않은 경우 (지웠을 때)
	  // 모든 메시지를 가린다.
	  else {
	    elStrongPasswordMessage.classList.add('hide');
	  }
	};
	
	
	elInputPasswordRetype.onkeyup = function () {

		  // console.log(elInputPasswordRetype.value);
		  if (elInputPasswordRetype.value.length !== 0) {
		    if(isMatch(elInputPassword.value, elInputPasswordRetype.value)) {
		      elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
		    }
		    else {
		      elMismatchMessage.classList.remove('hide'); // 실패 메시지가 보여야 함
		    }
		  }
		  else {
		    elMismatchMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
		  }
		};
	
</script>
</body>
</html>