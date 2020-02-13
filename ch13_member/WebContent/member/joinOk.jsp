<%@page import="com.tj.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String conPath = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.tj.member.MemberDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet" >
</head>
<body>
<%
	// 생일 Timestamp형식으로 변경해주기 이게 귀찮으면 DB설계할때 DATE타입으로 해라
	String tempbirth = request.getParameter("tmpBirth");
	dto.setBirth(Timestamp.valueOf(tempbirth+" 00:00:00"));
	// dto.setRdate(new Date(System.currentTimeMillis()));
	MemberDAO mDao = MemberDAO.getInstance();
	
	// 아이디 중복체크하기
	int result = mDao.confirmId(dto.getId());
	if (result == MemberDAO.MEMBER_NOT_EXSIT){
		// 사용가능한 아이디
		result = mDao.insertMember(dto);
		if(result == MemberDAO.SUCCESS){
			// 회원가입 성공
			session.setAttribute("id", dto.getId());
		%>
			<script>alert('회원가입되었습니다.');
			location.href="login.jsp";
			</script>
		<%
		} else {
			// 회원가입 실패
			%>
			<script>
			alert('회원가입 실패하였습니다.');
			location.href="join.jsp";
			</script>
			<%
		}
	} else {
		// 중복아이디가 있을때
%>
		<script> 
		alert('이미 존재하는 ID입니다.');
		history.back();
		</script>
<%}
%>
</body>
</html>