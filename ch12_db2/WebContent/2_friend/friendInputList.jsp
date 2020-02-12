<%@page import="com.tj.dto.FriendDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tj.dao.FriendDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
<style>
form {
	margin: 0 auto;
	padding: 20px;
	text-align: center;
}
</style>
</head>
<body>
<%
	String result = request.getParameter("result");
	if("success".equals(result)){
		// 친구 추가 성공 
%>
		<script>
		alert('친구추가 성공');
		</script>
<%	} else if ("fail".equals(result)) { 
		// 친구 추가 실패
%>
		<script>
		alert('친구추가 실패 이름이나 전화번호가 너무 길면 안되고 중복된 전번도 안되요');
		</script>
<%	}
%>
<form action="friendInputListPro.jsp">
	친구이름 <input type="text" name="name" id="name" size="10" />
	전화번호 <input type="text" name="tel" id="tel" size="13"/>
	<input type="submit" value="추가" />
</form>

<table>
	<tr>
		<th>순번</th><th>이름</th><th>전화번호</th>
	</tr>
<%
	FriendDAO fDao = FriendDAO.getInstance();
	ArrayList<FriendDTO> dtos = fDao.selectAll();
	
	for(FriendDTO dto : dtos){%>
		<tr>
			<td><%=dto.getSno() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getTel() %></td>
		</tr>
<%	}
%>
 
</table>
</body>
</html>