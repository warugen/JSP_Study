<%@page import="com.tj.model1ex.dto.CustomerDTO"%>
<%@page import="com.tj.model1ex.dao.CustomerDAO"%>
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
	String cid = request.getParameter("cid");
	String cpw = request.getParameter("cpw");
	
	CustomerDAO cDao = CustomerDAO.getInstance();
	int result = cDao.loginCheck(cid, cpw);
	
	if(result == CustomerDAO.LOGIN_FAIL){
		// 로그인 실패
		response.sendRedirect("login.jsp?msg=pw&cid="+cid);
	} else {
		// 로그인 성공
		// 세션에 customer 객체로 저장
		CustomerDTO customer = cDao.getCustomer(cid);
		session.setAttribute("customer", customer);
		session.setAttribute("cid", customer.getCid());
		session.setAttribute("cpw",customer.getCpw());
		session.setAttribute("cname",customer.getCname());
		session.setAttribute("ctel", customer.getCtel());
		session.setAttribute("cemail", customer.getCemail());
		session.setAttribute("caddress",customer.getCaddress());
		session.setAttribute("cbirth", customer.getCbirth());
		session.setAttribute("cgender", customer.getCgender());
		session.setAttribute("crdate",customer.getCrdate());
		response.sendRedirect("../main/main.jsp");
	}
%>
</body>
</html>