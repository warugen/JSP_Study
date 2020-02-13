<%@page import="com.tj.member.MemberDAO"%>
<%@page import="com.tj.member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
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
<jsp:useBean id="dto" class="com.tj.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	String tmpBirth = request.getParameter("tmpBirth");
	dto.setBirth(Timestamp.valueOf(tmpBirth + " 00:00:00"));
	String oldPw = request.getParameter("oldPw");
	
	MemberDTO member = (MemberDTO)session.getAttribute("member");
	String sessionPw = null;
	
	if (member !=null){
		sessionPw = member.getPw();
	}
	
	// 새 비밀번호를 수정하지 않을때 (pw가 null로 들어온다)
	if(dto.getPw() == null){
		dto.setPw(sessionPw);
	}
	
	if(oldPw.equals(sessionPw)){
		// 현재 비밀번호 일치할때 정보수정 한다.
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updateMember(dto);
		if(result == MemberDAO.SUCCESS){
			// 새션 수정한걸로 갱신해주기
			session.setAttribute("member", dto);
			%>
			<script>alert('회원수정 성공'); location.href="main.jsp"; </script>
			<%
		} else {
			%>
			<script>alert('회원수정 실패 다시 입력해'); location.href="modify.jsp"; </script>
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