<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
/*
	200 : 정상상태
	500 : 문법오류나 예외사항이 발생한경우
	404 : 해당 문서를 찿을 수 없을때
	407 : 인증을 받지 못한경우
	
	익스플로러 구버전은 500에어를 그대로 담고있어서 실제 500페이지를 띄우기때문에
	200으로 설정해줘서 이페이지가 나오도록 해준다.
*/
	response.setStatus(200); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	console.log('예외타입 : ' + '<%=exception.getClass().getName() %>');
	console.log('예외메세지 : ' + '<%=exception.getMessage() %>');
</script>
<body>
<h1>공사중입니다.</h1>

<%
	// 페이지 상단에 현재페이지가 에러페이지라고 선언해줘야 에러가 안난다.
	System.out.println("예외 메세지 : " + exception.getMessage());
	System.out.println("예외 타입 : " + exception.getClass().getName());

%>
</body>
</html>