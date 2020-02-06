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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String idCk = "aaa";
	String pwCk = "111";
	
	if( !idCk.equals(id) || !pwCk.equals(pw)) {
		
		 %>
		 
		 <script>
		 location.href='login.jsp?msg=no';
		 </script>
		
		 <%
		//response.sendRedirect("loginFrm.jsp?msg=no");
	}
%>
	<div id="loginForm_wrap">
	<div id="login_title">로그인 결과</div>
	<p id="login_join">로그인 성공</p>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>