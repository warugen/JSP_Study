<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
<%
	String name = (String)session.getAttribute("name");
	if (name != null) {
		/*
		session.removeAttribute("id");
		session.removeAttribute("pw");
		*/
		
		session.invalidate();
		%> 
		<jsp:include page="../lect3_join/header.jsp"></jsp:include>
		<%
		out.println("<h2>성공적으로 로그아웃 하였습니다. </h2>");
	} else {
		%> 
		<jsp:include page="../lect3_join/header.jsp"></jsp:include>
		<%
		out.println("<h2>로그인 상태가 아닙니다.. </h2>");
	}
%>
	<button onclick="location.href='login.jsp'">로그인</button>
	<button onclick="location.href='sessionTest.jsp'">세션 들여다 보기</button>
</body>
</html>