package com.tj.model1ex.dao;

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

import com.tj.model1ex.dto.FileboardDto;

public class FileboardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL 	= 0;
	
	private static FileboardDao instance = new FileboardDao();
	
	public static FileboardDao getInstance() {
		return instance;
	}
	
	private FileboardDao() {}
	
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
	
	// 글 목록 가져오기
	public ArrayList<FileboardDto> listFileboard(int startRow, int endRow) {
		ArrayList<FileboardDto> dtos = new ArrayList<FileboardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM " + 
				"                (SELECT F.*, C.CNAME, C.CEMAIL FROM FILEBOARD F, CUSTOMER C " + 
				"                    WHERE F.CID=C.CID ORDER BY fREF DESC, fRE_STEP) A) " + 
				"        WHERE RN BETWEEN ? AND ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int 	fNum		= rs.getInt("fNum");
				String 	cId			= rs.getString("cId");
				String 	fSubject	= rs.getString("fSubject");
				String	fContent	= rs.getString("fContent");
				String	fFileName	= rs.getString("fFileName");
				String	fPw			= rs.getString("fPw");
				int		fHit		= rs.getInt("fHit");
				int		fRef		= rs.getInt("fRef");
				int		fRe_step	= rs.getInt("fRe_step");
				int		fRe_level	= rs.getInt("fRe_level");
				String	fIp			= rs.getString("fIp");
				Date	fRdate		= rs.getDate("fRdate");
				String	cName		= rs.getString("cName");
				String	cEmail		= rs.getString("cEmail");
				
				dtos.add(new FileboardDto(fNum, cId, fSubject, fContent, fFileName, fPw, fHit, fRef, fRe_step, fRe_level, fIp, fRdate, cName, cEmail));
			}
		} catch (SQLException e) {
			System.out.println("글 목록 가져오기 실패"+e.getMessage());
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		
		return dtos;
	}
	// 등록된 글 갯수 가져오기
	public int getBoardTotCnt() {
		int totCnt = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) FROM FILEBOARD";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("글 갯수 가져오기 실패"+e.getMessage());
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		
		return totCnt;
	}
	
	// 원글쓰기
	public int insertFileBoard(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP) " + 
				"        VALUES (FILEBOARD_SEQ.nextval, ?, ?, ?, " + 
				"                ?, ?, FILEBOARD_SEQ.CURRVAL, 0, 0, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getcId());
			pstmt.setString(2, dto.getfSubject());
			pstmt.setString(3, dto.getfContent());
			pstmt.setString(4, dto.getfFileName());
			pstmt.setString(5, dto.getfPw());
			pstmt.setString(6, dto.getfIp());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result == SUCCESS ? "글쓰기 성공" : "글쓰기 실패" + dto.toString());

		} catch (SQLException e) {
			System.out.println("insertFileBoard 글쓰기 실패"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		
		return result;
	}
	
	// 답변글 쓰기 1단계
	private void preReplyStepA(int fref, int fre_step) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE FILEBOARD SET fRE_STEP = fRE_STEP + 1 WHERE fREF = ? AND fRE_STEP > ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fref);
			pstmt.setInt(2, fre_step);
			int result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "답변글 1단계 성공" : "답변글이 처음이네" );
		} catch (SQLException e) {
			System.out.println("preReplyStepA 실패 \n"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
	}
	
	// 답변글 쓰기 2단계
	public int reply(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 1단계 수행
		preReplyStepA(dto.getfRef(), dto.getfRe_step());
		
		String sql = "INSERT INTO FILEBOARD (fNUM, cID, fSUBJECT, fCONTENT, fFILENAME, fPW, fREF, fRE_STEP, fRE_LEVEL, fIP) " + 
				"    VALUES (FILEBOARD_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getcId());
			pstmt.setString(2, dto.getfSubject());
			pstmt.setString(3, dto.getfContent());
			pstmt.setString(4, dto.getfFileName());
			pstmt.setString(5, dto.getfPw());
			pstmt.setInt(6, dto.getfRef());
			pstmt.setInt(7, dto.getfRe_step() +1);
			pstmt.setInt(8, dto.getfRe_level() +1);
			pstmt.setString(9, dto.getfIp());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result == SUCCESS ? "답변글 쓰기 성공" : "답변글 쓰기 실패" + dto.toString());

		} catch (SQLException e) {
			System.out.println("reply 실패 \n"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		
		return result;
	}
	
	// 글 상세보기 (글번호로 dto가져오기)
	public FileboardDto getFileBoard(int fNum) {
		FileboardDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT F.*, CNAME, CEMAIL FROM FILEBOARD F, CUSTOMER C " + 
				"    WHERE F.CID = C.CID AND fNUM = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String 	cId			= rs.getString("cId");
				String 	fSubject	= rs.getString("fSubject");
				String	fContent	= rs.getString("fContent");
				String	fFileName	= rs.getString("fFileName");
				String	fPw			= rs.getString("fPw");
				int		fHit		= rs.getInt("fHit");
				int		fRef		= rs.getInt("fRef");
				int		fRe_step	= rs.getInt("fRe_step");
				int		fRe_level	= rs.getInt("fRe_level");
				String	fIp			= rs.getString("fIp");
				Date	fRdate		= rs.getDate("fRdate");
				String	cName		= rs.getString("cName");
				String	cEmail		= rs.getString("cEmail");
				
				dto = new FileboardDto(fNum, cId, fSubject, fContent, fFileName, fPw, fHit, fRef, fRe_step, fRe_level, fIp, fRdate, cName, cEmail);
			}
		} catch (SQLException e) {
			System.out.println("글 상세보기 실패"+e.getMessage());
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		
		return dto;
	}
	
	public FileboardDto getFileBoard(String fNum) {	
		return getFileBoard(Integer.parseInt(fNum));
	}
	
	// 조회수 올리기
	public void hitUp(int fNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE FILEBOARD SET fHIT = fHIT + 1 WHERE fNUM = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fNum);
			int result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "조회수 올리기 성공" : "조회수 올리기 실패" );
		} catch (SQLException e) {
			System.out.println("조회수 올리기 실패 \n"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
	}
	
	// 글 수정하기
	public int updateFileBoard(FileboardDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE FILEBOARD SET fSUBJECT = ?, fCONTENT = ?, fFILENAME = ?, fPW = ?, fIP = ? " + 
				"    WHERE fNUM = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getfSubject());
			pstmt.setString(2, dto.getfContent());
			pstmt.setString(3, dto.getfFileName());
			pstmt.setString(4, dto.getfPw());
			pstmt.setString(5, dto.getfIp());
			pstmt.setInt(6, dto.getfNum());
			
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글 수정 성공" : "글 수정 실패" + dto.toString());
		} catch (SQLException e) {
			System.out.println("글 수정 실패 \n"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		return result;
	}
	
	// 글 삭제하기
	public int deleteFileboard(int fNum, String fPw) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM FILEBOARD WHERE fNUM = ? AND fPW = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fNum);
			pstmt.setString(2, fPw);	
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "글 삭제 성공" : "글 삭제 실패 fNum : " + fNum + " fPw : " + fPw );
		} catch (SQLException e) {
			System.out.println("글 삭제 실패 \n"+e.getMessage());
		} finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e2) { }
		}
		return result;
	}
}
