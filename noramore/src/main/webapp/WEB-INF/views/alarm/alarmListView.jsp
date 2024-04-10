<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 확인 NoraMore : 나랑 함께 놀 사람~ 놀아!모아!</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<style>
    /* Center align the table */
    .table-container {
        text-align: center;
    }
    /* Apply some styles to the table */
    .table {
        width: 80%;
        margin: 0 auto; /* Center the table horizontally */
        border-collapse: collapse;
    }
    .table th, .table td {
        padding: 8px;
        border: 1px solid #ddd;
    }
    .table th {
        background-color: #f2f2f2;
    }
    .aTag {
        color: blue;
    }
   .toggle-container {
   display: none;
    background-color: #f9f9f9;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    z-index: 1000; /* 다른 요소 위에 나타나도록 설정 */
  }   
    
</style>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/sideSample.jsp" />
</head>
<body>
<br><br><br><br><br><br>


<div class="table-container">
    <h2 class="title">알림</h2>
    <br>
    <table class="table">
        <tr>
            <th>번호</th>
            <th>내 용</th>
            <th>발신일</th>
            <th>상 태</th>
        </tr>
        <!-- title, context, senderId 모두 a태그 적용 + a 태그 onclick 시 확인여부 'Y'로 update 요청보내기 -->
        <c:forEach items="${ requestScope.list }" var="a">
            <tr>
                <td>${ a.alarmId }</td>
                <c:if test="${ a.alarmKind.trim() eq 'COMM_FREE' || a.alarmKind eq 'COMM_RECR'}">
                    <td>
                        <c:if test="${ !( a.refCommentId > 0 )}">
                            글 <a class="aTag" href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&categoryId=${ a.categoryId }&page=1" onclick="markAsRead(${a.alarmId}">
                                    <c:if test="${a.title.length() > 10 }">
                                        '${a.title.substring(0, 10)} ... '
                                    </c:if>
                                    <c:if test="${a.title.length() <= 10 }">
                                        '${a.title}'
                                    </c:if>
                                </a> 에 새로운 댓글이 달렸습니다.
                            <br>
                            └ <a href="#" id="toggleButton">'${ a.senderId }' : </a>
                                        <a class="aTag" href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&categoryId=${ a.categoryId }&page=1" onclick="markAsRead(${a.alarmId}">
                                            <c:if test="${a.context.length() > 10 }">
                                                '${a.context.substring(0, 10)} ... '
                                            </c:if>
                                            <c:if test="${a.context.length() <= 10 }">
                                                '${a.context}'
                                            </c:if>
                                        </a>
                        </c:if>
                        <c:if test="${ a.refCommentId > 0}">
                            '${ a.senderId }' 님의 답글 :    
                            <a class="aTag" href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&categoryId=${ a.categoryId }&page=1" onclick="markAsRead(${a.alarmId}">
                                <c:if test="${a.context.length() > 10 }">
                                    '${a.context.substring(0, 10)} ... '
                                </c:if>
                                <c:if test="${a.context.length() <= 10 }">
                                    '${a.context}'
                                </c:if>
                            </a>
                        </c:if>
                    </td>
                </c:if>
                
                <c:if test="${ a.alarmKind.trim() eq 'RECR_APPL' }">
                    <td>
                       <a href="#" id="toggleButton"> '${ a.senderId }'</a>
                       <div class="toggle-container" id="toggleContainer">
						  <select id="selectList">
						    <option value="option1"><a href="">채팅하기</option>
						    <option value="option2">신고하기</option>
						  </select>
						</div> 님께서 모집 
                                <a class="aTag" href="${ pageContext.servletContext.contextPath }/rbdetail.do?boardId=${ a.boardId }&categoryId=${ a.categoryId }&page=1" onclick="markAsRead(${a.alarmId})"  >
                                    <c:if test="${a.title.length() > 10 }">
                                        '${a.title.substring(0, 10)} ... '
                                    </c:if>
                                    <c:if test="${a.title.length() <= 10 }">
                                        '${a.title}'
                                    </c:if>
                                </a> 에 신청하였습니다.
                    </td>
                </c:if>
                
                <td>${ a.registDate }</td>
                
                <c:if test="${ a.checkedYN eq 'Y' }">
                    <td>읽음</td>
                </c:if>
                <c:if test="${ a.checkedYN eq 'N' }">
                    <td>안 읽음</td>
                </c:if>

                
            </tr>
        </c:forEach>
    </table>
</div>



<script>
  const toggleButton = document.getElementById('toggleButton');
  const toggleContainer = document.getElementById('toggleContainer');
  const selectList = document.getElementById('selectList');

  toggleButton.addEventListener('click', function() {
    if (toggleContainer.style.display === 'none') {
      toggleContainer.style.display = 'block';
    } else {
      toggleContainer.style.display = 'none';
    }
  });

  // 토글 창 외부를 클릭하면 토글 창이 닫히도록 설정
  document.addEventListener('click', function(event) {
    const isClickInside = toggleContainer.contains(event.target);
    const isToggleButton = (event.target === toggleButton);
    if (!isClickInside && !isToggleButton) {
      toggleContainer.style.display = 'none';
    }
  });
</script>

<script>
    function markAsRead(alarmId) {
        $.ajax({
            type: "POST",
            url: "alarmCheck.do",
            data: { alarmId: alarmId}
        });
    }
</script>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />
</body>
</html>
