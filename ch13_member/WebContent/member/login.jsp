<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("member")!=null){
    	response.sendRedirect("main.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<form action="loginOk.jsp" method="post" >
<table>
<caption>로그인</caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" required="required" 
			value="<%
			String id =(String) session.getAttribute("id");
			out.println(id!=null? id : "");
			%>" /></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="pw" required="required" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="로그인" />
			<input type="button" value="회원가입" onclick="location.href='join.jsp'" />
		</td>
	</tr>
</table>
	
</form>
</body>
</html>