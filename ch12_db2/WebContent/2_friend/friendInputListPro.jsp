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
	
	if(request.getParameter("search")!=null){
		// 검색버튼 눌렀을때		
		if (name !=null && tel !=null){
			// 이름과 전화번호를 동시에 검색
			dtos = fDao.searchName(name, tel);
		} else if(name !=null){
			// 이름으로 검색
			dtos = fDao.searchName(name);
		} else if (tel !=null) {
			// 전화번호로 검색
			dtos = fDao.searchTel(tel);
		}
	} else {
		// 친구등록버튼 눌렀을때
		result = fDao.insertFriend(dto);
		if(result > 0){
			response.sendRedirect("friendInputList.jsp?result=success");
	  } else {		
	   		response.sendRedirect("friendInputList.jsp?result=fail");
	  }
	}%>
</body>
</html>