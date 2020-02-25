<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${conPath }/css/style.css" />
</head>
<body>
	<c:set var="nowDate" value="<%=new Date(System.currentTimeMillis()) %>" ></c:set>
	<c:set var="nowTimes" value="<%=new Timestamp(System.currentTimeMillis()) %>" ></c:set>
	<c:set var="nowUtil" value="<%=new java.util.Date() %>" ></c:set>
	<h3>nowDate : ${nowDate }</h3>
	<h3><fmt:formatDate value="${nowDate }" type="date" dateStyle="short"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="date" dateStyle="medium"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="date" dateStyle="long"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="date" dateStyle="full"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="time" timeStyle="short"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="time" timeStyle="medium"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="time" timeStyle="long"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="time" timeStyle="full"/></h3>
	<h3><fmt:formatDate value="${nowDate }" type="both" dateStyle="long" timeStyle="medium"/></h3>
	<h3><fmt:formatDate value="${nowDate }" pattern="yyyy/MM/dd(E요일) hh:mm:ss:SS(a)"/></h3><!-- 오전/오후 단위표시 -->
	<h3><fmt:formatDate value="${nowDate }" pattern="yy년MM월dd일 E요일 HH시mm분ss초SS"/></h3><!-- 24시간 단위표시 -->
	<h3><fmt:formatDate value="${nowTimes }" pattern="yy년MM월dd일 E요일 HH시mm분ss초SS"/></h3><!-- 24시간 단위표시 -->
	<h3><fmt:formatDate value="${nowUtil }" pattern="yy년MM월dd일 E요일 HH시mm분ss초SS"/></h3><!-- 24시간 단위표시 -->
</body>
</html>