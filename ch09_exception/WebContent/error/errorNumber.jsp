<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>	<!-- Exception 내부객체 쓰기위해 선언해준다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	console.log('예외 타입 : ' + '<%=exception.getClass().getName() %>');
	console.log('예외 메세지 : ' + '<%=exception.getMessage()%>');
</script>
</head>
<body>
	<h2>본 페이지는 공사중입니다.</h2>
	(errorNumber.jsp)
</body>
</html>