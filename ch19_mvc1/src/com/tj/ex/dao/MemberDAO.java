package com.tj.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tj.ex.dto.MemberDTO;

public class MemberDAO {
	public static final int SUCCESS = 1;		// 회원가입, 정보수정 할 때
	public static final int FAIL = 0;			// 회원가입, 정보수정 할 때
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	// 생성자
	private MemberDAO() {}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	// 회원가입 (매개변수 : dto)
	public int insertMember(MemberDTO dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (ID, PW, NAME, EMAIL, BIRTH, RDATE, ADDRESS) " + 
				"    VALUES (?, ?, ?, ?, ?, SYSDATE, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setTimestamp(5, dto.getBirth());
			pstmt.setString(6, dto.getAddress());
			
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS ? "회원가입성공" : "회원가입실패\n" + dto.toString());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("회원가입실패"+dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		
		return result;
	}
	
	// 회원 리스트 출력
	public ArrayList<MemberDTO> getListMember() {
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setBirth(rs.getTimestamp("birth"));
				member.setRdate(rs.getDate("rdate"));
				member.setAddress(rs.getString("address"));
				members.add(member);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		
		return members;
	}
}




























