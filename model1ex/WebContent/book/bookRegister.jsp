<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<form action="bookRegisterPro.jsp" method="post" enctype="multipart/form-data">
	<table>
		<caption>책 등록</caption>
		<tr>
			<th>책제목</th>
			<td><input type="text" name="bTitle" maxlength="30" required="required"/></td>
		</tr>
		<tr>
			<th>책가격</th>
			<td><input type="number" name="bPrice" min="0" max="9999999" required="required"/></td>
		</tr>
		<tr>
			<th>책 대표 이미지</th>
			<td><input type="file" name="bImage1" /></td>
		</tr>
		<tr>
			<th>책 상세 이미지</th>
			<td><input type="file" name="bImage2" /></td>
		</tr>
		<tr>
			<th>책 소개</th>
			<td><textarea name="bContent" rows="5" cols="20" ></textarea></td>
		</tr>
		<tr>
			<th>책 할인율</th>
			<td><input type="number" name="bDiscount" min="0" max="100" value="0" required="required" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="책등록" class="btn" />
				<input type="reset" value="다시작성" class="btn" />
				<button onclick="location.href='bookList.jsp'" >책목록</button>
			</td>
		</tr>
	</table>
</form>
<jsp:include page="../main/footer.jsp"></jsp:include>
</html>