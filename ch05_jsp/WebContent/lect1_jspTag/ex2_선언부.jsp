<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span {
	color: red;
}
</style>
</head>
<body>
<%! 
	// 전역변수는 톰캣서버가 종료될때까지 유지하고 있다.
	int i; // 선언부에 선언된 변수는 전역변수 (초기화를 안하면 0으로 초기화된다.)
	StringBuffer strBuf = new StringBuffer("좋아요 ");

	private int sum(int a, int b){
		
		return a + b;
	}

%>
<%
	int j = 0;
	String str = "";
	i++;
	j++;
	strBuf.append("<span>♥</span>");
	str += "<span>♥</span>";
	
	/*
	out.println("<h2>i(전역) = " + i + "</h2>");
	out.println("<h2>j = " + j + "</h2>");
	out.println("<h2>strBuf(전역) = " + strBuf + "</h2>");
	out.println("<h2>str = " + str + "</h2>");
	*/
%>
	<h2>sum(1,2) 결과 = <%=sum(1,2) %></h2>
	<h2>i(전역) = <%=i %></h2>
	<h2>j = <%=j %></h2>
	<h2>strBuf(전역) = <%=strBuf %></h2>
	<h2>str = <%=str %></h2>
</body>
</html>