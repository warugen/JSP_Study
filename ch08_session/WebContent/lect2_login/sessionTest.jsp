<%@page import="java.util.Enumeration"%>
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
<jsp:include page="../lect3_join/header.jsp"></jsp:include>
<%
	Enumeration<String> sAttNames = session.getAttributeNames();
	int cnt = 0;
	while(sAttNames.hasMoreElements()){
		String sname = sAttNames.nextElement();
		String svalue = session.getAttribute(sname).toString();
		out.println("<h2>"+sname + "(세션명) : " + svalue+ "(세션값) </h2><br>");
		cnt++;
	}
	
	if (cnt == 0){
		out.println("<h2>유효한 세션이 없습니다. </h2>");
	}
%>
	<button onclick="history.go(-1)">이전페이지</button>
	<button onclick="location.href='login.jsp'">로그인</button>
	<button onclick="location.href='logout.jsp'">로그아웃</button>
	
</body>
</html>