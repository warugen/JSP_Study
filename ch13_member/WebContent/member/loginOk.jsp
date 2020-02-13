<%@page import="com.tj.member.MemberDTO"%>
<%@page import="com.tj.member.MemberDAO"%>
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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO mDao = MemberDAO.getInstance();
	int result = mDao.loginCheck(id, pw);
	
	if(result == MemberDAO.LOGIN_FAIL_ID){
		// id 잘못친경우
%>
		<script>alert('ID를 확인하세요'); history.back();</script>
<%
	} else if (result == MemberDAO.LOGIN_FAIL_PW){
		// pw 잘못친경우
%>
		<script>alert('비밀번호를 확인하세요'); history.back();</script>
<%
	} else if (result == MemberDAO.LOGIN_SUCCESS){
		// 로그인 성공
		// 세션에 member객체로 저장하기
		MemberDTO member = mDao.getMember(id);
		session.setAttribute("member", member);	
		response.sendRedirect("main.jsp");
	}
%>
</body>
</html>