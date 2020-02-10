<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/login.css" rel="stylesheet">
<script>
	window.onload = function() {
		setTimeout(function() {
			location.href="main.jsp";
		}, 1000);
	};
</script>
<style>
#logOutForm_wrap {
	width: 1000px;
	margin: 10px auto;
	height: 600px;
	border: 1px solid #D4A190;
	line-height: 600px;
	text-align: center;
	font-size: 2em;
	color: #A47160;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="logOutForm_wrap">
<%
	String name = (String)session.getAttribute("name");
	if (name != null) {
		session.invalidate();
		out.println("성공적으로 로그아웃 하였습니다. 메인페이지로 이동합니다.");
	} else {
		out.println("로그인 상태가 아닙니다... ");
	}
%>
</div>
<jsp:include page="footer.jsp"></jsp:include> 
</body>
</html>