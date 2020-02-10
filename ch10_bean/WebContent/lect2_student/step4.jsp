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
	<jsp:useBean class="com.tj.personinfo.Student" id="st" scope="request"></jsp:useBean>
	<jsp:setProperty name="st" property="studentNum" value='<%=request.getParameter("studentNum") %>'/>
	<jsp:setProperty name="st" property="name" value='<%=request.getParameter("name") %>'/>
	<jsp:setProperty name="st" property="grade" value='<%=Integer.parseInt(request.getParameter("grade")) %>'/>
	<jsp:setProperty name="st" property="className" value='<%=request.getParameter("className").charAt(0) %>'/>
	<jsp:setProperty name="st" property="score" value='<%=Integer.parseInt(request.getParameter("score")) %>'/>

	<jsp:forward page="piView.jsp"></jsp:forward>
	
</body>
</html>