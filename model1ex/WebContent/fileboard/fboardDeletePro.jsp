<%@page import="com.tj.model1ex.dao.FileboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int fNum = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String fPw = request.getParameter("fPw");
	FileboardDao fDao = FileboardDao.getInstance();
	int result = fDao.deleteFileboard(fNum, fPw);
	if(result == FileboardDao.SUCCESS){
		// 삭제성공
		%>
		<script> 
			alert('<%=fNum%>번글 삭제 성공');
			location.href='fboardList.jsp?pageNum=<%=pageNum %>';
		</script>
		<%
	} else {
		// 삭제 실패
	%>
		<script>
		alert('<%=fNum%>번글 삭제 실패 비밀번호를 확인하세요'); 
		history.back(); 
		</script>
	<%
		
	}
%>
</body>
</html>