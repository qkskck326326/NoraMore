<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noramore</title>

<style type="text/css">
.popup {
  display: none; /* 기본적으로 숨겨진 상태 */
  position: fixed; /* 화면에 고정된 위치에 배치 */
  z-index: 1; /* 다른 요소 위에 표시되도록 z-index 설정 */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* 화면 크기를 넘어가면 스크롤 표시 */
  background-color: rgb(0,0,0); /* 배경색 */
  background-color: rgba(0,0,0,0.4); /* 배경색 및 투명도 */
}

/* 팝업 내부 스타일 */
.popup-content {
  position:relative;
  background-color: #fefefe;
  margin: 15% auto; /* 가운데 정렬 */
  padding: 20px;
  border: 1px solid #888;
  width: 600px; /* 팝업 너비 */
  border: 2px solid #ccc; /* 테두리 스타일 및 색상 지정 */
  border-radius: 10px; /* 테두리 둥글기 정도 설정 */
  text-align:center;
}

.title {
	margin: 0%;
}

/* 팝업 닫기 버튼 스타일 */
.close {
  position: absolute;
  top:5px;
  right:10px;
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

</style>
<!-- JavaScript 코드 -->
<script type="text/javascript">
// 팝업 열기 함수
function openPopup() {
  document.getElementById("popup").style.display = "block";
}

// 팝업 닫기 함수
function closePopup() {
  document.getElementById("popup").style.display = "none";
}
</script>
</head>
<body>
<!-- 팝업 버튼 -->
<button onclick="openPopup()">팝업 열기</button>

<!-- 팝업 -->
<div id="popup" class="popup">
  <div class="popup-content">
  	<h4 class="title">새 금지어 등록</h4><p>
    <span class="close" onclick="closePopup()">&times;</span> <!-- 팝업 닫기 버튼 -->
    <input type="text" placeholder="입력해주세요"> <!-- 팝업 내부의 input 태그 -->
    <input type="submit" value="등록하기">
  </div>
</div>

</body>
</html>