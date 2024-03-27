<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    --%>
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/style.css">
		<script type="text/javascript"
			src="/first/resources/js/jquery-3.7.0.min.js"></script>
		<title>Insert title here</title>
</head>
<body>
	<section id="board">

		<h1>게시판</h1>
		<div class="line"></div>
		<%
		if (request.getParameter("pos") != null) {
		%>
		<h3>
			'<%=request.getParameter("pos")%>' 근처 검색 결과
		</h3>
		<%
		}
		%>
		<button onclick="location.href='write.jsp';" class="blueBtn">글쓰기</button>
		<form action="board.jsp" method="get">

			<div class="position">
				<p>검색하기</p>
				<div class="search">
					<input type="text" name="pos">
					<button>검색</button>
				</div>
			</div>
		</form>
		<table>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성자</th>
			</tr>

		</table>

	</section>
</body>
</html>