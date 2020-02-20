<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/login.css" rel="stylesheet" >
<script>
	setTimeout(function() {
		location.href="../main/main.jsp";
	}, 1000);
</script>
<style>
#logOutForm_wrap {
	width: 1000px;
	margin : 10px auto;
	height: 600px;
	border : 1px solid; #003300;
	line-height: 600px;
	text-align: center;
	font-size: 3em;
	color : #003300;
	font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<div id="logOutForm_wrap">
<% 
	session.invalidate();
	response.sendRedirect("../main/main.jsp");
%>
</div>
<jsp:include page="../main/footer.jsp"></jsp:include> 
</body>
</html>