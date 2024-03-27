<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Caption Hover Effects - Demo 3</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codrops" />
<link rel="stylesheet" type="text/css" href="resources/css/default.css" />
<link rel="stylesheet" type="text/css" href="resources/css/component.css" />
<script src="resources/js/modernizr.custom.js"></script>
<script type="text/javascript">
	function movePage(){	
		location.href = "moveLoginPage.do";
	}

</script>
</head>

<body>

	
	<div class="container">
	
		<header class="headline">
			<h1 class="logo">
				<img src="resources/images/noramore_main.png" width=460 height=220>
			</h1>
			<div class="loginSign">
				<button class='button' onclick="movePage();">로그인</button><br>
				<button class='button' id=two onclick="">회원가입</button>
			</div>
		</header>
		
		<ul class="grid cs-style-3">
			<li>
				<figure>
					<a href="rblist.do">
					<img src="resources/images/balling.png" alt="img04" >
					</a>
					<figcaption>
						<h3>모집</h3>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<a href="freeboardlist.do">
					<img src="resources/images/climbing.png" alt="img01">
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
		</ul>
	</div>
	<!-- /container -->
	<script src="resources/js/toucheffects.js"></script>


	<div class=bottom_contents>
		<div class="announcement">
			
			<div class="an1"><a href ="notice.do">공지사항</a></div>
			
			<div class="inan1">
				<ul>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하</a></li>
				</ul>
			</div>
		</div>
		<div class="qna">
			
			<div class="qna1"><a href="qna.do">QnA</a></div>
			
			<div class="inqnal">
				<ul>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하하하</a></li>
					<li><a>안녕하세요 하핳하하하하ㅏ 너무 졸립니다. 자고 싶습니다. 으하하핳하하하하</a></li>
				</ul>
			</div>
		</div>
	</div>
	<hr>


</body>
</html>
