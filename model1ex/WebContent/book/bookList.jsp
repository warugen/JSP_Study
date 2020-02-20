<%@page import="com.tj.model1ex.dto.BookDto"%>
<%@page import="com.tj.model1ex.dao.BookDao"%>
<%@page import="java.util.ArrayList"%>
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
<table>
	<tr>
		
	
<%
	// listP.jsp -> listP.jsp?pageNum=1  / listP.jsp?pageNum=10
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) pageNum = "1";
	
	int currentPage = Integer.parseInt(pageNum);
	final int PAGESIZE	=	3;
	final int BLOCKSIZE	=	5;
	int startRow 	= (currentPage-1) * PAGESIZE + 1;
	int endRow		= startRow + PAGESIZE -1;
	
	BookDao bDao = BookDao.getInstance();
	ArrayList<BookDto> books = bDao.listBook(startRow, endRow);
	
	for(BookDto b : books){
		%>
		<td><a href="bookDetail.jsp?bid=<%=b.getbId() %>&pageNum=<%=pageNum %>">
		<img src="../bookImg/<%=b.getbImage1() %>"  /><br>
		<Strong><%=b.getbTitle() %></Strong><br></a>
		<del><%=b.getbPrice() %></del><br>
		<%=b.getbPrice()*(100-b.getbDiscount()) /100 %> 
		(<%=b.getbDiscount() %>% 할인)
		</td>
		<%
	}
	%>
	</tr>
	</table>
	<div class="paging">
	<%
	
	int bookTotCnt = bDao.getBookTotCnt();
	int pageCnt = (int)Math.ceil((double)bookTotCnt/PAGESIZE);
	int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
	int endPage = startPage + BLOCKSIZE -1;
	if(endPage > pageCnt) endPage = pageCnt;
	
	if(startPage > BLOCKSIZE){
		%>
		[ <a href="bookList.jsp.jsp?pageNum=<%=startPage-1 %> "> 이전 </a>]
		<%
	}
	
	for (int i = startPage; i <= endPage; i++){
		// 현재페이는 a태그 없애기
		if(i==currentPage){
			out.print(" [<b> " + i + " </b>] ");
		} else {
			out.print(" [ <a href='bookList.jsp?pageNum="+i+"'>" + i + "</a> ] ");
		}
	}
	
	if(endPage<pageCnt){
		%>
		[<a href="bookList.jsp?pageNum=<%=endPage+1 %> "> 다음 </a>]
		<%
	}
%>
	</div>
</body>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>






