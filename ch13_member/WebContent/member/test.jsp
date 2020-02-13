<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.tj.member.MemberDTO"%>
<%@page import="com.tj.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet" >
</head>
<body>
<h2>테스트 페이지</h2>
<%
	MemberDAO mDao = MemberDAO.getInstance();
	String id = "aaa";
	int result = mDao.confirmId(id);
	if(result == MemberDAO.MEMBER_EXSIT){
		out.println("<h3>"+id+"는 중복된 id</h3>");
	} else {
		out.println("<h3>"+id+"는 사용가능 id</h3>");		
	}
	
	/*
	out.print("<hr> 2. insertMember 테스트");
	
	MemberDTO dto = new MemberDTO("bbb", "111", "고길동", "b@b.com", Timestamp.valueOf("1988-01-01 12:12:12"), null, "서울시 종로구" );
	
	result = mDao.insertMember(dto);
	if(result == MemberDAO.SUCCESS){
		out.println("<h3>가입성공</h3>" + dto.toString());
	} else {
		out.println("<h3>가입실패</h3>" + dto.toString());
		
	}
	*/
	out.print("<hr> <h3>3. loginCheck 테스트 </h3>");
	result = mDao.loginCheck("aaa", "111");
	if(result == MemberDAO.LOGIN_SUCCESS){
		out.println("aaa/111 로그인 성공");
	} else if (result == MemberDAO.LOGIN_FAIL_PW) {
		out.println("aaa/111 비밀번호 오류");
		
	} else if (result == MemberDAO.LOGIN_FAIL_ID) {
		out.println("aaa/111 아이디 오류");
	}
	out.print("<br>");
	result = mDao.loginCheck("aaa", "aaa");
	if(result == MemberDAO.LOGIN_SUCCESS){
		out.println("aaa/aaa 로그인 성공");
	} else if (result == MemberDAO.LOGIN_FAIL_PW) {
		out.println("aaa/aaa 비밀번호 오류");
		
	} else if (result == MemberDAO.LOGIN_FAIL_ID) {
		out.println("aaa/aaa 아이디 오류");
	}
	
	out.print("<br>");
	result = mDao.loginCheck("zzz", "111");
	if(result == MemberDAO.LOGIN_SUCCESS){
		out.println("zzz/111 로그인 성공");
	} else if (result == MemberDAO.LOGIN_FAIL_PW) {
		out.println("zzz/111 비밀번호 오류");
		
	} else if (result == MemberDAO.LOGIN_FAIL_ID) {
		out.println("zzz/111 아이디 오류");
	}
	
	out.print("<hr> <h3>4. id로 dto가져오기 테스트 </h3>");
	MemberDTO dto = new MemberDTO();
	dto = mDao.getMember("aaa");
	out.println("aaa인 사람의 정보 : " + dto);
	
	out.print("<hr> <h3>5. 회원정보수정하기 테스트 </h3>");
	dto = new MemberDTO("aaa", "111", "XXX", "X@X.com", Timestamp.valueOf("1988-01-01 12:12:12"), null, "XXXXXXXXX" );
	result = mDao.updateMember(dto);
	if(result == MemberDAO.SUCCESS){
		out.println("aaa 회원정보수정 성공" + mDao.getMember("aaa"));
	} else {
		out.println("aaa 회원정보수정 오류"+ dto);
	}
%>
</body>
</html>



























