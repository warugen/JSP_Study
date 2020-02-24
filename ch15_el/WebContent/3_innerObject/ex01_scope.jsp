<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex02_scope.jsp">
	<p>이름 <input type="text" name="name" id="name" /></p>
	<p>ID <input type="text" name="id" /> </p>
	<p>PW <input type="password" name="pw" /> </p>
	<p><input type="submit" value="전송" /></p>
</form>
<%
	pageContext.setAttribute("pageName", "pageValue");
	request.setAttribute("requestName", "requestValue");	// 자주 사용된다.
	session.setAttribute("sessionName", "sessionValue");	// 자주 사용된다.
	application.setAttribute("applicationName", "applicationValue");
	// forward 할 객체 생성
	RequestDispatcher dispatcher = request.getRequestDispatcher("ex02_scope.jsp?name=hong&id=aaa&pw=111");
	dispatcher.forward(request, response);	// forward된다. 아래의 <jsp:forward>와 같은 동작을 한다.
	
%>
<%-- 
<jsp:forward page="ex02_scope.jsp">
	<jsp:param  name="name" value="홍길동"/>
	<jsp:param  name="id" value="hong"/>
	<jsp:param  name="pw" value="111"/>
</jsp:forward>
--%>

<h3>페이지내 attribute : <%=pageContext.getAttribute("pageName") %> </h3>
<h3>request내 attribute : <%=request.getAttribute("requestName") %> </h3>
<h3>세션내 attribute : <%=session.getAttribute("sessionName") %> </h3>
<h3>application내 attribute : <%=application.getAttribute("applicationName") %> </h3>

<hr />

<h3>페이지내 attribute : ${pageScope.pageName }</h3>
<h3>request내 attribute : ${requestScope.requestName }</h3>
<h3>세션내 attribute : ${sessionScope.sessionName }</h3>
<h3>application내 attribute : ${applicationScope.applicationName }</h3>

<hr />
<!-- 모든 scope변수는 생략가능하다. 따라서 변수가 겹치지않도록 해야한다 -->
<!-- 주로 이런 형식으로 사용한다 -->
<h3>페이지내 attribute : ${pageName }</h3>
<h3>request내 attribute : ${requestName }</h3>
<h3>세션내 attribute : ${sessionName }</h3>
<h3>application내 attribute : ${applicationName }</h3>

</body>
</html>