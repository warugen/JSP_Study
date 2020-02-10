<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='../css/join.css' rel='stylesheet'>
</head>
<body>
	<%
		// join.jsp로부터 파라미터값 가져오기
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String hiddenParam 	= request.getParameter("hiddenParam");
		String name 		= request.getParameter("name");
		String id 			= request.getParameter("id");
		String pw 			= request.getParameter("pw");
		String birth 		= request.getParameter("birth");
		String[] hobby 		= request.getParameterValues("hobby");
		String gender 		= request.getParameter("gender");
		String email 		= request.getParameter("email");
		String[] mailSend 	= request.getParameterValues("mailSend");
		
		// session에 id 저장하기
		session.setAttribute("id", id);
	%>
<jsp:include page="header.jsp"></jsp:include>
	<div id='joinForm_wrap'>
		<div id='join_title'>회원가입정보</div>
		<h2>이름 : <%=name%></h2>
		<h2>아이디 : <%=id%></h2>
		<h2>비번 :
		<%
			for (int i = 0; i < pw.length(); i++) {
				out.print('*');
			}
		%>
		</h2>
		<h2>생년월일 : <%=birth%></h2>
		<h2>취미 :
		<%
			if (hobby != null) {
				for (int i = 0; i < hobby.length; i++)
					if (i == hobby.length - 1)
						out.print(hobby[i]);
					else
						out.print(hobby[i] + ", ");
			} else {
				out.print("없음");
			}
		%>
		</h2>
		<h2>성별 : <%=gender%></h2>
		<h2>이메일 : <%=email%></h2>
		<h2>메일수신동의 :
		<%
			if (mailSend != null) {
				for (int i = 0; i < mailSend.length; i++) {
					if (i == mailSend.length - 1)
						out.print(mailSend[i]);
					else
						out.print(mailSend[i] + ", ");
				}
			} else {
				out.print("모두 거부");
			}
		%>
		</h2>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>