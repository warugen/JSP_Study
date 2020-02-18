package com.tj.model1ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.tj.model1ex.dto.CustomerDTO;

public class CustomerDAO {
	public static final int SUCCESS = 1; // 회원가입, 정보수정 할 때
	public static final int FAIL = 0;    // 회원가입, 정보수정 할 때
	public static final int LOGIN_SUCCESS = 1; // 로그인 성공
	public static final int LOGIN_FAIL = 0; // 로그인 오류(ID오류)
	public static final int CUSTOMER_EXISTENT = 0; // 있는(중복된) ID
	public static final int CUSTOMER_NONEXISTENT = 1; // 없는(사용가능한) ID
	
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	private CustomerDAO() {}
	// conn객체 가져오는 함수
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
	// 1. 회원가입시 id 중복체크 (매개변수 :cid)
	public int confirmId(String cid) {
		int result = FAIL;
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 아이디중복이 있는경우
				result = CUSTOMER_EXISTENT;
			} else {
				result = CUSTOMER_NONEXISTENT;
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
	// 2. 회원가입 (매개변수 :dto)
	public int insertCustomer(CustomerDTO dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO CUSTOMER (CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH ) " + 
				"    VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCid());
			pstmt.setString(2, dto.getCpw());
			pstmt.setString(3, dto.getCname());
			pstmt.setString(4, dto.getCtel());
			pstmt.setString(5, dto.getCemail());
			pstmt.setString(6, dto.getCaddress());
			pstmt.setString(7, dto.getCgender());
			pstmt.setDate(8, dto.getCbirth());
			
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
	// 3. 로그인 처리 (매개변수 : id, pw)
	public int loginCheck(String cid, String cpw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM CUSTOMER WHERE CID=? and CPW=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, cpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 로그인성공
				result = LOGIN_SUCCESS;
			} else {
				// 로그인실패
				result = LOGIN_FAIL;
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
	// 4. id로 DTO가져오기 (매개변수 : id)
	public CustomerDTO getCustomer(String cid) {
		CustomerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM CUSTOMER WHERE CID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			//CID, CPW, CNAME, CTEL, CEMAIL, CADDRESS, CGENDER, CBIRTH
			if(rs.next()) {
				dto = new CustomerDTO();
				dto.setCid(rs.getString("CID"));
				dto.setCpw(rs.getString("CPW"));
				dto.setCname(rs.getString("CNAME"));
				dto.setCtel(rs.getString("CTEL"));
				dto.setCemail(rs.getString("CEMAIL"));
				dto.setCaddress(rs.getString("CADDRESS"));
				dto.setCgender(rs.getString("CGENDER"));
				dto.setCbirth(rs.getDate("CBIRTH"));
				dto.setCrdate(rs.getTimestamp("CRDATE"));
				
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
	// 5. 회원정보 수정 (매개변수 : dto)
	public int updateCustomer(CustomerDTO dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE CUSTOMER SET CPW=?, " + 
				"                CNAME=?, " + 
				"                CTEL = ?, " + 
				"                CEMAIL=?, " + 
				"                CADDRESS=?, " + 
				"                CBIRTH=to_date(?,'yyyy-mm-dd'), " + 
				"                CGENDER = ? " + 
				"        WHERE CID=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCpw());
			pstmt.setString(2, dto.getCname());
			pstmt.setString(3, dto.getCtel());
			pstmt.setString(4, dto.getCemail());
			pstmt.setString(5, dto.getCaddress());
			pstmt.setDate(6, dto.getCbirth());
			pstmt.setString(7, dto.getCgender());
			pstmt.setString(8, dto.getCid());
			
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
