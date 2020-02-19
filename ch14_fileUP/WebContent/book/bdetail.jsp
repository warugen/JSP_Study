<%@page import="com.tj.book.BookDto"%>
<%@page import="com.tj.book.BookDao"%>
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
<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	String pageNum = request.getParameter("pageNum");
	
	BookDao bDao = BookDao.getInstance();
	BookDto book = bDao.getBook(bid);
%>
<table>
	<tr>
		<td rowspan="4"><img src="../bookImg/<%=book.getbImage1() %>" /></td>
		<td><%=book.getbId() %>번 도서 상세보기</td>
	</tr>
	<tr>
		<td><%=book.getbTitle() %></td>
	</tr>
	<tr>
		<td>
			<del><%=book.getbPrice() %></del><br>
			<%=book.getbPrice() * (100 - book.getbDiscount()) / 100 %><br>
			<b><%=book.getbDiscount() %>% 할인</b>
		</td>
	</tr>
	<tr>
		<td>
			<button>구매하기</button>
			<button onclick="location='listP.jsp?pageNum=<%=pageNum %>'">책목록</button>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="../bookImg/<%=book.getbImage2() %>" /><br>
			<pre><%=book.getbContent() %></pre>
		</td>
	</tr>
</table>
</body>
</html>