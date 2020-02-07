<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	width: 1000px;
	margin: 0 auto;
}

header #nav ul {
	overflow: hidden;
}
header #nav ul li {
	float: right;
	list-style: none;
	padding: 10px;
}

header #nav ul li a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<header>
	<div id="nav">
	<%
	String id = null;
	Cookie[] cs = request.getCookies();
	if (cs != null){
		for(Cookie c : cs){
			if(c.getName().equals("id")){
				id = c.getValue();
			}
		}
	}
	%>
	
	<% if(id != null){	//로그인후 헤더화면 %>
	<ul>
		<li><a href="logout.jsp">로그아웃</a></li>
		<li><a href="modifiy.jsp">정보수정</a></li>
		<li><a href="mypage.jsp"><%=id %>님</a></li>
	</ul>
	<% 
	} else {	// 로그인전 헤더화면
	%>
		<ul>
		<li><a href="join.jsp">회원가입</a></li>
		<li><a href="login.jsp">로그인</a></li>
		<li><a href="welcome.jsp">홈</a></li>
	</ul>
	<%
	}
	%>
	
	</div>
	</header>
</body>
</html>