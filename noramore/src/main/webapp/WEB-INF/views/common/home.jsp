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
				<button class='button' onclick="movePage();">로그인 </button>
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

				<c:url var="mypage" value="my.do">
					<c:param name="memberID" value="${ loginMember.memberID }"></c:param>
				</c:url>
				<!--  마이 페이지 들어갈때 자기자신의 정보를 가지고 올 수 있게 함 -->
				<a href="${ mypage }">My Page</a>
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
				<button class='button' onclick="logout()">로그아웃</button>

				<button class='button'
					onclick="${ pageContext.servletContext.contextPath }/adminPage.do">관리자</button>
			</div>
		</c:if>

		<ul class="grid cs-style-3">
			<li>
				<figure>
					<a href="rblist.do"> <img src="resources/images/balling.png"
						alt="img04">
					</a>
					<figcaption>
						<h3>모집</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<a href="freeboardlist.do"> <img
						src="resources/images/climbing.png" alt="img01">
					</a>
					<figcaption>
						<h3>자유</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="resources/images/cycle.png" alt="img02">
					<figcaption>
						<h3>사이클</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="resources/images/health.png" alt="img05">
					<figcaption>
						<h3>헬스</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="resources/images/lessure.png" alt="img03">
					<figcaption>
						<h3>수상레져</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<img src="resources/images/hiking.png" alt="img06">
					<figcaption>
						<h3>등산</h3>
					</figcaption>
				</figure>
			</li>
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
</html>
