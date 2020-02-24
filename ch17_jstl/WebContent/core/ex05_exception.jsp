<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>예외처리</h2>
	<c:catch var="error"> <!-- catch절에서 예외가 발생할 경우 예외 타입과 예외 메시지를 error에 저장 -->
	<h2>테스트1</h2>
	${8/0.0 }
	<p>예외가 발생되면 즉시 catch절을 빠져나간다. 이문장이 보인다면 예외 발생이 안되었다는것 </p>
	</c:catch>
	예외타입과 메세지 : <c:out value="${error }" default="예외발생 안됨"></c:out>
	
	<c:catch var="error"> <!-- catch절에서 예외가 발생할 경우 예외 타입과 예외 메시지를 error에 저장 -->
	<h2>테스트2</h2>
	<%=8/0 %>
	<p>예외가 발생되면 즉시 catch절을 빠져나간다. 이문장이 보인다면 예외 발생이 안되었다는것 </p>
	</c:catch>
	예외타입과 메세지 : <c:out value="${error }" default="예외발생 안됨"></c:out>
</body>
</html>