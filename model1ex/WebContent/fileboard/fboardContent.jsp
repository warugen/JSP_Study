<%@page import="com.tj.model1ex.dto.CustomerDTO"%>
<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@page import="com.tj.model1ex.dao.FileboardDao"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	FileboardDao fDao = FileboardDao.getInstance();
	fDao.hitUp(num);
	FileboardDto dto = fDao.getFileBoard(num);
%>

<table>
	<caption>글 내용 상세보기</caption>
	<tr>
		<th>글번호</th>
		<td><%=dto.getfNum() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=dto.getfSubject() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getcName() %> (<%=dto.getcEmail()!=null ? dto.getcEmail() : " - " %>)</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		
		<td>
		<%
			if(dto.getfFileName()!=null) {
				out.print("<a href='../fileboardUpload/"+dto.getfFileName()+"' target='_blank' >"+dto.getfFileName()+"</a>");
			} else {
				out.print(" 첨부파일없음 ");
			} 
		%>
		</td>
	</tr>
	<tr>
		<th>본문</th>
		<td><%=dto.getfContent() %></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><%=dto.getfRdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=dto.getfHit() %></td>
	</tr>
	<tr>
		<th>IP</th>
		<td><%=dto.getfIp() %></td>
	</tr>
	<tr>
		<td colspan="2">
		<%
			if(session.getAttribute("customer") !=null){
				
				if(dto.getcId().equals((String)session.getAttribute("cid"))){
					// 세션아이디와 게시글 아이디가 같을때만 수정버튼 보이기
					%>
					<button onclick="location.href='fboardUpdateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>
					<%
				}
				// 로그인했을때 답변버튼 보이기
			%>
				<button onclick="location.href='fboardWriteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">답변</button>
			<%
			}
		%>
			<button onclick="location.href='fboardList.jsp?pageNum=<%=pageNum%>'">목록</button>
			<button onclick="location.href='fboardDeleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">글삭제</button>
		</td>
	</tr>
	
</table>

<jsp:include page="../main/footer.jsp"></jsp:include>
</body>
</html>