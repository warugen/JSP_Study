<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form {
		width : 300px;
		margin : 10px auto;
		
	}
	table {
		border : 1px solid gray;
		padding : 10px;
	}
	
	td{
		text-align: center;
		padding : 5px;
	}
</style>
</head>
<body>
	<form action="8_loginPro.jsp" method="post">
		<table>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input type="password" name="pw"/></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="로그인"/></td>
		</tr>
		</table>
	</form>
</body>
</html>