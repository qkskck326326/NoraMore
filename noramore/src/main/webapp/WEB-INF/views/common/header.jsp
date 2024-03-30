<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css"  rel="stylesheet">
<script src="/noramore/resources/js/jquery-3.7.0.min.js"></script>
<title>noramore</title>
</head>
<body>
<div class="in">
<%-- 
<%
if(session.getAttribute("user") == null){
	%>
<header>
	<a href="index.jsp">OUR GYM</a>
	
	<nav>
		<ul>
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="board.jsp">회원가입</a></li>
			<li><a href="info.jsp"></a></li>
			
		</ul>
	</nav>
</header>
	<%
}else {
	UserVO vo = (UserVO)session.getAttribute("user");
	%> --%>
	<header>
	<a href="index.jsp">noramore</a>	
	<nav>
		<ul>
			<%-- <li><a href="profile.jsp?id=<%= vo.getUserId() %>">
			<%= vo.getUserName() %></a></li> --%>
			
			<li><a href="board.jsp">채팅</a></li>
			<li><a href="receiveHome.jsp">문의내역</a></li>
			<li><a href="info.jsp"></a>마이페이지</li>
			<li><a href="logout.jsp">로그아웃</a></li>
			
		</ul>
	</nav>
</header>
<%-- 	<%
}
%> --%>