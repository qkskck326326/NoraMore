<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
</head>
<body>

<h2>Login</h2>

<%-- �α��� �� --%>
	<form name = "�α���" action="login.do" method="post"> <!-- �α��� Survlet �� ����  -->
		<label>���̵�: <input type="text" name="userId" id="uid" class="pos"></label><br> <!-- getparameter�� ���ƾ��� -->
		<label>��ȣ : <input type="password" name="userPwd" id="upwd" class="pos"></label><br> <!-- name�� ��Ʈ�ѷ��� �� -->
		<input type="submit" value="�α���">
	</form>

</body>
</html>