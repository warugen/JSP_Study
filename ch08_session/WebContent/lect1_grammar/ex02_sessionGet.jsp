<%@page import="java.util.Enumeration"%>
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
<%
	// 특정한 세션값 가져오기
	String sessionName = (String)session.getAttribute("sessionName");
	Integer myNum = (Integer)session.getAttribute("myNum");
	out.println("<h2>sessionName : " + sessionName + "</h2>");
	out.println("<h2>myNum : " + myNum + "</h2>");
	out.println("<h2>id : " + session.getAttribute("id") + "</h2>");	// 해당하는 세션이 없으면 null로 출력된다.
	
	// 모든 세션 리스트 출력
	out.println("<hr/>");
	out.println("<h2>모든 세션 속성들 list</h3>");
	Enumeration<String> sAttNames = session.getAttributeNames();
	int cnt = 0;
	while(sAttNames.hasMoreElements()){
		String sname = sAttNames.nextElement();						// 세션(속성)이름
		String svalue = session.getAttribute(sname).toString();		// 세션(속성)값
		out.println("<h3>" + sname + "(세션이름) : " + svalue + "(세션값)<h3>");
		cnt++;
	}
	
	if(cnt == 0){
		out.println("<h3>세션 속성이 없습니다. </h3>");
	}
	
	// 특정한 세션을 삭제하기(로그아웃시 사용)
	session.removeAttribute("myNum");	// myNum세션 삭제
	
	// 모든 세션 리스트 출력
	out.println("<hr/>");
	out.println("<h2>모든 세션 속성들 list</h3>");
	sAttNames = session.getAttributeNames();
	cnt = 0;
	while(sAttNames.hasMoreElements()){
		String sname = sAttNames.nextElement();						// 세션(속성)이름
		String svalue = session.getAttribute(sname).toString();		// 세션(속성)값
		out.println("<h3>" + sname + "(세션이름) : " + svalue + "(세션값)</h3>");
		cnt++;
	}
	
	if(cnt == 0){
		out.println("<h3>세션 속성이 없습니다. </h3>");
	}
	
	
	// 모든 세션 삭제하기
	session.invalidate();	//setAtribute했던 모든 세션 값 다 삭제
	out.println("<hr/>");
	if(request.isRequestedSessionIdValid()){	// 유효한 속성이 있는지 확인 // 세션의 유효성 보기
		out.println("<h3>ssion valid </h3><br>");
	} else {
		out.println("<h3>session invalid </h3><br>");
	}
%>
	<hr>
	<h2>세션 ID : <%=session.getId() %></h2>
	<h2>세션의 유효시간 : <%=session.getMaxInactiveInterval() %></h2>
</body>
</html>