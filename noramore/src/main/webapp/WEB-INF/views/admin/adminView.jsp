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
}

.statics {
    max-width: 400px;
    text-align: center;
}

.statics table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #ddd;
}

.statics th, .statics td {
    padding: 10px;
    border: 1px solid #ddd;
}

.statics th {
    background-color: #f2f2f2;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/admin/adminSidebar.jsp" />
<br><br><br><br><br><br>
<h2 class="title">관리자 메인</h2>
<br>
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
        <br>
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
    </div>
</div>
</body>
</html>
