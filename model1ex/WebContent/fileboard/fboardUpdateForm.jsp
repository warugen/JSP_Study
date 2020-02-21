<%@page import="com.tj.model1ex.dto.FileboardDto"%>
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
<%
	if(session.getAttribute("customer") == null){
		response.sendRedirect("../customer/login.jsp");
	}
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	FileboardDao fDao = FileboardDao.getInstance();
	FileboardDto dto = fDao.getFileBoard(num);
%>
<form action="fboardUpdatePro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	<input type="hidden" name="num" value="<%=num %>" />
	<input type="hidden" name="dbFileName" value="<%=dto.getfFileName() %>" />
	<table>
		<caption><%=num %>번글 수정</caption>
		<tr>
			<th>작성자</th>
			<td><%=dto.getcName() %>  (<%=dto.getcId() %>)</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="fsubject" required="required" value="<%=dto.getfSubject() %>" /></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea name="fcontent" cols="5" rows="10"><%=dto.getfContent() %></textarea></td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td>
			<%
			if(dto.getfFileName()!=null){
				%>
				<a href='../fileboardUpload/<%=dto.getfFileName()%>' target="_blank"><%=dto.getfFileName() %></a>
				<%
			}
			%>
			<input type="file" name="fFileName" />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="fpw" required="required" value="<%=dto.getfPw() %>" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="수정하기" class="btn" />
			<input type="reset" value="수정취소" class="btn" onclick="history.back()" />
			<input type="button" value="글목록보기" class="btn" onclick="location.href='fboardList.jsp?pageNum=<%=pageNum %>'" />
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>