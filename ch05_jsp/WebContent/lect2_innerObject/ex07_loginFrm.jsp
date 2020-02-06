<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table {
	border: 1px solid gray;
	margin: 0 auto;
	width : 400px;
	text-align: center;
}
.msg {
	color: red;
}
</style>
</head>
<body>
<!-- 로그인 페이지 -->
<form action="loginCertification.jsp">
<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" id="id" /></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="pw" id="pw" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="로그인" /></td>
	</tr>
	<tr>
		<td colspan="2" class="msg">
		<%
		String msg = request.getParameter("msg");
		if(msg != null){
			out.print(msg);
		}
		%>
		</td>
	</tr>
</table>
</form>
</body>
</html>