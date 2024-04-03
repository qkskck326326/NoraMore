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

<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<script>
/*   var context = "${ a.context }";
  var clength = context.length;
  var title = "${ a.title }";
  var tlength = title.length;
  
  if(clength <= 10){
	  document.write(context)''
  }else if(clength > 10){
	  document.write(context.substring(0, 10) + "... ");
  }
  
  if(tlength <= 10){
	  document.write(context)''
  }else if(tlength > 10){
	  document.write(context.substring(0, 10) + "... ");
  } */

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br><br><br><br><br><br>
<h2 class="title">알람</h2>
<br>

	<table class="table" align="center" border="1" cellspacing="0" width="700">
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
				
			    <c:if test="${ a.checkedYN eq 'Y' }">
			    	<div class="checkedColor">
			   	</c:if>
				
				<c:if test="${ a.alarmKind eq 'COMM_FREE' || a.alarmKind eq 'COMM_RECR'}">
					<td>
						<c:if test="${ empty a.refCommentId }">
							글 <a href="/noramore/rbdetail.do?boardId=${ a.boardId }&page=1">'${ a.title }'</a> 에 새로운 댓글이 달렸습니다.
							<br>
							└ '${ a.senderId }' : '${ a.context }' 
						</c:if>
						<c:if test="${ !empty a.refCommentId }">
							'${ a.senderId }' 님의 답글 : '${ a.context }'
						</c:if>
					</td>
				</c:if>
				
				<c:if test="${ a.alarmKind eq 'RECR_APPL' }">
					<td>
						'${ a.senderId }' 님께서 모집 <a href="/noramore/rbdetail.do?boardId=${ a.boardId }&page=1">'${ a.title }'</a> 에 신청하였습니다.
					</td>
				</c:if>
				
				<td>${ a.registDate }</td>
				
				<c:if test="${ a.checkedYN eq 'Y' }">
					<td>읽음</td>
				</c:if>
				<c:if test="${ a.checkedYN eq 'N' }">
					<td>안 읽음</td>
				</c:if>
				
			 	<c:if test="${ a.checkedYN eq 'Y' }">
			    	</div>
			   	</c:if>
			   	
			</tr>
		</c:forEach>

	</table>
<style type="text/css">

.checkedColor{
 color: rgba(128, 128, 128, 0.5);
}

a {
	color: #0174DF;
	font-weight: bold;
	text-decoration: underline;
}

.checkedColor {
    background-color: #f0f0f0; /* 읽음 상태 배경색 */
}

</style>
</body>
</html>