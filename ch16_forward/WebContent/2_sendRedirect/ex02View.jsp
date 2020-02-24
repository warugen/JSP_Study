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
	<h2>회원정보 (param이용)</h2>
	<h3>ID :  ${param.id }</h3>
	<h3>PW :  ${param.pw }</h3>
	<h3>name :  ${param.name }</h3>
</body>
</html>