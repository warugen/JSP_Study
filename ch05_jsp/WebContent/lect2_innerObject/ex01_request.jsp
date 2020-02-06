<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 192.168.0.8 : IPv4 형식 -->
<!-- request.getRemoteAddr()는 : IPv6 형식으로 나온다.

IP 체크 할일이 생겨서 다음과 같이 검색을 했더니  
<%=request.getRemoteAddr()%> 의 결과가 
0:0:0:0:0:0:0:1 만 나온다.
IPV6 문제이다. WIN7 이상은 기본이 IPV6  

그래서 톰캣 실행시 JVM 환경변수를 추가 해야 한다. 
0:0:0:0:0:0:0:1  이거랑 127.0.0.1 이랑 같다고..

eclipse > Run > Run Configurations > Apache Tomcat > Tomcat v8.5 Server >
Arguiments > 
Program arguments에 "-Djava.net.preferIPv4Stack=true" 입력
VM arguments:에 "-Djava.net.preferIPv4Stack=true" 입력

- 톰캣 재 실행후 재 확인 하면 IPv4로 나온다. 

 -->
<h2>요청한 곳의 주소는 <%=request.getRemoteAddr() %></h2>
</body>
</html>