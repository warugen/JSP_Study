<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table {
	width : 400px;
	border: 1px solid gray;
	margin: 0 auto;
	text-align: center;
}

</style>
</head>
<body>
<!-- 로그인 검사 페이지 -->
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String idCk = "aaa";
	String pwCk = "111";
	//String msg = URLEncoder.encode("아이디와 비밀번호를 확인하세요.", "utf-8");
	String msg = "아이디와 비밀번호를 확인하세요.";
	
	if( !idCk.equals(id) || !pwCk.equals(pw)) {
		 %>
		 
		 <script>
		 alert('<%=msg %>');
		 location.href='loginFrm.jsp';
		 </script>
		
		 <%
		//response.sendRedirect("loginFrm.jsp?msg=" + msg);
	}
	
%>
<table>
<tr>
	<td>아이디는 <%=id %> 이고 </td>
</tr>
<tr>
	<td>비밀번호는 <%=pw %> 입니다. </td>
</tr>
<tr>
	<td></td>
</tr>
<tr>
	<td>반갑습니다.</td>
</tr>
</table>
</body>
</html>