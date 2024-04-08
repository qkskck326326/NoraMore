<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/css/mypageSidebar.css" />

</head>
<body>

<div id="boxLine">

	<span id="nicname">사용자 닉네임</span>
	<div class="box" style="background: #BDBDBD;">
	    <img class="profile_img" src="/images/health.png">
	</div>
	<span id="heart">♡ 하트수</span>
	<span id="grade">등급</span>
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
		<c:url var="articel" value="articel.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ articel }">활동기록</a>
		
	</div>
	
	<div id="resign">
		회원탈퇴
	</div>

</div>


</body>
</html>