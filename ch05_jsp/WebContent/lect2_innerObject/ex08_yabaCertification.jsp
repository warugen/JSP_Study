<%@page import="java.util.Random"%>
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
	margin: 0 auto;
	padding-top: 100px;
	text-align: center;
}
td {
	font-size: 1.5em;
}
#line1{
	color: red;
}
#line2{
	color: black;
}
input {
	width: 100px;
	margin: 10px;
	padding: 20px;
	background-color: #a1c4fd;
}
</style>
</head>
<body>
<table>
<%
	// 1~3까지 랜덤값 생성
	Random r = new Random();
	int random = r.nextInt(3)+1;
	String msg = "no";
	// yaba.jsp로부터 su값 받아오기
	int inputSu = Integer.parseInt( request.getParameter("su"));
	
	if ( random == inputSu) {
		out.print("<tr><td id='line1'>정답입니다.</td></tr>");
		
		out.print("<tr><td id='line2'>동전이 있던 곳은 : " + random + "</td></tr>");
	} else {
		response.sendRedirect("ex08_yaba.jsp?msg=" + msg + "&su=" + inputSu + "&correct=" + random);
	}
%>

<tr>
	<td><input type="button" value="다시 도전" onclick="location.href='ex08_yaba.jsp'" /></td>
</tr>

</table>

</body>
</html>