<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프로세스단 -->
<jsp:useBean id="st" class="com.tj.personinfo.Student" scope="request"></jsp:useBean>
<jsp:setProperty  name="st" property="*"/>
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