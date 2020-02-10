<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='../css/login.css' rel='stylesheet'>
<style>

</style>
</head>
<body>
<%
	// login.jsp로부터 파라미터값 가져오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 유효한 id를 입력한경우
	if(id !=null && id.equals("aaa")){
	
		// 유효한 pw를 입력한경우
		if(pw !=null && pw.equals("111")){
			session.setAttribute("id", id);
			session.setAttribute("name", "홍길동");
			
			response.sendRedirect("main.jsp");
		} else {
			// 유효하지않은 pw를 입력한경우
			response.sendRedirect("login.jsp?msg=pw");
		}
		
	} else {
		// 유효하지않은 id를 입력한경우
		response.sendRedirect("login.jsp?msg=id");
	}
%>
</body>
</html>