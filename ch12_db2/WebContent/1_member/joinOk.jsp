<%@page import="com.tj.dao.MemberDAO"%>
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
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="dto" class="com.tj.dto.MemberDTO"/>
	<jsp:setProperty name="dto" property="*" />
	
	<%
	MemberDAO mDao = MemberDAO.getInstance();
	int result = mDao.insertMember(dto);
	if(result> 0){
		out.println("<h2>회원가입 성공</h2>");
	} else {
		out.println("<h2>회원가입 실패</h2>");
	}
	%>
	<jsp:include page="memberList.jsp"></jsp:include>
</body>
</html>