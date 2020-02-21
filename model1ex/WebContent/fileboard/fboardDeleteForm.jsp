<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<% 
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
%>
<table>
		<caption><%=num %>번글 삭제</caption>
		<tr>
			<td>
			<fieldset>
			<legend>삭제하기 위한 암호 입력</legend>
			<form action="fboardDeletePro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num %>" />
			<input type="hidden" name="pageNum" value="<%=pageNum %>" />
				<p>암호 <input type="password" name="fPw" required="required" class="btn" autofocus="autofocus"/></p>
				<p>
				<input type="submit" value="삭제" class="btn" />
				<input type="reset" value="삭제취소" onclick="history.go(-1)" class="btn"/>
				</p>
			</form>
			</fieldset>
			</td>
		</tr>
	</table>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>