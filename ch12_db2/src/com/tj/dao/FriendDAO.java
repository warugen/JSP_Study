package com.tj.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tj.dto.FriendDTO;

public class FriendDAO {
	
	// jdbc 드라이버 설정
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "scott";
	private String upw = "tiger";
	
	// instance객체 생성
	private static FriendDAO instance;
	// getInstance 생성
	public static FriendDAO getInstance() {
		if(instance == null) {
			instance = new FriendDAO();
		}
		return instance;
	}
	
	private FriendDAO() {
		try {
			Class.forName(driver);	// 1단계 실행
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}

	// 친구 리스트 가져오는 메소드
	public ArrayList<FriendDTO> selectAll() {
		ArrayList<FriendDTO> dtos = new ArrayList<FriendDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM FRIEND";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				// 검색결과 dto ArrayList객체에 담아주기
				int sno = rs.getInt("sno");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				
				dtos.add(new FriendDTO(sno, name, tel));
			}
		} catch (SQLException e) {
			System.out.println("친구 검색 실패 : "+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return dtos;
	}
	
	// 친구 등록하기 메소드
	public int insertFriend(FriendDTO dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FRIEND VALUES (FRIEND_SEQ.nextval, ?, ?)";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel());
			
			result = pstmt.executeUpdate();
			System.out.println(result>0? " 친구등록성공":dto.toString()+" 친구등록실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(dto.toString()+" 친구등록실패");
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
	
	// 이름과 전화번호로 검색하는 메소드
	public ArrayList<FriendDTO> searchNameTel(String name, String tel) {
		ArrayList<FriendDTO> dtos = new ArrayList<FriendDTO>();
		System.out.println("이름과 전화번호로 검색");
		
		Connection conn = null;
		PreparedStatement  pstmt = null;
		ResultSet  rs   = null;
		String sql = "SELECT * FROM FRIEND WHERE NAME LIKE '%'||?||'%' AND TEL LIKE '%'||?||'%'";
		
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				FriendDTO dto = new FriendDTO();
				dto.setSno(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dtos.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) { }
		}
		return dtos;
	}
}















