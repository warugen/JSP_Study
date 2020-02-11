package com.tj.ex;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// jdbc 드라이버 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String sql = "SELECT * FROM MEMBER WHERE ID=? AND PW = ?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 로그인 성공
				String name = rs.getString("name");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				
				// session에 회원정보 담기
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("name", name);
				session.setAttribute("phone1", phone1);
				session.setAttribute("phone2", phone2);
				session.setAttribute("phone3", phone3);
				session.setAttribute("gender", gender);
				session.setAttribute("validMember", "ok");
				System.out.println("로그인 성공");
				response.sendRedirect("lect2_member/loginResult.jsp");
				
			} else {
				// 로그인 실패 (id나 pw를 재대로 입력하지 않은경우)
				System.out.println("로그인 실패");
				response.sendRedirect("lect2_member/login.jsp?result=loginFail");
			}
		} catch (Exception e) {
			// 로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect("lect2_member/login.jsp?result=loginFail");
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();			
			} catch (Exception e2) {
				System.out.println("DB접속종료 실패 : "+e2.getMessage());
			}
		}
	}
}
