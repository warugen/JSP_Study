<%@page import="com.tj.personinfo.PersonInfo"%>
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
	<!-- 프로세스단 -->
	<jsp:useBean class="com.tj.personinfo.PersonInfo" id="pi" scope="request"></jsp:useBean>
	<jsp:setProperty name="pi" property="name" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="pi" property="age" value='<%=Integer.parseInt(request.getParameter("age")) %>'/>
	<jsp:setProperty name="pi" property="gender" value='<%=request.getParameter("gender").charAt(0) %>'/>
	<jsp:setProperty name="pi" property="address" value='<%=request.getParameter("address") %>'/>

	<jsp:forward page="piView.jsp"></jsp:forward>
	
</body>
</html>