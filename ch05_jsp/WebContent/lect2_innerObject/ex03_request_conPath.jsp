<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=conPath %>/css/ex3.css" />
</head>
<body>
	<!-- ch05_jsp(context root), /ch05_jsp(context path)  -->
	<h2>컨텍스트 path : <%=request.getContextPath() %></h2>
	<hr />
	<a href="../index.jsp">index.jsp</a>
	<hr />
	<a href="/ch05_jsp/index.jsp">index.jsp</a>
	<hr />
	<button onclick="location.href='../Ex3'">ex3서블릿</button>
	<button onclick="location.href='<%=conPath %>/Ex3'">ex3서블릿</button>
</body>
</html>