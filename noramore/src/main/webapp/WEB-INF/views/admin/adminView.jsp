<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<style type="text/css">

.container {
    position: relative;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin: auto; /* 중앙 정렬 */
}

.statics {
    max-width: 800px; /* 변경된 부분: 테이블이 두 개씩 가로 배치되도록 크기 조절 */
    text-align: center;
    display: flex; /* 변경된 부분: 테이블들을 가로로 나란히 배치하기 위해 flex 사용 */
    flex-wrap: wrap; /* 변경된 부분: 넘칠 경우 다음 줄로 이동하도록 설정 */
    justify-content: space-around; /* 변경된 부분: 테이블들을 가로 방향으로 고르게 배치 */
}

.statics table {
    width: 45%; /* 변경된 부분: 테이블이 가로로 나란히 배치되도록 너비 조절 */
    border-collapse: collapse;
    border: 1px solid #ddd;
    margin-bottom: 20px; /* 변경된 부분: 각 테이블 사이의 간격 조절 */
}

.statics th, .statics td {
    padding: 10px;
    border: 1px solid #ddd;
    width: 50%;'
}

.statics th {
    background-color: #f2f2f2;
}

body {
    text-align: center; /* 내부 요소들을 가로로 가운데 정렬 */
}

</style>
</head>
<body>

<c:import url="/WEB-INF/views/admin/adminSidebar.jsp" />
<br><br><br><br>
<h2 class="title">관리자 메인</h2>
<br><br>
<div class="container">
    <div class="statics">
        <table>
            <tr>
                <th>어제 가입한 회원</th>
                <td>${ flow.enrollYesterday } 명</td>
            </tr>
        </table>
        <table>
            <tr>
                <th>오늘 가입한 회원</th>
                <td>${ flow.enrollToday } 명</td>
            </tr>
        </table>
        <table>
            <tr>
                <th>어제 탈퇴한 회원</th>
                <td>${ flow.withdrawalYesterday } 명</td>
            </tr>
        </table>
        <table>
            <tr>
                <th>오늘 탈퇴한 회원</th>
                <td>${ flow.withdrawalToday } 명</td>
            </tr>
        </table>
                 <table>
            <tr>
                <th>신고된 회원</th>
                <td>${ mlist } 명</td>
            </tr>
        </table>
         <table>
            <tr>
                <th>신고된 게시글</th>
                <td>${ blist } 개</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
