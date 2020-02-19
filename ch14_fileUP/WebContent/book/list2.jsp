<%@page import="com.tj.book.BookDto"%>
<%@page import="java.util.ArrayList"%>
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
<table><tr>
<%
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook();
	for(int i=0; i< books.size(); i++){
%>
	<td>
		<img src="../bookImg/<%=books.get(i).getbImage1() %>"  /><br>
		<Strong><%=books.get(i).getbTitle() %></Strong><br>
		<del><%=books.get(i).getbPrice() %></del><br>
		<%=books.get(i).getbPrice()*(100-books.get(i).getbDiscount()) /100 %> 
		(<%=books.get(i).getbDiscount() %>% 할인)
	</td>
	<%if(i%3 == 2) out.print("</tr></tr>"); %>
<%
	}
%>
	</tr>
</table>
</body>
</html>