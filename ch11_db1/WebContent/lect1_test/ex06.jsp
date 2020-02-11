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
<style>
form {
	margin: 0 auto;
	padding: 20px;
	text-align: center;
}
</style>
</head>
<body>
<%
	String deptno = request.getParameter("deptno");
	if(deptno == null || deptno == ""){
		deptno = "";
	}
%>
<form action="#" id="frm">
	부서번호 <input type="text" name="deptno" id="deptno" value="<%if (deptno != null) out.print(deptno); %>"/>
	<input type="submit" value="검색" />
</form>	
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM EMP WHERE DEPTNO LIKE '%' || ?";
	// input박스 널,빈문자 체크
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, deptno);
		rs = pstmt.executeQuery();
		
		out.println("<table><tr><td colspan='4'><h2>사 원 리 스 트</h2></tr></td>");
		out.println("<tr><th>사번</th><th>이름</th><th>직업</th><th>부서번호</th></tr>");
		
		if(rs.next()){
			do {
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				deptno = rs.getString("deptno");
				
				out.println("<tr><td>" + empno + "</td><td>" + ename + "</td><td>" + job + "</td><td>" + deptno + "</td><tr>");
			}while(rs.next());
		} else {
			out.println("<tr><td colspan='4'>해당부서번호 "+deptno+"의 사원은 없습니다.</td></tr>");
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