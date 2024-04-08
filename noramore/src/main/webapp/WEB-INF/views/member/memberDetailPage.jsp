<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(회원)정보 보기 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/memberDetailPage.css" />
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/member/mypageSidebar.jsp" /> 


<div id="info_box">
	<h1>내 프로필</h1>
	<div class="form">
	<span class="title">아이디</span> <span class="input">${ member.memberID }</span> 
	</div>
	
	<div class="form">
		<span class="title">이름</span> <span class="input">${ member.memberName }</span>
	</div>
	
	<div class="form">
		<span class="title">아이디</span> <span class="input">${ member.memberName }</span>
	</div>
	
	<div class="form">
		<span class="title">생일</span> <span class="input">${ member.birth }</span>
	</div>
	
	<div class="form">
		<span class="title">이메일</span> <span class="input">${ member.email }</span>
	</div>
	
	<div>
		<span class="title">주소</span> <span class="input">${ member.address }</span>
	</div>
		<c:url var="updatePage" value="updatePage.do"><!-- url변수를 만듦, 연결할 대상 컨트롤러 매핑값 -->		
			<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
		</c:url>
		<a href="${ updatePage }"><button >수정하기</button></a>
	</div>


<!-- 
<script type="text/javascript">
	var img = document.querySelector(.profile_img);
	src="/images/health.png
</script> -->


</body>
</html>