<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	String agree = request.getParameter("agree");
	String msg = "";
	if(agree !=null && agree.equals("y")){
		// 동의처리 (세션값 받아 저장, 일부세션 날림)
		String id = session.getAttribute("id").toString();
		String pw = session.getAttribute("pw").toString();
		String name = session.getAttribute("name").toString();
		// 파일경로 내 컴퓨터에 맞게 확인하기
		String file = "D:/mega_IT/source/6_JSP/ch08_session/WebContent/WEB-INF/" + id + ".txt";
		PrintWriter writer = null;
		
		try{
			writer = new PrintWriter(file);
			writer.println("오늘은 DB insert 대신 파일에 쓰기");
			writer.println("아이디 : " + id);
			writer.println("비밀번호 : " + pw);
			writer.println("이  름 : " + name);
			msg = "success";
			session.removeAttribute("pw");
			session.removeAttribute("name");
		} catch(Exception e){
			System.out.println(e.getMessage());
		} finally {
			if(writer != null) writer.close();
		}
		
		
	} else if(agree !=null && agree.equals("n")) {
		// 거부처리 (세션 삭제)
		session.invalidate();
		msg = "fail";
		
	} else {
		// 그외의 문자가 들어온경우 다시 가입처리
		response.sendRedirect("join.jsp");
	}
	
	response.sendRedirect("result.jsp?msg=" + msg);
%>
</body>
</html>