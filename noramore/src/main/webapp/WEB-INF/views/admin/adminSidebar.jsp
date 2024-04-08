<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/side.css" rel="stylesheet">
<script src="/noramore/resources/js/jquery-3.7.0.min.js"></script>

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
			<li><a href="#"><i class="fa-solid fa-cat"></i> 회원 관리</a>
				<ul>
					<li><a href="#">회원 목록</a></li>
					<li><a href="#">신고된 회원</a></li>
				</ul>
			</li>
			<li><a href="#"><i class="fa-solid fa-cat"></i>신고된 게시판</a>
				<ul>
					<li><a href="#">모집게시판</a></li>
					<li><a href="#">자유게시판</a></li>
				</ul>
			</li>
			<li><a href="${ pageContext.servletContext.contextPath }/notice.do">공지사항</a></li>				
			<li><a href="${ pageContext.servletContext.contextPath }/qna.do">QnA</a></li>				
		</ul>
	</aside>
</body>
</html>