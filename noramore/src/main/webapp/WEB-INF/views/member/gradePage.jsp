<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급</title>

<link rel="stylesheet" type="text/css" href="resources/css/gradePage.css" />
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/member/mypageSidebar.jsp" /> 

<h1>회원등급</h1>
<hr>
<br>
<div>당신은 "${ memAdd.grade }" 등급입니다!</div>

<div>활동한 횟수는 "${ memAdd.articleCount }" 입니다.</div>

<div>
<span>1 ~ 30</span>
<span>31 ~ 50</span>
<span>51 ~ 70</span>
<span>71 ~ 90</span>
<span>91 ~ 110</span>
</div>
<img src="resource/images/sprout.png" alt="새싹">


</body>
</html>