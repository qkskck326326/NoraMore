<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/sideSample.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"src="/noramore/resources/js/jquery-3.7.0.min.js"></script>	
<script type="text/javascript">
    $(function(){
        $('input[name="title"]').on('input', function(){
            var title = $(this).val();
            if (title == '') {
                $('#title').text('글 제목*');
            } else {
                $('#title').text('글 제목');
            }
        });

        $('textarea[name="context"]').on('input', function(){
            var context = $(this).val();
            if (context == '') {
                $('#context').text('본문*');
            } else {
                $('#context').text('본문');
            }
        });

        $('input[name="start"]').on('input', function(){
            var start = $(this).val();
            if (start == '') {
                $('#sDate').text('활동시작 날짜*');
            } else {
                $('#sDate').text('활동시작 날짜');
            }
        });

        $('input[name="end"]').on('input', function(){
            var end = $(this).val();
            if (end == '') {
                $('#eDate').text('활동마감 날짜*');
            } else {
                $('#eDate').text('활동마감 날짜');
            }
            
            if($('input[name="end"]').val() < $('input[name="start"]').val()){
            	 alert("종료 날짜를 시작 날짜 이전 날짜로 지정 할 수 없습니다");
            	 $('input[name="end"]').val(null);
            }
        });
        
        
        $('input[name="maxRecr"]').on('input', function(){
            var maxRecr = $(this).val();
            if (maxRecr == '') {
                $('#mr').text('모집인원*');
            } else {
                $('#mr').text('모집인원');
            }
        });
    });
    
    
    function checkInput() {
        var title = $('input[name="title"]').val();
        var context = $('textarea[name="context"]').val();
        var start = $('input[name="start"]').val();
        var end = $('input[name="end"]').val();
        var maxRecr = $('input[name="maxRecr"]').val();

        if (title.trim() === '') {
            alert('글 제목을 입력하세요.');
            return false;
        }
        if (context.trim() === '') {
            alert('본문을 입력하세요.');
            return false;
        }
        if (start.trim() === '') {
            alert('활동 시작 날짜를 입력하세요.');
            return false;
        }
        if (end.trim() === '') {
            alert('활동 마감 날짜를 입력하세요.');
            return false;
        }
        if (maxRecr.trim() === '') {
            alert('모집인원을 입력하세요.');
            return false;
        }

        return true;
    }

</script>
<title>Insert title here</title>
</head>
<body>
	
		
    <form action="#" method="post" enctype="multipart/form-data" >
	<%-- <input type="hidden" value="<%= vo.getUserId() %>" name="writer"> --%>
	<section id="write">
		<h1>글쓰기</h1>
		<div class="line"></div>
		
		<p id="title">글 제목*</p>
		<input  type="text" placeholder="글 제목을 입력하세요." name="title">
		
		<p id="context">본문*</p>
		<textarea rows="30" cols="70" placeholder="본문을 입력하세요." name="context"></textarea>
		
		<p>첨부파일</p>
		<input type="file" id="file" name="file">
		
		<div style="margin: 20px">			
		    <p id="sDate" style="display: inline-block; width: 110px;">활동시작 날짜*</p>
		    <input  type="date" name="start" style="display: inline-block; width: 200px;"> &nbsp;
				
		    <p id="eDate" style="display: inline-block; width: 110px;">활동마감 날짜*</p>
		    <input type="date" name="end" style="display: inline-block;; width: 200px;">
		    
		    <p id="mr" style="margin-top: 20;">모집인원*</p>
		    <input name="maxRecr" type="number">
		</div>
		
		<p>장소</p>
		<input type="text" placeholder="주소를 입력해주세요" id="where" name="mainlocation" readonly>
		<input type="text" placeholder="상세주소를 입력해주세요"  name="sublocation">
		
		<button type="button" onclick="checkInput();">글쓰기</button>
		<input type="submit" class="none">
	</section>
</form>



</body>
</html>