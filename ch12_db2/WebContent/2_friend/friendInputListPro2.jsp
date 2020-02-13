<%@page import="com.tj.dto.FriendDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.dao.FriendDAO"%>
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
	<jsp:useBean id="dto" class="com.tj.dto.FriendDTO"/>
	<jsp:setProperty name="dto" property="*" />
	
	<%
	FriendDAO fDao = FriendDAO.getInstance();
	int result = fDao.insertFriend(dto);
	response.sendRedirect("friendInputList2.jsp?result="+result);
%>

</body>
</html>