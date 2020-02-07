<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=conPath %>/css/style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	boolean logout=false;
	Cookie[] cs = request.getCookies();
	if(cs != null){
		for(Cookie c : cs) {
			if(c.getName().equals("id")){
				// id이름의 쿠키삭제
				c.setMaxAge(0);
				response.addCookie(c);
			} else if (c.getName().equals("name")){
				// name이름의 쿠키 삭제
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}
	response.sendRedirect("welcome.jsp");
%>
</body>
</html>