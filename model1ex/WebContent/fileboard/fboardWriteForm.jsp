<%@page import="com.tj.model1ex.dao.FileboardDao"%>
<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<%
	if(session.getAttribute("customer") == null){
		response.sendRedirect("../customer/login.jsp");
	}

	int num = 0, ref = 0, re_step = 0, re_level =0;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 작성자,id,email 세션에서 가져오기
	String cname = (String)session.getAttribute("cname");
	String cid = (String)session.getAttribute("cid");
	String cemail = (String)session.getAttribute("cemail");
	
	// 글에대한 정보를 담을 dto 객체생성
	FileboardDto dto = new FileboardDto();
	
	if(request.getParameter("num")!=null){
		// 답변글일경우 dto에 원글에대한 정보를 가져온다.
		num = Integer.parseInt(request.getParameter("num"));
		FileboardDao fDao = FileboardDao.getInstance();
		dto = fDao.getFileBoard(num);
		
		ref = dto.getfRef();
		re_step = dto.getfRe_step();
		re_level = dto.getfRe_level();
		
		System.out.println("writeForm.jsp - ref : " + ref);
		System.out.println("writeForm.jsp - re_step : " + re_step);
		System.out.println("writeForm.jsp - re_level : " + re_level);
	} 
%>
<form action="fboardWriteFormPro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	<input type="hidden" name="num" value="<%=num %>" />
	<input type="hidden" name="ref" value="<%=ref %>" />
	<input type="hidden" name="re_step" value="<%=re_step %>" />
	<input type="hidden" name="re_level" value="<%=re_level %>" />
	<input type="hidden" name="cid" value="<%=cid %>" />
	<table>
		<caption><%=num==0? "게시판 글쓰기" : "답변 글쓰기" %></caption>
		<tr>
			<th>작성자</th>
			<td><%=cname %> (<%=cid %>)</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td><input type="text" name="fsubject" required="required" value="<%
				if (dto.getfSubject()!=null){
					out.print("re :" + dto.getfSubject());
				}
			%>" autofocus="autofocus"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=cemail %></td>
		</tr>
		<tr>
			<th>본문</th>
			<td><textarea name="fcontent" cols="5" rows="10"></textarea></td>
		</tr>
		<tr>
			<th>파일첨부</th>
			<td><input type="file" name="fFileName" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="fpw" required="required" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="글쓰기" class="btn" />
			<input type="reset" value="다시쓰기" class="btn" />
			<input type="button" value="글목록보기" class="btn" onclick="location.href='fboardList.jsp?pageNum=<%=pageNum %>'" />
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>


























