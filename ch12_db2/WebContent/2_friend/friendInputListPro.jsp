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
	int result = 0;
	ArrayList<FriendDTO> dtos;
	
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	System.out.println("name : " + name);
	System.out.println("tel : " + tel);
	

	// 친구등록버튼 눌렀을때
	result = fDao.insertFriend(dto);
	if(result > 0){
		response.sendRedirect("friendInputList.jsp?result=success");
  	} else {		
   		response.sendRedirect("friendInputList.jsp?result=fail");
  
	}%>
</body>
</html>