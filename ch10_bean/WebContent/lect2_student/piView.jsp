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
	<jsp:useBean class="com.tj.personinfo.Student" id="st" scope="request"></jsp:useBean>
	
	<h2>입력된 학생정보</h2>
	<!-- name : pi클래스 property : 가져올 필드값 -->
	<p>학번 : <jsp:getProperty name="st" property="studentNum" /> </p>
	<p>이름 : <jsp:getProperty name="st" property="name" /> </p>
	<p>학년 : <jsp:getProperty name="st" property="grade" /> </p>
	<p>반이름 : <jsp:getProperty name="st" property="className" /> </p>
	<p>점수 : <jsp:getProperty name="st" property="score" /> </p>
</body>
</html>