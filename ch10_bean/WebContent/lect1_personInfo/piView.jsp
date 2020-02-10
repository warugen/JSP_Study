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
	<!-- 뷰 단 -->
	<jsp:useBean class="com.tj.personinfo.PersonInfo" id="pi" scope="request"></jsp:useBean>
	
	<h2>입력된 개인정보</h2>
	<!-- name : pi클래스 property : 가져올 필드값 -->
	<p>이름 : <jsp:getProperty name="pi" property="name" /> </p>
	<p>나이 : <jsp:getProperty name="pi" property="age" /> </p>
	<p>성별 : <jsp:getProperty name="pi" property="gender" /> </p>
	<p>주소 : <jsp:getProperty name="pi" property="address" /> </p>
</body>
</html>