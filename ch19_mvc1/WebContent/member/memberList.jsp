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
<c:if test="${joinResult == 1 }">
	<script>alert('회원가입이 완료되었습니다.')</script>
</c:if>
<c:if test="${joinResult == 0 }">
	<script>alert('회원가입 실패되었습니다.')</script>
</c:if>
	<button onclick="location.href='${conPath}/memberJoinView.do'" >회원 가입</button>
	<table>
		<caption>회원정보</caption>
		<tr>
			<th>ID</th><th>PW</th><th>이름</th><th>매일</th><th>생일</th><th>가입일</th><th>주소</th>
		</tr>
		<c:if test="${memberList.size() eq 0 }">
			<tr>
				<td colspan="7">가입한 회원이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${memberList.size() != 0 }">
			<c:forEach var="m" items="${memberList }" >
			<tr>
				<td>${m.id }</td>
				<td><c:forEach begin="1" end="${m.pw.length() }">
				*
				</c:forEach> </td>
				<td>${m.name }</td>
				<td>${m.email }</td>
				<td><fmt:formatDate value="${m.birth }" pattern="MM월dd일"/> </td>
				<td><fmt:formatDate value="${m.rdate }" pattern="yy년MM월dd일 E요일"/></td>
				<td>${m.address }</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>