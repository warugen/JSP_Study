<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath%>/css/style.css" rel="stylesheet">
</head>
<body>
<%

	String id = null, name = null;	// 쿠키가 있을경우 저장할 용도
	Cookie[] cs = request.getCookies();
	if(cs != null){
		for(int idx=0; idx<cs.length; idx++){
			if(cs[idx].getName().equals("id")){
				id = cs[idx].getValue();
			} else if (cs[idx].getName().equals("name")){
				name = cs[idx].getValue();
			}
		} // for - 로그인 했다면 id(aaa), name(홍길동) / 로그인 안했다면 id,name 둘다 null값
	}
	
	if (id == null){	// 로그인 전 화면
%>
		<h2>손님(guest)반갑습니다. 로그인 하세요.</h2>
		<p><button onclick="location.href='login.html'">로그인</button>
		<button onclick="location.href='cookieslist.jsp'">쿠키들 확인</button>
		
		</p> 		
<%	} else {	// 로그인 이후 화면%>
		<h1><%=name %>(<%=id %>)님 반갑습니다.</h1>
		<p><button onclick="location.href='logout.jsp'">로그아웃</button>
		<button onclick="location.href='cookieslist.jsp'">쿠키들 확인</button>
		</p>
<%	}

%>
</body>
</html>