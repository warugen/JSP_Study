<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pi" class="com.tj.personinfo.PersonInfo" scope="request"></jsp:useBean>
<jsp:setProperty name="pi" property="name" param="name"/>
<jsp:setProperty name="pi" property="age" param="age"/>
<jsp:setProperty name="pi" property="gender" param="gender"/>
<jsp:setProperty name="pi" property="address" param="address"/> <!-- 여기서부터는 아무것도 안치면 null값이 나타난다 -->
<jsp:forward page="piView.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>