<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 유효한 id를 입력한경우
	if(id !=null && id.equals("aaa")){
	
		// 유효한 pw를 입력한경우
		if(pw !=null && pw.equals("111")){
			session.setAttribute("id", id);
			session.setAttribute("name", "홍길동");
			
			response.sendRedirect("welcome.jsp");
		} else {
			// 유효하지않은 pw를 입력한경우
			response.sendRedirect("login.jsp?msg=pw");
			//String msg = URLEncoder.encode("pw를 체크하세요.","utf-8");
		}
		
	} else {
		// 유효하지않은 id를 입력한경우
		response.sendRedirect("login.jsp?msg=id");
		//String msg = URLEncoder.encode("id를 체크하세요.","utf-8");
	}

%>
</body>
</html>