<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/header.css" rel="stylesheet">
<script src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<title>noramore</title>
</head>
<body>

	<header id="header" style="height: 90px">
		<c:if test="${ empty sessionScope.loginMember }">
			<div class="header-left">
				<a href="index.jsp">noramore</a>
			</div>
			<div class="header-right">
				<nav>
					<ul>					
						<li><a href="moveLoginPage.do">로그인</a></li>
						<li><a href="moveEnrollPage.do">회원가입</a></li>
					</ul>
				</nav>
			</div>
		</c:if>
		<c:if test="${ !empty sessionScope.loginMember && loginMember.adminYN eq 'N'}">
			<div class="header-left">
				<a href="index.jsp">noramore</a>
			</div>
			<div class="header-right">
				<nav>
					<ul>
						<li><a href="chattingPage.do"><img src="resources/images/alarmIcon.png">채팅</a></li>
						<li><a href="receiveHome.jsp">문의내역</a></li>
						<li><a href="chatbot.do">챗봇</a></li>
						<li><a href="my.do">마이페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</nav>
			</div>
		</c:if>
		<c:if test="${ !empty sessionScope.loginMember && loginMember.adminYN eq 'Y'}">
			<div class="header-left">
				<a href="index.jsp">noramore</a>
			</div>
			<div class="header-right">
				<nav>
					<ul>
						<li><a href="chattingPage.do"><img src="resources/images/alarmIcon.png">채팅</a></li>
						<li><a href="receiveHome.jsp">문의내역</a></li>
						<li><a href="chatbot.do">챗봇</a></li>
						<li><a href="adminPage.do">관리자페이지</a></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
				</nav>
			</div>
		</c:if>
	</header>
</body>
</html>
