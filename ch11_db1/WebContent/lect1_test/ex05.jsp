<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String job = request.getParameter("job").toUpperCase();
	// stmt객체를 사용할 경우 환벽한 sql문이 완성된후 stmt객체 생성이 가능
	String sql = "SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB = ?";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, job);
		rs = pstmt.executeQuery();
		out.println("<table><tr><th>사번</th><th>이름</th><th>직업</th><th>부서번호</th></tr>");
		
		if(rs.next()){
			do {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				int deptno = rs.getInt("deptno");
				out.println("<tr><td>" + empno + "</td><td>" + ename + "</td><td>" + job + "</td><td>" + deptno + "</td><tr>");				
			}while(rs.next());
		} else {
			out.println("<tr><td colspan='4'>해당직책"+job+"의 사원은 없습니다.</td></tr>");
		}
		out.println("</table>");
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}

%>
</body>
</html>