package com.tj.book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BookDao {
	public static final int SUCCESS = 1;
	public static final int FAIL 	= 0;
	
	private static BookDao instance;
	public static BookDao getInstance() {
		if(instance == null) {
			instance = new BookDao();
		}
		return instance;
	}
	private BookDao() {	}
	
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
	
	// 책등록
	public int insertBook(BookDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOOK (bID, bTITLE, bPRICE, bIMAGE1, bIMAGE2, bCONTENT, bDISCOUNT) " + 
				"    VALUES (BOOK_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getbTitle());
			pstmt.setInt(2, dto.getbPrice());
			pstmt.setString(3, dto.getbImage1());
			pstmt.setString(4, dto.getbImage2());
			pstmt.setString(5, dto.getbContent());
			pstmt.setInt(6, dto.getbDiscount());
			
			result = pstmt.executeUpdate();
			
			if(result == SUCCESS) {
				System.out.println("책 등록 성공");
			} else {
				System.out.println("책 등록 실패 \n" + dto.toString());
			}
			
		} catch (SQLException e) {
			System.out.println("책 등록 실패 : "+e.getMessage() + dto.toString());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	
	// 책목록(전체 목록)
	public ArrayList<BookDto> listBook(){
		ArrayList<BookDto> books = new ArrayList<BookDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM BOOK ORDER BY bRDATE DESC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int			bId 		= rs.getInt("bId");
				String 		bTitle 		= rs.getString("bTitle");
				int 		bPrice 		= rs.getInt("bPrice");
				String 		bImage1 	= rs.getString("bImage1");
				String 		bImage2 	= rs.getString("bImage2");
				String		bContent 	= rs.getString("bContent");
				int			bDiscount 	= rs.getInt("bDiscount");
				Date		bRdate 		= rs.getDate("bRdate");
				
				books.add(new BookDto(bId, bTitle, bPrice, bImage1, bImage2, bContent, bDiscount, bRdate));
			}

		} catch (SQLException e) {
			System.out.println("책 목록가져오기 실패 : "+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return books;
	}
	
	// 책목록(페이징 : startRowk endRow)
	public ArrayList<BookDto> listBook(int startRow, int endRow){
		ArrayList<BookDto> books = new ArrayList<BookDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM(SELECT * FROM BOOK ORDER BY bRDATE DESC) A) " + 
				"    WHERE RN BETWEEN ? AND ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int			bId 		= rs.getInt("bId");
				String 		bTitle 		= rs.getString("bTitle");
				int 		bPrice 		= rs.getInt("bPrice");
				String 		bImage1 	= rs.getString("bImage1");
				String 		bImage2 	= rs.getString("bImage2");
				String		bContent 	= rs.getString("bContent");
				int			bDiscount 	= rs.getInt("bDiscount");
				Date		bRdate 		= rs.getDate("bRdate");
				
				books.add(new BookDto(bId, bTitle, bPrice, bImage1, bImage2, bContent, bDiscount, bRdate));
			}

		} catch (SQLException e) {
			System.out.println("책 목록가져오기 실패 : " + e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return books;
	}
	
	// 전체 등록된 책 갯수
	public int getBookTotCnt() {
		int bookTotCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) totCnt FROM BOOK";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bookTotCnt = rs.getInt("totCnt");
			}

		} catch (SQLException e) {
			System.out.println("책 전체 목록가져오기 실패 : " + e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return bookTotCnt;
	}
	
	// 책상세보기
	public BookDto getBook(int bId) {
		BookDto book = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM BOOK WHERE bID = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String 		bTitle 		= rs.getString("bTitle");
				int 		bPrice 		= rs.getInt("bPrice");
				String 		bImage1 	= rs.getString("bImage1");
				String 		bImage2 	= rs.getString("bImage2");
				String		bContent 	= rs.getString("bContent");
				int			bDiscount 	= rs.getInt("bDiscount");
				Date		bRdate 		= rs.getDate("bRdate");
				
				book = new BookDto(bId, bTitle, bPrice, bImage1, bImage2, bContent, bDiscount, bRdate);
			}

		} catch (SQLException e) {
			System.out.println("책 상세보기 실패 : " + e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		return book;
	}
	
	public BookDto getBook(String bId) {
		return getBook(Integer.parseInt(bId));
	}
}
