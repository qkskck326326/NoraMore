<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<script src="resources/js/modernizr.custom.js"></script>
<script type="text/javascript">
    function movePage() {    
        location.href = "moveLoginPage.do";
    }

    function enroll() {   
        location.href = "enrollPage.do";
    }

    function logout() {
        location.href = "logout.do";
    }
    
    function my(){
    	location.href = "selectRecrBoadMemberId.do";    	
    }
    
    $(function(){
    	//최근 등록된 공지글 3개 전송받아서 출력 처리
    	$.ajax({
    		url: "ntop5.do",
    		type: "post",
    		dataType: "json",
    		success: function(data){
    			console.log("success : " + data);
    			
    			//object --> string
    			var str = JSON.stringify(data);
    			
    			//string --> json
    			var json = JSON.parse(str);
    			
    			values = "";			
    			for(var i in json.nlist){
    				values += "<tr><td>" + json.nlist[i].no 
    						+ "</td><td><a href='ndetail.do?no=" 
    						+ json.nlist[i].no + "'>"
    						+ decodeURIComponent(json.nlist[i].title).replace(/\+/gi, " ") 
    						+ "</a></td><td>"
    						+ json.nlist[i].date + "</td></tr>";
    			}
    			
    			$('#newnotice').html($('#newnotice').html() + values);
    			//$('#newnotice').append(values);
    		},
    		error: function(jqXHR, textStatus, errorThrown){
    			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
    		}
    	});
</script>
</head>

<body>


	<div class="container">

		<header class="headline">

			<h1 class="logo">
				<img src="resources/images/noramore_main.png" width=460 height=220>
			</h1>
			<div class="line"></div>

		</header>
		<c:if test="${ empty sessionScope.loginMember }">
			<div class="loginMenu">
				<button class='button' onclick="movePage();">로그인</button>
				<button class='button' id=two onclick="enroll();">회원가입</button>
			</div>
		</c:if>
		<c:if
			test="${ !empty sessionScope.loginMember && loginMember.adminYN eq 'N' }">
			<div class="loginMenu">
				<c:url var="mypage" value="selectRecrBoadMemberId.do">
					<c:param name="memberID"
						value="${ sessionScope.loginMember.memberID }"></c:param>
				</c:url>
				<a href="${ mypage }" style="margin-right: 10px; margin-top: 20px;">${ sessionScope.loginMember.memberName }
					님</a>
				<button class='button' onclick="logout()">로그아웃</button>
				
			</div>
		</c:if>
		<c:if
			test="${ !empty sessionScope.loginMember && loginMember.adminYN eq 'Y' }">
			<div class="loginMenu">
				<c:url var="mypage" value="selectRecrBoadMemberId.do">
					<c:param name="memberID"
						value="${ sessionScope.loginMember.memberID }"></c:param>
				</c:url>
				<a href="${ mypage }" style="margin-right: 10px; margin-top: 20px;">${ sessionScope.loginMember.memberName }
					님</a>
				<a href="${ pageContext.servletContext.contextPath }/adminPage.do" style="margin-right: 10px; margin-top: 20px;"> 관리자 페이지 </a>
				
				<button class='button' onclick="logout()">로그아웃</button>
			</div>
		</c:if>

		<ul class="grid cs-style-3">
			<c:forEach var="category" items="${categoryList}">
				<c:url var="goBaord" value="rblist.do">
					<c:param name="categoryId" value="${category.categoryId}" />
				</c:url>
				<li>
					<figure>
						<a href="${goBaord}"> <img
							src="resources/categoryImg/${category.renameFileName}"
							alt="${category.originalFileName}">
						</a>
						<figcaption>
							<h3>${category.categoryName}</h3>
						</figcaption>
					</figure>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- /container -->
	<script src="resources/js/toucheffects.js"></script>


	<div class=bottom_contents>
		<div class="announcement">

			<div class="an1">
				<a href="nlist.do">공지사항</a>
			</div>
			
			<div class="inan1">
				<ul>
					<table id="newnotice" border="1" cellspacing="0" width="350">
				<tr><th>번호</th><th>제목</th><th>날짜</th></tr>
			</table>
				</ul>
			</div>
		</div>
		<div class="qna">

			<div class="qna1">
				<a href="qlist.do">QnA</a>
			</div>

			<div class="inqnal">
				<ul>
					
				</ul>
			</div>
		</div>
		
	</div>
	<hr>

	<div class="adminF">
		<a href="goCategoryWriteForm.do">카테고리 추가</a>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="admin"></div>
	
</body>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</html>
