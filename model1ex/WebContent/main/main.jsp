<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mainForm_wrap {
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
	<jsp:include page="header.jsp"></jsp:include>
	<div id="mainForm_wrap">
		main 화면
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>