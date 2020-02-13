<%@page import="com.tj.member.MemberDTO"%>
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
	MemberDTO member = (MemberDTO)session.getAttribute("member");
	if(member!=null){
		// 로그인 했을때
		String name = member.getName();
		out.println("<h2>"+name+"님 어서오세요.</h2>");
		out.println("<button onclick=\"location.href='modify.jsp'\">정보수정</button>");
		out.println("<button onclick=\"location.href='logout.jsp'\">로그아웃</button>");
	} else {
		// 로그인 안했을때
		out.println("<h2>손님 어서오세요. </h2>");
		out.println("<button onclick=\"location.href='join.jsp'\">회원가입</button>");
		out.println("<button onclick=\"location.href='login.jsp'\">로그인</button>");
	}
%>

</body>
</html>