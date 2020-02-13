package com.tj.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	public static final int SUCCESS = 1;		// 회원가입, 정보수정 할 때
	public static final int FAIL = 0;			// 회원가입, 정보수정 할 때
	public static final int LOGIN_SUCCESS = 1;	// 로그인성공
	public static final int LOGIN_FAIL_ID = -1;	// 로그인 오류(ID오류)
	public static final int LOGIN_FAIL_PW = 0;	// 로그인 오류(PW오류)
	public static final int MEMBER_EXSIT = 0;	// 중복ID체크 (있는 ID)
	public static final int MEMBER_NOT_EXSIT = 1;	// 중복ID체크 (없는 ID)
	
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
	
	// 회원가입시 id 중복체크 (매개변수 : id)
	public int confirmId(String id) {
		int result = MEMBER_NOT_EXSIT;
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디 중복이 있는경우
				result = MEMBER_EXSIT;
			} else {
				// 사용가능한 ID(없는ID)
				result = MEMBER_NOT_EXSIT;
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
		
		return result;
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
	
	// 로그인 처리 (매개변수 : id, pw)
	public int loginCheck(String id, String pw) {
		int result = LOGIN_FAIL_ID;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// id를 재대로 입력
				String dbPw = rs.getString("pw");
				if(dbPw.equals(pw)) {
					// pw가 일치한 경우
					result = LOGIN_SUCCESS;
				} else {
					// pw가 불일치한 경우
					result = LOGIN_FAIL_PW;
				}
			} else {
				// id를 재대로 입력하지 않은경우
				result = LOGIN_FAIL_ID;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}
	
	// id로 dto 가져오기 (매개변수 : id)
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setBirth(rs.getTimestamp("birth"));
				dto.setRdate(rs.getDate("rdate"));
				dto.setAddress(rs.getString("address"));
			} 
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return dto;
	}
	
	// 회원정보 수정 (매개변수 : dto )
	public int updateMember(MemberDTO dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET PW = ?, NAME = ?, EMAIL = ?, BIRTH = ?, ADDRESS = ? " + 
				 "    WHERE ID = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setTimestamp(4, dto.getBirth());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getId());
			
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS ? "정보수정성공" : "정보수정실패\n" + dto.toString());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("정보수정실패"+dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
		return result;
	}
}