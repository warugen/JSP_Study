<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 특정 쿠키(쿠키이름이 cookieName인 쿠키) 삭제 : 0초짜리 같은 이름의 쿠키를 만들어서 덮어씌운다.
	Cookie[] cookies = request.getCookies();
	
	if(cookies !=null){
		int idx=0;
		//for(idx=0; idx < cookies.length; idx ++) {
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("cookieName")){
				Cookie cookie = new Cookie("cookieName","xx");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				out.print("<h3>쿠키삭제 성공");
				break;
			}
		}
	} else {
		out.print("생성된 쿠키가 없습니다.");
	}
	
	%>

	<hr />
	<a href="ex01_cookieConstruct.jsp">쿠키생성</a><br>
	<a href="ex02_cookiesList.jsp">쿠키값들 리스트 확인</a><br>
	<a href="ex03_thatCokkie.jsp">특정 쿠키(이름이 cookieName) 찿기</a><br>
</body>
</html>