<%@page import="com.tj.model1ex.dto.FileboardDto"%>
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
	FileboardDao dao = FileboardDao.getInstance();
	FileboardDto dto = new FileboardDto();
	for(int i=0; i<70; i++){
		dto.setcId("AAA");
		dto.setfSubject("제목"+i);
		dto.setfContent("내용");
		if(i%10 ==0) {
			dto.setfFileName("test.PNG");
		}else {
			dto.setfFileName(null);
		}
		dto.setfPw("111");
		dto.setfIp("192.168.0.6");
		dao.insertFileBoard(dto);
	}
	response.sendRedirect("fboardList.jsp");
%>
</body>
</html>