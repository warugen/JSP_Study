package com.tj.model1ex.dto;

import java.sql.Date;

public class FileboardDto {
	// fileboar 테이블 + customer의 cName, cEmail 추가
	/*
	fNUM        NUMBER(7)       PRIMARY KEY,
    cID         VARCHAR2(50)    REFERENCES  CUSTOMER(CID),
    fSUBJECT    VARCHAR2(250)   NOT NULL,
    fCONTENT    VARCHAR2(4000),
    fFILENAME   VARCHAR2(50),
    fPW         VARCHAR2(50)    NOT NULL,
    fHIT        NUMBER(7)       DEFAULT 0   NOT NULL,
    fREF        NUMBER(7)       NOT NULL,
    fRE_STEP    NUMBER(7)       NOT NULL,
    fRE_LEVEL   NUMBER(7)       NOT NULL,
    fIP         VARCHAR2(50)    NOT NULL,
    fRDATE      DATE            DEFAULT SYSDATE NOT NULL
	 * */
	private int 	fNum;
	private String 	cId;
	private String 	fSubject;
	private String	fContent;
	private String	fFileName;
	private String	fPw;
	private int		fHit;
	private int		fRef;
	private int		fRe_step;
	private int		fRe_level;
	private String	fIp;
	private Date	fRdate;
	private String	cName;
	private String	cEmail;
	// 생성자
	public FileboardDto() {}
	public FileboardDto(int fNum, String cId, String fSubject, String fContent, String fFileName, String fPw, int fHit,
			int fRef, int fRe_step, int fRe_level, String fIp, Date fRdate, String cName, String cEmail) {
		this.fNum = fNum;
		this.cId = cId;
		this.fSubject = fSubject;
		this.fContent = fContent;
		this.fFileName = fFileName;
		this.fPw = fPw;
		this.fHit = fHit;
		this.fRef = fRef;
		this.fRe_step = fRe_step;
		this.fRe_level = fRe_level;
		this.fIp = fIp;
		this.fRdate = fRdate;
		this.cName = cName;
		this.cEmail = cEmail;
	}
	
	// getter & setter
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getfSubject() {
		return fSubject;
	}
	public void setfSubject(String fSubject) {
		this.fSubject = fSubject;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public String getfFileName() {
		return fFileName;
	}
	public void setfFileName(String fFileName) {
		this.fFileName = fFileName;
	}
	public String getfPw() {
		return fPw;
	}
	public void setfPw(String fPw) {
		this.fPw = fPw;
	}
	public int getfHit() {
		return fHit;
	}
	public void setfHit(int fHit) {
		this.fHit = fHit;
	}
	public int getfRef() {
		return fRef;
	}
	public void setfRef(int fRef) {
		this.fRef = fRef;
	}
	public int getfRe_step() {
		return fRe_step;
	}
	public void setfRe_step(int fRe_step) {
		this.fRe_step = fRe_step;
	}
	public int getfRe_level() {
		return fRe_level;
	}
	public void setfRe_level(int fRe_level) {
		this.fRe_level = fRe_level;
	}
	public String getfIp() {
		return fIp;
	}
	public void setfIp(String fIp) {
		this.fIp = fIp;
	}
	public Date getfRdate() {
		return fRdate;
	}
	public void setfRdate(Date fRdate) {
		this.fRdate = fRdate;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcEmail() {
		return cEmail;
	}
	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}
	
	@Override
	public String toString() {
		return "FileboardDto [fNum=" + fNum + ", cId=" + cId + ", fSubject=" + fSubject + ", fContent=" + fContent
				+ ", fFileName=" + fFileName + ", fPw=" + fPw + ", fHit=" + fHit + ", fRef=" + fRef + ", fRe_step="
				+ fRe_step + ", fRe_level=" + fRe_level + ", fIp=" + fIp + ", fRdate=" + fRdate + ", cName=" + cName
				+ ", cEmail=" + cEmail + "]";
	}
	
	
}
