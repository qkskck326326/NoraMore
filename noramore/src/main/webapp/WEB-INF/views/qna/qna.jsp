<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="/resources/js/jquery-3.7.0.min.js"></script>
<title>QnA</title>
<script type="text/javascript">
    $(function() {
        // input 태그의 name 이 item 의 값이 바뀌면(change) 작동되는 이벤트 핸들러 작성
        $('input[name=item]').on('change', function() {
            // 여러 개의 태그 중에서 체크표시가 된 태그를 선택
            $('input[name=item]').each(function(index) {
                // 선택된 radio 순번대로 하나씩 checked 인지 확인함
                if ($(this).is(':checked')) {
                    // 체크 표시된 아이템에 대한 폼이 보여지게 처리함
                    $('form.sform').eq(index).css('display', 'block');
                } else {
                    // 체크 표시 안된 아이템의 폼은 안 보이게 처리함
                    $('form.sform').eq(index).css('display', 'none');
                }
            }); // each
        }); // on
    }); // document ready

    function changeLimit(limit) {
        // alert(limit);
        location.href = "${pageContext.servletContext.contextPath}/qlist.do?page=1&limit="
                + limit;
    }
</script>
</head>
<body>
    <section id="board">
        <h1>QnA</h1>
        <div class="line"></div>
        <button onclick="location.href='qnawrite.do';" class="blueBtn">글쓰기</button>
        <form action="qlist.do" method="get">
            <div class="position">
                <p>검색하기</p>
                <div class="search">
                    <select name="searchType">
                        <option value="title">제목</option>
                        <option value="substance">내용</option>
                        <option value="memberID">작성자</option>
                        <option value="registDt">작성일</option>
                    </select>
                    <input type="text" name="pos">
                    <button type="submit">검색</button>
                </div>
            </div>
        </form>
        <table>
            <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>내용</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            <c:forEach items="${requestScope.list}" var="q">
                <tr>
                    <td align="right">${q.boardId}</td>
                    <td align="right"><a
                        href="${pageContext.servletContext.contextPath}/qnadetail.do?no=${q.boardId}">
                            ${q.title}</a></td>
                    <td align="right">${q.memberID}</td>
                    <td align="right">${q.substance}</td>                    
                    <td align="right">${q.readCount}</td>
                    <td align="center"><fmt:formatDate value="${q.registDt}"
                            pattern="yyyy-MM-dd" /></td>
                </tr>
            </c:forEach>
        </table>
    </section>
</body>
</html>
