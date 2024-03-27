<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
/* 버튼 스타일링 */
.newfb {
  display: inline-block;
  background-color: #4CAF50; /* 기본 배경색 */
  color: white; /* 기본 텍스트 색상 */
  padding: 10px 20px; /* 내부 여백 */
  font-size: 16px; /* 텍스트 크기 */
  border: none; /* 테두리 없음 */
  border-radius: 5px; /* 테두리 반경 */
  cursor: pointer; /* 포인터 커서 */
  text-decoration: none; /* 텍스트에 밑줄 제거 */
}

/* 버튼 호버 효과 */
.newfb:hover {
  background-color: #45a049; /* 호버 배경색 */
}

/* 버튼 액티브 효과 */
.newfb:active {
  background-color: #3e8e41; /* 액티브 배경색 */
}
/* 텍스트 필드 스타일링 */
#fbtext {
  padding: 10px; /* 내부 여백 */
  border: 1px solid #ccc; /* 테두리 */
  border-width: 0 0 1px;
  font-size: 12px; /* 텍스트 크기 */
  width: 200px; /* 너비 */
  box-sizing: border-box; /* 너비에 패딩과 테두리 포함 */
 }

#fbsubmit{
  display: inline-block;
  background-color: #6E6E6E; /* 기본 배경색 */
  color: white; /* 기본 텍스트 색상 */
  padding: 5px 10px; /* 내부 여백 */
  font-size: 12px; /* 텍스트 크기 */
  border: none; /* 테두리 없음 */
  border-radius: 5px; /* 테두리 반경 */
  cursor: pointer; /* 포인터 커서 */
  text-decoration: none; /* 텍스트에 밑줄 제거 */
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
<button class="newfb" onclick="openPopup()">등록하기</button>

<!-- 팝업 -->
<div id="popup" class="popup">
  <form action="forbiddenInsert.do" class="popup-content">
  	<h4 class="title">새 금지어 등록</h4><p>
    <span class="close" onclick="closePopup()">&times;</span> <!-- 팝업 닫기 버튼 -->
    <input id="fbtext" type="text" placeholder="입력해주세요">&nbsp; <!-- 팝업 내부의 input 태그 -->
    <input id="fbsubmit" type="submit" value="등록">
  </form>
</div>

<br>
<table align="center" border="1" cellspacing="0" width="700">
	<tr>
		<th>번호</th>
		<th>금지어</th>
		<th>등록일자</th>
	</tr>
	
	<c:forEach items="${ requestScope.list }" var="b">
		<tr>
			<td align="center">${ f.fbId }</td>
			<td align="center">${ f.fbWord }</td>
			<td align="center">${ f.registDate }</td>
		</tr>
	</c:forEach>

<%-- <c:import url="/WEB-INF/views/common/pagingView.jsp" /> --%>
</table>
</body>
</html>