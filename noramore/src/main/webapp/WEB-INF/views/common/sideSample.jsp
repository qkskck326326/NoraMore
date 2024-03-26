<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/
 6.4.0/css/all.min.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/side.css" rel="stylesheet">
<script src="script/jquery-3.3.1.js"></script>

<title>noramore</title>
</head>
<body>
	<aside class="side-bar">
		<section class="side-bar__icon-box">
			<section class="side-bar__icon-1">
				<div></div>
				<div></div>
				<div></div>
			</section>
		</section>
		<ul>
			<li><a href="#"><i class="fa-solid fa-cat"></i> 메인으로</a> <br>
			<li><a href="#"><i class="fa-solid fa-cat"></i> 볼링</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="#"><i class="fa-solid fa-cat"></i> 클라이밍</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="#"><i class="fa-solid fa-cat"></i> 사이클</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="#">헬스</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="#">수상레져</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="#">등산</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul></li>
			<li><a href="${ pageContext.servletContext.contextPath }/testNotice.do">공지사항</a></li>				
			<li><a href="#">QnA</a></li>				
		</ul>
	</aside>
</body>
</html>