<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet" />
</head>
<body>
<c:set var="SUCCESS" value="1" />
<c:set var="FAIL" value="0" />
<c:if test="${modifyResult eq SUCCESS }">
	<script>alert('글수정 성공')</script>
</c:if>
<c:if test="${modifyResult eq FAIL }">
	<script>alert('글수정 실패')</script>
</c:if>
	<table>
		<caption>글 내용 보기</caption>
	
	<tr>
		<th>글번호</th>
		<td>${content_view.bid }</td>
	</tr>
	<tr>
		<th>글제목</th>
		<td>${content_view.btitle }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${content_view.bname }</td>
	</tr>
	<tr>
		<th>본문</th>
		<td><pre>${content_view.bcontent }</pre></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td><fmt:formatDate value="${content_view.bdate }" pattern="yy년MM월dd일 (E)"/> </td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${content_view.bhit }</td>
	</tr>
	<tr>
		<th>IP</th>
		<td>${content_view.bip }</td>
	</tr>
	<tr>
		<td colspan="2">
		<button onclick="location.href='${conPath}/modify_view.do?bid=${param.bid}&pageNum=${param.pageNum}'">수정</button>
		<button onclick="location.href='${conPath}/delete.do?bid=${param.bid}&pageNum=${param.pageNum}'">삭제</button>
		<button onclick="location.href='${conPath}/reply_view.do?bid=${param.bid}&pageNum=${param.pageNum}'">답변</button>
		<button onclick="location.href='${conPath}/list.do?bid=${param.bid}&pageNum=${param.pageNum}'">목록</button>
		</td>
	</tr>
	</table>
</body>
</html>