<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='../css/login.css' rel='stylesheet'>
</head>
<body>
	<div id="loginForm_wrap">
		<form action="loginPro.jsp" method="post" name="frmJoin" onsubmit="return chkJoinInfo()">
			<div id="login_title">로그인</div>
			<table>

				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" class="id" required="required"></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="pw" id="pw" class="pw" required="required"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인" class="loginBtn_style">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<%
						String msg = request.getParameter("msg");
						if (msg != null) { 
					%>
							<p id='login_findIdPw' onclick="alert('id=aaa / pw=111')" >아이디/비밀번호를 잊으셨나요?</p>
					<%
						}
					%>
					</td>
				</tr>
			</table>
			<p id="login_join">아직회원이 아니신가요?<a href="join.jsp">회원가입</a></p>
		</form>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>