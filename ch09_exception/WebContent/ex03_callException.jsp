<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath %>/css/style.css" rel="stylesheet">
</head>
<body>
	<a href="x.jsp">없는 파일 클릭하면 404에러</a>
	<% 
	
	// nullPointExceptio 강제호출
	//String nullStr = request.getParameter("xx").toString(); 
	
	// NumberFormatException 강제호출
	//Integer.parseInt(request.getParameter("xx"));
	
	// 500에러 강제호출
	int[] arr = {10,20,30};
	for(int idx=0; idx<=arr.length; idx++){
		out.print(arr[idx]);
	}
	
	%>
</body>
</html>