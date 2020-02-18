<%@page import="com.tj.model1ex.dao.CustomerDAO"%>
<%@page import="com.tj.model1ex.dto.CustomerDTO"%>
<%@page import="java.sql.Date"%>
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
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="com.tj.model1ex.dto.CustomerDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String tmpBirth = request.getParameter("tempbirth");
	dto.setCbirth(Date.valueOf(tmpBirth));
	String oldPw = request.getParameter("oldPw");
	
	CustomerDTO customer = (CustomerDTO)session.getAttribute("customer");
	String sessionPw = null;
	
	if(customer !=null){
		sessionPw = customer.getCpw();
	}
	
	// 새 비밀번호를 수정하지 않을때 
	if(dto.getCpw() == null){
		dto.setCpw(sessionPw);
	}
	
	if(oldPw.equals(sessionPw)){
		// 현재 비밀번호가 일치할때 정보수정한다.
		CustomerDAO cDao = CustomerDAO.getInstance();
		int result = cDao.updateCustomer(dto);
		if(result == CustomerDAO.SUCCESS){
			// 새션 수정한걸로 갱신
			session.setAttribute("customer", dto);
			%>
			<script>alert('회원수정 성공'); location.href="../main/main.jsp"; </script>
			<%
		} else {
			%>
			<script>alert('회원수정 실패'); location.href="../customer/modify.jsp"; </script>
			<%
		}
	} else {
		// 현재 비밀번호가 불일치할때 돌려보낸다.
		%>
		<script>alert('현비밀번호가 불일치해서 수정불가'); history.back();</script>
		<%
	}
%>
</body>
</html>