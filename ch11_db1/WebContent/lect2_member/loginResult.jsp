<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<%
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
	<h2><%=name %>(<%=id %>)님 반갑습니다. 빠----끄</h2>
	<button onclick="location.href='modify.jsp'">회원정보수정</button>
	<button onclick="location.href='logout.jsp'">로그아웃</button>
	
</body>
</html>