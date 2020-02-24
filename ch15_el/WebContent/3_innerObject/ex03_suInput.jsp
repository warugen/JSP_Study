<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=conPath %>/css/style.css" />
</head>
<body>
<!--  
<form action="ex03_suPro.jsp"> 
<form action="../ex03_suPro">
-->
<form action="../ex03_suPro">
	누적을 원하는 수 <input type="number" name="su" min="1" required="required" />
	<input type="submit" value="누적" />
</form>
</body>
</html>