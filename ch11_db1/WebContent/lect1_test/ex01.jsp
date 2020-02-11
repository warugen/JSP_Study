<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// 오라클
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	
	// Mysql
	String driverMysql = "com.mysql.jdbc.Driver";
	String urlMysql = "jdbc:mysql://localhost:3306/kimdb";
	String uidMysql = "root";
	String upwdMysql = "mysql";
	
	Connection	conn;
	Statement 	stmt;
	ResultSet 	rs;
%>

<%
	String sql = "SELECT * FROM EMP";
	
	try{
		Class.forName(driver);	// 1단계 : 드라이버 로드
		conn = DriverManager.getConnection(url, uid, upw);	// 2단계 : DB연결객체
		// 3단계 : SQL전송객체
		stmt = conn.createStatement();
		// 4단계 : (sql전송) + 5단계(sql전송결과 받기)
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			int empno 		= rs.getInt("empno");			// empno 필드
			String ename 	= rs.getString("ename");	// ename 필드
			String job 		= rs.getString("job");		// job 필드
			int mgr 		= rs.getInt("mgr");
			Date hiredate 	= rs.getDate("hiredate");
			// Timestamp hire = rs.getTimestamp("hiredate");
			int sal 		= rs.getInt("sal");
			int comm 		= rs.getInt("comm");
			int deptno 		= rs.getInt("deptno");
			
			out.println("<p>" + empno + " (사번) " + ename + "(이름) " + job + "(직책)" + mgr + "(상사사번)" 
						+ hiredate + "(입사일)" + sal + "(급여)" + comm + "(상여)" + deptno + "(부서번호) </p>");
		}
		
	}catch(Exception e){
		System.out.println("에러 메세지 : "+e.getMessage());
	}finally {
		// 7단계 : 연결해제
		try{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();			
		} catch (Exception e){
			System.out.println("연결해제 실패 : "+e.getMessage());
		}
	}
%>
</body>
</html>