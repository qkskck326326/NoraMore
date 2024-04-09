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
			<c:forEach var="category" items="${categoryList}">
			<li><a href="rblist.do?categoryId=${category.categoryId}"><i class="fa-solid fa-cat"></i> ${category.categoryName}</a>
				<ul>
					<li><a href="rblist.do?categoryId=${category.categoryId}">모집게시판</a></li>
					<li><a href="freeboardlist.do?categoryId=${category.categoryId}">자유게시판</a></li>
				</ul>
			</li>
			</c:forEach>		
			
			<li><a href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a></li>				
			<li><a href="${ pageContext.servletContext.contextPath }/qlist.do">QnA</a></li>				
		</ul>
	</aside>
</body>
</html>