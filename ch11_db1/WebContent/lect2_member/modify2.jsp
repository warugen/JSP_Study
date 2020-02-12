<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String id, name, pw, phone1, phone2, phone3, gender;
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<%
	if(session.getAttribute("validMember") == null){
		response.sendRedirect("login.jsp");
	}

	if(request.getParameter("result") !=null){
	%>
	<script>
		alert('현 비밀번호가 맞지 않아 수정이 불가합니다.');
	</script>
	<%}
	
	// 화면에 수정할 정보를 세션에서 가져오기
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	phone1 = (String)session.getAttribute("phone1");
	phone2 = (String)session.getAttribute("phone2");
	phone3 = (String)session.getAttribute("phone3");
	gender = (String)session.getAttribute("gender");
	
%>

<form action="../ModifyOk2" method="post" >
	<table>
		<caption>정 보 수 정</caption>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="<%=id %>" readonly="readonly" size="20" /></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="<%=name %>" required="required" size="20" /></td>
		</tr>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="oldPw" required="required" size="20" /></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td><input type="password" name="newPw" size="20" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<select name="phone1">
				<%
				/*
				if("02".equals(phone1)){
					out.println("<option>010</option><option selected='selected'>02</option>");
				}else if ("010".equals(phone1)){
					out.println("<option selected='selected'>010</option><option>02</option>");
				}else {
					
				}
				*/
				%>
					<option></option>
					<option <% if("010".equals(phone1)){out.print("selected='selected'");} %>>010</option>
					<option <% if("02".equals(phone1)){out.print("selected='selected'");} %>>02</option>
				</select> -
				<input type="text" name="phone2" value="<%=phone2!=null? phone2:"" %>" size="4"/> -
				<input type="text" name="phone3" value="<%=phone3!=null? phone3:"" %>" size="4" /> 
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<%
			if("m".equals(gender)){%>
				<input type="radio" name="gender" value="m" checked="checked" />남
				<input type="radio" name="gender" value="f" />여
				
			<% } else if ("f".equals(gender)){%>
				<input type="radio" name="gender" value="m"  />남
				<input type="radio" name="gender" value="f" checked="checked" />여
								
			<% } else {%>
				<input type="radio" name="gender" value="m" />남
				<input type="radio" name="gender" value="f" />여
			<%}%>
			</td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="수정" /><input type="reset" value="취소" /><input type="button" value="로그아웃" onclick="location.href='logout.jsp'" /></td></tr>
	</table>
</form>
</body>
</html>