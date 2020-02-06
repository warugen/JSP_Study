<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	int su =Integer.parseInt(request.getParameter("su"));
	
	
	
	%>
	<h1>넘어온 숫자 : <%=su %> </h1>
	<%
	for(int i = 1; i<=9; i++){%>
		<p> <%=su %> * <%=i %> = <%=su *i %></p>
	<%}
	%>
</body>
</html>