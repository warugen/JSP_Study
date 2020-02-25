<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num" value="1234567.8"></c:set>
	<p>
		첫번째 수는 세자리마다, <br>
		두번째 수는 소수점 2자리까지(소수점 한자리까지만 있는 경우 한자리만) <br>
		세번째 수는 소수점 2자리까지(반드시, 소수점 한자리까지만 있는 경위 뒤에 0)
	</p>
	<p>num : ${num }</p>
	<!-- 자릿수 표시하기 -->
	<p>첫번째 : <fmt:formatNumber value="${num }" groupingUsed="true" /></p>
	<!-- 소수점 자릿수 표시하기 -->
	<p>두번째 : <fmt:formatNumber value="${num }" pattern="#,###.##" /></p>
	<!-- 강제로 소수점 두자리까지 표시하기 -->
	<p>세번째 : <fmt:formatNumber value="${num }" pattern="0,00.00" /></p>
	
</body>
</html>