<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int age = Integer.parseInt(request.getParameter("age"));
%>
<%=age %>살은 성인이 아니기 때문에 주류판매 불가합니다.
<button onclick="history.back();">뒤로가기</button>

</body>
</html>