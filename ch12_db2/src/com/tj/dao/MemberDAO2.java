package com.tj.dao;
// 회원들 리스트 (select * from member 결과), 회원가입, 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tj.dto.MemberDTO;

public class MemberDAO2 {
	private DataSource dataSource;
	private static MemberDAO2 instance; // MemberDAO객체를 가르키는 변수
	
	//외부에서 MemberDAO객체 성성시 MemberDAO dao = MemeberDAO.getInstance();
	public static MemberDAO2 getInstance() {
		if(instance == null) {
			instance = new MemberDAO2();
		}
		return instance;
	}
	private MemberDAO2() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	// 회원 리스트를 가져오는 메소드
	public ArrayList<MemberDTO> selectAll() {
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
		// 2~7단계
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM MEMBER";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				dtos.add(new MemberDTO(id, name, pw, phone1, phone2, phone3, gender));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt !=null) stmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return dtos;
	}
	
	public int insertMember(MemberDTO dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result>0? " 회원가입성공":dto.toString()+" 회원가입실패");
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(dto.toString()+" 회원가입실패");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	
}
