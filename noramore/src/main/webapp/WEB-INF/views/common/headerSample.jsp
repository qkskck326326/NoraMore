<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css" rel="stylesheet">
<script src="script/jquery-3.3.1.js"></script>
<title>Our Gym</title>
</head>
<body>
	<div class="in">

		<%
		if (session.getAttribute("user") == null) {
		%>
		<header>
			<a href="index.jsp">noramore</a>

			<nav>
				<ul>
					<li><a href="login.jsp">로그인</a></li>
					<li><a href="board.jsp">회원가입</a></li>
					<li><a href="info.jsp">test</a></li>

				</ul>
			</nav>
		</header>
		<%
		} else {
		%>
		<header>
			<a href="index.jsp">OUR GYM</a>

			<nav>
				<ul>
					<li><a href="board.jsp">게시판</a></li>
					<li><a href="receiveHome.jsp">받은 문의</a></li>
					<li><a href="sendHome.jsp">보낸 문의</a></li>
					<li><a href="info.jsp">헬스기구 사용법</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>

				</ul>
			</nav>
		</header>
		<%
		}
		%>