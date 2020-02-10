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
<jsp:useBean class="com.tj.personinfo.PersonInfo" id="pi" scope="page"></jsp:useBean>
<jsp:setProperty name="pi" property="name" value='<%=request.getParameter("name") %>'/>
<jsp:setProperty name="pi" property="age" value='<%=Integer.parseInt(request.getParameter("age")) %>'/>
<jsp:setProperty name="pi" property="gender" value='<%=request.getParameter("gender").charAt(0) %>'/>
<jsp:setProperty name="pi" property="address" value='<%=request.getParameter("address") %>'/>

	<h2>입력된 개인정보</h2>
	<!-- name : pi클래스 property : 가져올 필드값 -->
	<p>이름 : <jsp:getProperty name="pi" property="name" /> </p>
	<p>나이 : <jsp:getProperty name="pi" property="age" /> </p>
	<p>성별 : <jsp:getProperty name="pi" property="gender" /> </p>
	<p>주소 : <jsp:getProperty name="pi" property="address" /> </p>
</body>
</html>