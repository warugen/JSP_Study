<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pi" class="com.tj.personinfo.PersonInfo" scope="request"></jsp:useBean>
<jsp:setProperty  name="pi" property="*"/>
<jsp:forward page="piView.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>