<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" ></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${conPath }/css/style.css" />
</head>
<body>
	<h2>변수선언</h2>
	<c:set var="varName" value="varVlaue"></c:set>     <!-- 변수 선언 -->
	varName : ${varName }<br>
	varName : <c:out value="${varName }"></c:out> <br> <!-- 출력태그 -->
	<c:set var="varName" value="<varValue>"></c:set>
	varName : ${varName } <br>
	varName : <c:out value="${varName }" escapeXml="true"></c:out> <br> <!-- escapeXml="true" 태그가아니라 특수문자로 인식한다 -->
	<c:remove var="varName"/><br> <!-- 변수 삭제 -->
	varName : ${empty varName ? "삭제됨":"남아있음" }<br>
	varName : ${varName }<br>
	varName : <c:out value="${varName }" default="없어졌어"></c:out><br>
</body>
</html>