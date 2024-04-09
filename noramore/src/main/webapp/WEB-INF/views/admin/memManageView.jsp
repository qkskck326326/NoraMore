<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원관리 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        h2.title {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 설정 */
            overflow: hidden; /* 텍스트가 넘칠 경우 자르고 숨김 */
            text-overflow: ellipsis; /* 텍스트가 넘칠 경우 점 세 개로 생략 표시 */
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
 <script type="text/javascript">
 function updateRestrict(memberID) {
     $.ajax({
         type: 'POST',
         url: 'restrict.do',
         data: { memberID: memberID, restrict : "1" },
         success: function(response) {
        	 if(response == "restrict"){
      			alert( "회원의 로그인을 제한합니다." );
      			location.reload();
      		 }else if(response == "failed"){
      			 alert( "회원 활동 제한 설정 에러");
     	 	 };
         },
         error: function(xhr, status, error) {
             console.error("에러 : ", error);
         }
     });
 }
 function rollbackRestrict(memberID) {
     $.ajax({
         type: 'POST',
         url: 'restrictrollback.do',
         data: { memberID: memberID, restrict : "0" },
         success: function(response) {
           	 if(response == "rollback"){
           		alert( "회원의 로그인 제한이 해제되었습니다." );
           		location.reload();
           	 }else if(response == "failed"){
           		 alert( "회원 활동 제한 설정 에러");
           	 };
         },
         error: function(xhr, status, error) {
             console.error("에러 : ", error);
         }
     });
 }
 window.onload = function() {
	    // URL의 쿼리 문자열에서 keyword 값을 가져옴
	    var urlParams = new URLSearchParams(window.location.search);
	    var keyword = urlParams.get('keyword');

	    // 가져온 keyword 값을 입력 필드에 설정
	    if (keyword) {
	        document.getElementById('memsearch').value = keyword;
	    }
	}

	// 검색어 입력 필드가 변경될 때 실행되는 함수
	document.getElementById('memsearch').addEventListener('input', function() {
	    // 입력 필드의 값
	    var keyword = this.value;

	    // 현재 URL의 쿼리 문자열을 가져옴
	    var urlParams = new URLSearchParams(window.location.search);
	    
	    // 검색어를 쿼리 문자열에 추가 또는 업데이트
	    urlParams.set('keyword', keyword);

	    // 변경된 쿼리 문자열을 현재 페이지의 URL에 적용하여 업데이트
	    history.replaceState(null, null, "?" + urlParams.toString());
	});
</script>
</script>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/admin/adminSidebar.jsp" />
</head>
<body>
<br><br><br><br><br><br>
    <div class="container">
        <h2 class="title">전체 회원</h2>
        <br>
		<a class="listRollback" href="${ pageContext.servletContext.contextPath }/memberlist.do">전체 목록</a>
  		<form action="memSearch.do">
			<input type="hidden" name="action" value="member">
			<select>
				<option value="id">아이디</option>
				<option value="gender">성별</option>
				<option value="age">나이</option>
				<option value="enrolldate">가입일자</option>
			</select>
			<input type="search" name="keyword" id="memsearch" placeholder="검색할 회원 정보를 입력하세요"> &nbsp; &nbsp;
			<input type="submit" class="searchMem" value="검색">&nbsp; &nbsp;
			<select name="limit">
				<option value="10" selected>10</option>
				<option value="15" >15</option>
				<option value="20" >20</option>
			</select>
		</form>&nbsp; &nbsp; &nbsp;
        <table>
            <thead>
                <tr>
                	<th>등 급</th>
                    <th>회원아이디</th>
                    <th>닉네임</th>
                    <th>성 별</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>하 트</th>
                    <th>활동 건수</th>
                    <th>상 태</th>
                    <th>관 리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ requestScope.mlist }" var="a">
                    <tr>
                    	<td>${ a.grade }</td>
                        <td>${ a.memberID }</td>
                        <td>${ a.memberNicname }</td>
                        <td>${ a.gender }</td>
                        <td>${ a.email }</td>
                        <td>${ a.registDate }</td>
                        <td>${ a.heartBeat }</td>
                        <td>${ a.articleCount }</td>
                        <td>
                            <c:choose>
                                <c:when test="${ a.actLimit eq 0 }">
                                    일 반
                                </c:when>
                                <c:otherwise>
                                    로그인 제한
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                           <c:if test="${ a.actLimit eq 0 }">
                               <button onclick="updateRestrict('${ a.memberID }');">로그인 제한</button>
                           </c:if>
                           <c:if test="${ a.actLimit eq 1 }">
                               <button onclick="rollbackRestrict('${ a.memberID }');">일반 전환</button>
                           </c:if>
                        </td>
                    </tr>
                </c:forEach> 
            </tbody>
        </table>
    </div>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />

</body>
</html>
