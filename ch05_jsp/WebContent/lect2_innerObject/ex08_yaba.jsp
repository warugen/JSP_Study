<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{ 
	margin: 0;
	padding: 0;
}
form {
	width: 400px;
	margin: 0 auto;
	padding-top: 100px;
	text-align: center;
}
input {
	width: 100px;
	margin: 10px;
	padding: 20px;
	background-color: #a1c4fd;
}
div {
	color: red;
}
</style>
</head>
<body>
<form action="ex08_yabaCertification.jsp">
<input type="button" value="1번" onclick="location.href='ex08_yabaCertification.jsp?su=1'"/>
<input type="button" value="2번" onclick="location.href='ex08_yabaCertification.jsp?su=2'"/>
<input type="button" value="3번" onclick="location.href='ex08_yabaCertification.jsp?su=3'"/>
<p>
<p>
<%
	String msg = request.getParameter("msg");
	String su = request.getParameter("su");
	String correct = request.getParameter("correct");
	if(msg!=null){
		out.print("<div>");
		out.print("Wrong Try Again!<br>");
		out.print("("+su + "은(는) 아니고 정답은 " + correct +")");
		out.print("</div>");
	}
%>


</form>
</body>
</html>