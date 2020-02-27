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
	<form action="${conPath }/modify.do" method="post" >
	<!--  
	param.bid로 넘겨도 가능
	<input type="hidden" name="bid" value="${param.bid }" />
	-->
	<input type="hidden" name="bid" value="${modify_view.bid }" />
	<input type="hidden" name="pageNum" value="${param.pageNum }" />
	
		<table>
			<caption>글 수정하기</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="bname" required="required" value="${modify_view.bname }" /></td>
			</tr>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="btitle" required="required" value="${modify_view.btitle }" /></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea name="bcontent"  cols="30" rows="10" >${modify_view.bcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글수정하기" class="btn" />
					<input type="reset" value="취소" class="btn" />
					<input type="button" value="목록" onclick="location.href='history.back()'" class="btn" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>