<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
<script>
	setTimeout(function() {
		location.href="main.jsp";
	}, 1000);
</script>
</head>
<body>
<% session.invalidate(); %>
<h2>로그아웃 되었습니다. 잠시후 메인페이지로 이동합니다.</h2>
</body>
</html>