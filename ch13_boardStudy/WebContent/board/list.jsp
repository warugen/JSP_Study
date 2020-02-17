<%@page import="com.tj.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.dao.BoardDAO"%>
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
<table>
	<caption>게시판</caption>
	<tr>
		<td><a href="writeFrom.jsp">글쓰기</a></td>
	</tr>
</table>
<table>
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>메일</td>
		<td>IP</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<%
		/**
			paging 처리를 위한 startRow, endRow 계산
			list.jsp -> list.jsp?pageNum=1, list.jsp?pageNum=20
		*/
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// PAGESIZE = 한 페이지당 글수, BLOCKSIZE = 블록당 페이지수 
		final int PAGESIZE = 10, BLOCKSIZE=10;
		
		// startRow = (페이지번호 -1) * 페이지당 갯수 +1
		int startRow = (currentPage-1) * PAGESIZE + 1;
		// endRow = startRow + 페이지당 갯수 +1
		int endRow = startRow + PAGESIZE -1;
		
		BoardDAO bDao = BoardDAO.getInstance();
		int totCnt = bDao.getBoardTotalCnt();	// 전체 글 갯수
		ArrayList<BoardDTO> dtos = null;
		
		if(totCnt == 0) {
			out.println("<tr><td colspan='7'>등록된 글이 없습니다.</td></tr>");
		} else {
			dtos = bDao.listBoart(startRow, endRow);
			
			for(BoardDTO dto : dtos){
				out.println("<tr><td>" + dto.getNum() + "</td><td>" + dto.getWriter() + "</td>");
				out.println("<td class='left'>");
				// 답변글 열여쓰기 + rs.gif 출력하기
				if(dto.getRe_level() > 0) {
					int width = dto.getRe_level() * 10;
					out.println("<img src='../img/level.gif' width='" + width + "' height='10' />");
					out.println("<img src='../img/re.gif' />");
				}
				
				if(dto.getHit() >10) {
					out.println("<img src='../img/hot.gif' />");
				}
				
				out.println("<a href='content.jsp?num=" + dto.getNum() + "&pageNum=" + pageNum + "'>" + dto.getSubject() + " </a></td>");
				out.println("<td>"+(dto.getEmail()!=null? dto.getEmail() : "-")+"</td>");
	 			out.println("<td>"+dto.getIp()+"</td>");
	 			out.println("<td>"+dto.getrDate()+"</td>");
	 			out.println("<td>"+dto.getHit()+"</td></tr>");
			}
		}
	%>
</table>
<div class="paging">
<%
	int pageCnt = (int)Math.ceil((double)totCnt / PAGESIZE);	// 전체 페이지수
	
	// startPage(시작페이지) = ((현재페이지 -1) / 블록사이즈 ) * 블록사이즈 +1
	int startPage = ((currentPage-1) / BLOCKSIZE) * BLOCKSIZE +1;
	// endPage(끝페이지) = 시작페이지 + 블록사이즈 수 -1
	int endPage = startPage + BLOCKSIZE -1;
	
	if(endPage > pageCnt){
		endPage = pageCnt;
	}
	
	if(startPage > BLOCKSIZE){
		out.print(" [<a href='list.jsp?pageNum=" + (startPage-1) + "'> 이전 </a>] ");
	}
	
	for(int i = startPage; i <=endPage; i++){
		if(i == currentPage){
			// 현재 페이지인경우 링크를 나타내지않고 빨강으로 표시
			out.print(" [<b> " + i + " </b> ");
		} else {
			out.print(" [<a href='list.jsp?pageNum=" + i + "'> " + i + " </a>] ");
		}
	}
	
	if(endPage < pageCnt) {
		out.print(" [<a href='list.jsp?pageNum=" + (endPage+1)+"'> 다음 </a>] ");
	}
%>
</div>
</body>
</html>
























