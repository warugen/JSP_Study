<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	
	Connection 			conn = null;
	PreparedStatement 	pstmt = null;
	ResultSet 			rs = null;
	String sql = "SELECT * FROM EMP";
	
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		out.println("<table>");
		out.println("<tr><th>사  번</th><th>이  름</th><th>입 사 일</th><th>부 서 번 호</th></tr>");
		if(rs.next()){	// sql수행결과가 1행이상 (사번, 이름, 입사일, 부서번호)
			do {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				Timestamp hiredate = rs.getTimestamp("hiredate");
				int deptno = rs.getInt("deptno");
				
				// 출력하기
				out.println("<tr><td>" + empno + "</td><td>" + ename + "</td><td>" + hiredate + "</td><td>" + deptno + "</td><tr>");
				
			}while(rs.next());
		} else {
			// sql수행결과가 0행일때
			out.println("<tr><td colspan='4'>사원이 없습니다.</td></tr>");
		}
		out.println("</table>");
		
	}catch(Exception e) {
		System.out.println(e.getMessage());
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn !=null) conn.close();
	}
	

%>
</body>
</html>