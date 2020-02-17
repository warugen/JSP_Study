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
	
	// pageNum추가
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO bDao = BoardDAO.getInstance();
	BoardDTO dto = bDao.getBoardOneLine(num);
%>
<form action="updatePro.jsp" method="post">
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	<input type="hidden" name="num" value="<%=num %>" />
	<table>
		<caption><%=num %>번 글수정</caption>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" required="required" autofocus="autofocus" value="<%=dto.getWriter() %>" /></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="subject" required="required" value="<%=dto.getSubject() %>" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email" value="<%=dto.getEmail()!=null? dto.getEmail():"" %>" /></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea name="content" cols="5" rows="10"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw" required="required" value="<%=dto.getPw() %>" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="수정하기" class="btn" />
			<input type="reset" value="수정취소" class="btn" onclick="history.back()" />
			<input type="button" value="글목록보기" class="btn" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>