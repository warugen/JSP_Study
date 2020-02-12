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
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk2")
public class ModifyOk2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// jdbc 드라이버 설정
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	
	Connection conn;
	PreparedStatement pstmt;
	
	String dbpw, id, name, oldPw, newPw, phone1, phone2, phone3, gender;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		dbpw 	= (String)session.getAttribute("pw");
		id 		= request.getParameter("id");
		name 	= request.getParameter("name");
		oldPw 	= request.getParameter("oldPw");
		newPw 	= request.getParameter("newPw");
		phone1 	= request.getParameter("phone1");
		phone2 	= request.getParameter("phone2");
		phone3 	= request.getParameter("phone3");
		gender 	= request.getParameter("gender");
		
		String sql = "UPDATE MEMBER SET NAME = ?, PW = ?, PHONE1 = ?, PHONE2 = ?, PHONE3 = ?, GENDER = ? WHERE ID = ?";
		if (dbpw.equals(oldPw)) {
			// 회원정보 수정
			if(newPw.equals("")) {
				newPw = oldPw;
			}
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, uid, upw);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, newPw);
				pstmt.setString(3, phone1);
				pstmt.setString(4, phone2);
				pstmt.setString(5, phone3);
				pstmt.setString(6, gender);
				pstmt.setString(7, id);
				
				int result = pstmt.executeUpdate();
				if(result > 0) {
					// 회원수정 성공
					System.out.println("회원수정 성공");
					session.setAttribute("name", name);
					response.sendRedirect("lect2_member/modifyResult.jsp?result=success");
				} else {
					// 회원수정 실패
					response.sendRedirect("lect2_member/modifyResult.jsp?result=fail");
				}
				
			} catch (Exception e) {
				System.out.println("회원수정실패 : " + e.getMessage());
				response.sendRedirect("lect2_member/modifyResult.jsp?result=fail");
				
			} finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(conn!=null) conn.close();			
				} catch (Exception e2) {
					System.out.println("DB접속종료 실패 : "+e2.getMessage());
				}
			}
			
		} else {
			// 비밀번호 일치 실패
			response.sendRedirect("lect2_member/modify.jsp?result=");
		}
		
	}
}
