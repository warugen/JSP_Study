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
<jsp:include page="header.jsp"></jsp:include>
<%

	Cookie[] cs = request.getCookies();
	if (cs !=null){
		for(Cookie c : cs){
			String cname = c.getName();
			String cvalue = c.getValue();
			out.println("<h3>"+cname +"(쿠키이름) : "+cvalue + "(쿠키값)</h3>");
		}
	} else {
		out.print("존재하는 쿠키가 없습니다.<br>");
	}
%>
	<br>
	<button onclick="history.go(-1);">이전페이지</button>
	<button onclick="location.href='welcome.jsp'">WELCOME메인페이지</button>
	<button onclick="location.href='login.jsp'">로그인</button>
</body>
</html>