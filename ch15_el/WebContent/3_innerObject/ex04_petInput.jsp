<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="ex04_petResult.jsp">
	ID <input type="text" name="id" id="id" />
	키우는 애완동물을 선택하세요 <br>
	<input type="checkbox" name="pets" id="pets" value="강아지" />강아지
	<input type="checkbox" name="pets" id="pets" value="고양이" />고양이
	<input type="checkbox" name="pets" id="pets" value="금붕어" />금붕어
	<input type="checkbox" name="pets" id="pets" value="앵무새" />앵무새 <br>
	<input type="submit" value="확인" />
</form>
</body>
</html>