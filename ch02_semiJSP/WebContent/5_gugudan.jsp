<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<caption>2단 구구단</caption>
<%	for(int i=2; i<=9; i++){%>
	<tr>
		<td><p>2 * <%=i %> = <%=2*i %> </p></td>
	</tr>
<%	} %>
</table>
		
</body>
</html>