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
 		<td><a href="wirteForm.jsp">글쓰기</a></td>
 	</tr>
 </table>
 <table>
 	<tr>
 		<th>글번호</th><th>작성자</th><th>제목</th><th>메일</th><th>IP</th><th>작성일</th><th>조회수</th>
 	</tr>
 	<%
 		BoardDAO bDao = BoardDAO.getInstance();
 		int totCnt = bDao.getBoardTotalCnt();
 		ArrayList<BoardDTO> dtos = null;
 		
 		if(totCnt == 0) {
 			out.println("<tr><td colspan='7'>등록된 글이 없습니다.</td></tr>");
 		} else {
 			dtos = bDao.listBoard();
	 		for(BoardDTO d : dtos){ // 글번호, 작성, 제목, 메일, ip, 작성일, 조회수
	 			out.println("<tr><td>"+d.getNum() + "</td><td>" + d.getWriter() + "</td>" );
	 			out.println("<td id='left'>");
	 			if(d.getHit()>10){
	 				// hit수가 10개 이상일때
	 				out.println("<img src='../img/hot.gif'>");
	 			}
	 			out.println("<a href='content.jsp?num="+d.getNum()+"'>"+d.getSubject()+"</a></td>");
	 			out.println("<td>"+(d.getEmail()!=null? d.getEmail() : "-")+"</td>");
	 			out.println("<td>"+d.getIp()+"</td>");
	 			out.println("<td>"+d.getrDate()+"</td>");
	 			out.println("<td>"+d.getHit()+"</td></tr>");
	 		}
 		}
 		
 	%>
 	
 </table>
</body>
</html>