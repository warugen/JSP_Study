<%@page import="com.tj.model1ex.dao.CustomerDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String conPath = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.tj.model1ex.dto.CustomerDTO"></jsp:useBean>
<jsp:setProperty  name="dto" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<%
	String tmpBirth = request.getParameter("tempbirth");
	dto.setCbirth(Date.valueOf(tmpBirth));
	
	CustomerDAO cDao = CustomerDAO.getInstance();
	
	// 아이디 중복체크
	int result = cDao.confirmId(dto.getCid());
	if(result == CustomerDAO.CUSTOMER_NONEXISTENT){
		// 사용가능한 아이디
		result = cDao.insertCustomer(dto);
		if(result == CustomerDAO.SUCCESS) {
			// 회원가입 성공
			session.setAttribute("id", dto.getCid());
			%>
			<script>alert('회원가입되었습니다.');
			location.href="../customer/login.jsp";
			</script>
			<%
		}
	} else {
		// 중복하는 id가 있을때
		%>
		<script> 
		alert('이미 존재하는 ID입니다.');
		history.back();
		</script>
		<%
	}
%>
</body>
</html>