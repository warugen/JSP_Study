<%@page import="com.tj.dto.BoardDTO"%>
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
<%
	//String num = request.getParameter("num");
	//BoardDAO bDao = BoardDAO.getInstance();
	//BoardDTO dto = bDao.getBoardOneLine(num);
	
	// pageNum 추가
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bDao = BoardDAO.getInstance();
	bDao.hitUp(num);
	BoardDTO dto = bDao.getBoardOneLine(num);
%>
<table>
	<caption>글 내용 상세보기</caption>
	<tr>
		<th>글번호</th>
		<td><%=dto.getNum() %></td>
	</tr>
	<tr>
		<th>글제목</th>
		<td><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getEmail()!=null ? dto.getEmail() : " - " %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getHit() %></td>
	</tr>
	<tr>
		<th>본문내용</th>
		<td><pre><%=dto.getContent() %></pre></td>
	</tr>
	<tr>
		<th>글쓴이 IP</th>
		<td><%=dto.getIp() %></td>
	</tr>
	<tr>
		<th>글작성시간</th>
		<td><%=dto.getrDate() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="location.href='updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum %>'">수정</button>
			<button onclick="location.href='deleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum %>'">삭제</button>
			<button onclick="location.href='wirteForm.jsp?num=<%=num%>&pageNum=<%=pageNum %>'">답변</button>
			<button onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">목록</button>
		</td>
	</tr>
</table>
</body>
</html>