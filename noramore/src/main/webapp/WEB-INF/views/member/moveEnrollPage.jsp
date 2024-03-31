<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
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
	var sIDValue = $('#socialid').val();
	var emailValue = $('#emailBox').val();
	var email2Value = $('#emailSelect').val();
	
	
	
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
	
	$.ajax({  //서버에서 값이 돌아와도 새로고침이 되지 않고 현재페이지는 바뀌지 않고 응답만 받음. 비동기 통신.
		url: "idchk.do",
		type: "post",
		data: { memberID: $('#memberid').val() },
		success: function(data){  //온 결과 값.기본이 text임 
			console.log("success : " + data);
			if(data == "ok"){   
				alert("사용 가능한 아이디입니다.");
				$('#memberpwd').focus();
				$('#submit_button').attr("disabled", false);
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
 


/* 	window.onload = function(){
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


<!-- 
<script>
    
   //회원가입 유효성검사
 // 자원을 화면에 로드하게 되면 수행할 동작(==function)
 window.onload = function() {
       var join = document.limit; //form데이터를 모두 join변수에 저장
       
       // 유효성검사할 부분을 class로 부여했기에 input class 태그를 모두 input에 저장 가져옴
       // 이때 input 한 태그당 배열 인덱스로 받는다.
       var input = document.querySelectorAll('.input');

       // 오류 문구 //errorId : span의 id들(각 요소마다 나타낼 오류를 표시하기 위함)
       // error : class list의 하위 span을 모두 불러냄(일괄 처리를 위함 - 반복문)
       var errorId = [ "idError", "pwError", "pwCheckError", "nameError", "phoneNumError", "emailError" ];
       var error = document.querySelectorAll('.list > span');
    
       
       // 오류문구 초기화 메서드
       // 오류 표시 후, 사용자가 올바르게 수정을 하면 텍스트가 사라지는 모습을 구현
       function innerReset(error){
          for (var i = 0; i < error.length; i++) {
             error[i].innerHTML = "";
          }
       }

       // 초기화 메서드 호출
       innerReset(error);

       // [ ID 입력문자 유효성검사 ] 
      limit.memberid.onkeydown = function(){
          innerReset(error); // 초기화 메서드 호출
          var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식 5~20자 (a~z, A~Z, 0~9, -, _만 입력가능)
          if (!idLimit.test(input[0].value)) { //입력값과 정규식 범위와 같지 않다면
             // id의 오류 문구삽입
             document.getElementById(errorId[0]).innerHTML = "5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";

          }
       }
       // [ PW 입력문자 유효성검사 ]
       limit.memberPWD.onkeydown = function(){
          innerReset(error); // 초기화 메서드 호출
          var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/; //정규식(a~z, A~Z, 0~9, ~!@#$%^&*()_- 만 입력가능)
          if (!pwLimit.test(input[1].value)) { //입력값과 정규식 범위와 같지 않다면
             // pw의 오류 문구삽입
             document.getElementById(errorId[1]).innerHTML = " 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
          }   
       }
       // [ PW 재확인 입력문자 초기화 ]
       //비밀번호 동일여부는 submit 버튼 클릭시 검사해줄 예정
       limit.memberPWD2.onkeydown = function(){
          // pw의 오류 문구삽입
          innerReset(error);// 오류문구 초기화   
       }
       
          
          // [ 이메일 입력 유효성검사 ] 
          join.email.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
             innerReset(error); // 초기화 메서드 호출
             var emailLimit = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/; // 정규식 0~9, a~z, A~Z, -, _, .내에서만 입력가능
                if (!emailLimit.test(input[5].value)) {  //입력값과 정규식 범위와 같지 않다면
                   // 이메일의 오류 문구삽입
                   document.getElementById(errorId[5]).innerHTML = " 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 입력만 가능합니다.";
                }
             }

          
          
          
         
       //**************************************************************************
   //submit 실행시 수행할 동작
     limit.onsubmit = function() { //limit에서 submit이 실행된다면 수행할 함수           
        var errorStr = [ " 아이디를", " 비밀번호를", " 비밀번호 확인을", " 성함을", " 휴대폰번호를", " 이메일을" ];
        
        innerReset(error); // 오류문구 초기화
        
        // [ input 공백확인 ]
        for (var i = 0; i < input.length - 1; i++) { // -1 == submit제외 
           if (!input[i].value) { 
              document.getElementById(errorId[i]).innerHTML = errorStr[i]+ " 입력해 주세요.";
              input[i].focus(); // 포커스 이동
              return false; // 종료 (포커스 이동유지를 위해 false 종료)
           }
        }        
        
       // [ input 공백확인 ]
       for (var i = 0; i < input.length - 1; i++) { // -1 == submit제외 
          if (!input[i].value) { 
             document.getElementById(errorId[i]).innerHTML = errorStr[i]+ " 입력해 주세요.";
             input[i].focus(); // 포커스 이동
             return false; // 종료 (포커스 이동유지를 위해 false 종료)
          }
       }  

    // [주소 input 공백확인]
        {//지역변수 스코프 조정(address) -일회성사용
          var inputAddress = document.querySelectorAll('.addressCheck');
          for(var i = 0; i < inputAddress.length; i++){
             //console.log(inputAddress[i]);
             if(!inputAddress[i].value){
                document.getElementById("addressError").innerHTML = " 주소 혹은 상세주소를 입력해주세요.";
                return false;   
             }
          }
       } 







     
</script>

 -->




</head>
<body>
<div id="entire">
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
		style="padding:0;margin:0;">
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

    <div class="userInput">
        <h3 class="list">이메일<span id="emailError"></span></h3>
        <span class="emailInt" >
        <input type="text" name="email" id="emailBox" maxlength="20" class="input" > 
           <span> @ </span> 
              <!-- 이메일 택일 -->
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
                <!--  <option>직접입력</option> -->
              </select>
        </span>
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
<input type="submit" disabled= 'disabled' value="가입하기" id="submit_button"> &nbsp;
<input type="reset" value="작성취소"> &nbsp;
<a href="home.do">시작페이지로 이동</a>


</form>
	
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