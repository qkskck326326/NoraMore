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

	var pwdValue = $('#memberPWD').val();
	var pwdValue2 = $('#memberPWD2').val();
	
	if(pwdValue !== pwdValue2){   // == : 값만 일치하는지, === : 값과 자료형이 일치하는지
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("memberPWD2").value = "";  // 두 번째 비밀번호 필드의 값을 비웁니다.
		document.getElementById("memberPWD").select();  // 첫 번째 비밀번호 필드를 선택합니다.
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
		data: { memberID: $('#memberID').val() }, 
		success: function(data){  //온 결과 값.기본이 text임 
			console.log("success : " + data);
			if(data == "ok"){   
				alert("사용 가능한 아이디입니다.");
				$('#memberPWD').focus();
			}else{
				alert("이미 사용중인 아이디입니다.");
				$('#memberID').select();
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
</head>
<body>
<div id="entire">
<h1 align="center">회원가입</h1>
<br>
<!-- 사진파일 첨부시 enctype="multipart/form-data" 속성 추가함 -->
<form action="enroll.do" id="enrollForm" method="post" onsubmit="return validate();">  
<!-- form에는 submit버튼 1개만 만들수 있음 --> <!--  return을 붙여야 이 값을 보낼지 말지 가능함. -->


	<h5>회원 정보를 입력해 주세요. (* 표시는 필수입력 항목입니다.)</h5>
	
	<div>
	<h3 class="list">*아이디<span id="idError"></span></h3>

		<span class="box int_id" >
		<input type="text" name="memberID" id="memberid" class="input" maxlength="20" required></span>  <!-- name은 vo의 필드값과 같아야 함 --> <!-- required : 필수항목 -->	
		<input type="button" value="중복체크" onclick="return dupIDCheck();">
	</div>
		
	<div>
		<h3 class="list">*비밀번호<span id="pwError" ></span></h3>
		<span class="box int_id">
			<input type="password" name="memberPWD" id="memberpwd" class="input" maxlength="20" required>
		</span>
	</div>
	
	<div id="myphoto">
		<img src="/first/resources/member_photofiles/preview.jpg" id="photo" 				
		style="width:150px;height:160px;border:1px solid navy;display:block;"
		alt="사진을 드래그 드롭하세요."
		style="padding:0;margin:0;">
	</div>
	<br>
	
	<div>
		<h3 class="list">비밀번호 재확인<span id="pwCheckError"></span></h3>
		<span class="box int_id">
			<input type="password" id="memberPWD2" class="input" maxlength="20" required><br>
		</span>	
	</div>
	
	<div>
		<h3 class="list">성명<span id="nameError"></span></h3>
		<span class="box int_id">
			<input type="text" name="memberName" class="input" maxlength="20" required><br>
		</span>
	</div>
	
	<div>
		<h3 class="list">주민번호<span id="socialIdError"></span></h3>
		<span class="box int_id">
			<input type="text" name="socialId" class="input" required><br>
		</span>
	</div>
	
	<div>
		<h3 class="list">성별</h3>
		<span class="box int_id">
			<input type="radio" name="gender" value="M" id="m" > 남자 &nbsp; 
			<input type="radio" name="gender" value="F" id="f" > 여자 
		</span>
	</div>
	<br>

    <div class="userInput">
        <h3 class="list">이메일<span id="emailError"></span></h3>
        <span class="emailInt" id="emailBox"> <input type="text" id="email" maxlength="20" class="check" > 
           <span>   @ </span> 
              <!-- 이메일 택일 -->
              <select id="mail_Select">
                 <option>이메일 선택</option>
                 <option>naver.com</option>
                 <option>gmail.com</option>
                 <option>daum.net</option>
                 <option>hanmail.net</option>
                 <option>hotmail.com</option>
                 <option>nate.com</option>
                 <option>yahoo.co.kr</option>
                 <option>empas.com</option>
                 <option>freechal.com</option>
                 <option>lycos.co.kr</option>
                 <option>korea.com</option>
                 <option>hanmir.com</option>
                 <option>dreamwiz.com</option>
                 <option>paran.com</option>
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
       <input type="text" id="sample4_roadAddress" class="d_form mini line" placeholder="도로명주소" readonly>
       <input type="text" id="sample4_jibunAddress" class="d_form mini line" placeholder="지번주소" readonly>
       <span  id="guide" style="color:#999;display:none"></span><br>
       <input type="text" id="sample4_extraAddress" class="d_form mini line" placeholder="참고주소" readonly>
       <input type="text" id="sample4_detailAddress" class="d_form mini line addressCheck" placeholder="상세주소" >
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
<input type="submit" value="가입하기"> &nbsp;
<input type="reset" value="작성취소"> &nbsp;
<a href="home.do">시작페이지로 이동</a>

</form>
	
</div>
</body>
</html>