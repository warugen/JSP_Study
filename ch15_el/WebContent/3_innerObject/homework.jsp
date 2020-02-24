<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3 {
	color: red;
}
</style>
</head>
<body>
<form action="#">
	<input type="number" name="su1" value="<%=(int)(Math.random()*9) +1 %>" /> * 
	<input type="number" name="su2" value="<%=(int)(Math.random()*9) +1 %>" /> = 
	<input type="number" name="result"  />
	<p><input type="submit" value="확인" /></p>
	<h3>
	${param.su1 } * ${param.su2 } = ${param.result }
	${(param.su1 * param.su2 eq param.result )}
	${not empty param.result ? (param.su1 * param.su2 eq param.result ? "정답" : "오답") : "" }
	</h3>
</form>

</body>
</html>