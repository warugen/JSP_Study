<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.model1ex.dao.FileboardDao"%>
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
<div id="content_form">
<table>
	<tr>
		<td colspan="7">  
		<%
		    if (session.getAttribute("customer") != null) {
				%>
				<a href="fboardWriteForm.jsp">글쓰기</a>
				<%
			}
		%>
		</td>
	</tr>
	<tr>
		<th>글번호</th><th>작성자</th><th>글제목</th><th>메일</th><th>IP</th><th>작성일</th><th>조회수</th>
	</tr>
	<%
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE	=	10;
		final int BLOCKSIZE	=	10;
		int startRow 	= (currentPage-1) * PAGESIZE + 1;
		int endRow		= startRow + PAGESIZE -1;
		FileboardDao fDao = FileboardDao.getInstance();
		ArrayList<FileboardDto> fBoards = fDao.listFileboard(startRow, endRow);
		
		if(fBoards.size() == 0){
			out.print("<tr><td colspan='7'> 등록된 글이 없습니다. </td></tr>");
		} else {
			for(FileboardDto f : fBoards){
				%>
				<tr>
				<td> <%=f.getfNum() %> </td>
				<td><%=f.getcName() %></td>
				<td class="left">
				<%
				if(f.getfRe_level()>0){
					// 답변글일경우
					int width = f.getfRe_level() * 20;
					out.print("<img src='../img/level.gif' width='"+width+"' height='10'  />");
					out.print("<img src='../img/re.gif' />");
				}
				if(f.getfHit()>10){
					out.print("<img src='../img/hot.gif' />");
				}
				%>
				
				<a href="fboardContent.jsp?num=<%=f.getfNum() %>&pageNum=<%=pageNum %>"><%=f.getfSubject() %></a>
				<%
				if(f.getfFileName()!=null){
					out.print("<img src='../img/download.png' width='17' />");
				}
				%> 
				</td>
				<td><%=f.getcEmail()==null? " - " : f.getcEmail() %> </td>
				<td><%=f.getfIp() %> </td>
				<td><%=f.getfRdate() %> </td>
				<td><%=f.getfHit() %> </td>
				</tr>
				<%
			}
		}
	%>
</table>
</div>
<div class="paging">
<%
	int fTotCnt = fDao.getBoardTotCnt();
	int pageCnt = (int)Math.ceil((double)fTotCnt/PAGESIZE);
	int startPage = ((currentPage-1)/BLOCKSIZE) * BLOCKSIZE +1;
	int endPage = startPage + BLOCKSIZE -1;
	if(endPage > pageCnt) endPage = pageCnt;
	
	if(startPage > BLOCKSIZE){
		%>
		[ <a href="fboardList.jsp?pageNum=<%=startPage-1 %> "> 이전 </a>]
		<%
	}
	
	for (int i = startPage; i <= endPage; i++){
		// 현재페이는 a태그 없애기
		if(i==currentPage){
			out.print(" [<b> " + i + " </b>] ");
		} else {
			out.print(" [ <a href='fboardList.jsp?pageNum="+i+"'>" + i + "</a> ] ");
		}
	}
	
	if(endPage<pageCnt){
		%>
		[<a href="fboardList.jsp?pageNum=<%=endPage+1 %> "> 다음 </a>]
		<%
	}
%>
</div>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>




