<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("customer")!=null){
    	response.sendRedirect("../main/main.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/login.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<div id="loginForm_wrap">
		<form action="loginPro.jsp" method="post" name="frmJoin" onsubmit="return chkJoinInfo()">
			<div id="login_title">로그인</div>
			<table>

				<tr>
					<th><label for="id">아이디</label></th>
					<td><input type="text" name="cid" id="cid" class="cid" required="required"
					value="<% 
					String sessionId = (String)session.getAttribute("id");
					String cid = request.getParameter("cid");
					if (sessionId !=null) {
						out.print(sessionId);
					} else if (cid != null){
						out.print(cid);
					}
				%>"
					></td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td><input type="password" name="cpw" id="cpw" class="cpw" required="required"></td>
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
							<script>alert('로그인에 실패하였습니다.');</script>
							<p id='login_findIdPw'>아이디/비밀번호를 잊으셨나요?</p>
					<%
						}
					%>
					</td>
				</tr>
			</table>
			<p id="login_join">아직회원이 아니신가요?<a href="join.jsp">회원가입</a></p>
		</form>
	</div>
	<%@include file="../main/footer.jsp" %>
</body>
</html>