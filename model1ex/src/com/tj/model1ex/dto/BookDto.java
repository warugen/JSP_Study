package com.tj.model1ex.dto;
/*
 * 
 * CREATE TABLE BOOK (
    bID         NUMBER(7)       PRIMARY KEY, -- 책ID
    bTITLE      VARCHAR2(30)    NOT NULL,    -- 책제목
    bPRICE      NUMBER(7)       NOT NULL,    -- 책 가격
    bIMAGE1     VARCHAR2(30)    DEFAULT 'NOTHING.JPG'   NOT NULL,  -- 책대표이미지
    bIMAGE2     VARCHAR2(30)    DEFAULT 'noImg.png'   NOT NULL,    -- 책 이미지
    bCONTENT    VARCHAR2(4000), -- 책 설명
    bDISCOUNT   NUMBER(3)       NOT NULL,  -- 할인율
    bRDATE      DATE            DEFAULT SYSDATE -- 책등록일
);
 * */

import java.sql.Date;

public class BookDto {
	private int			bId;
	private String 		bTitle;
	private int 		bPrice;
	private String 		bImage1;
	private String 		bImage2;
	private String		bContent;
	private	int			bDiscount;
	private Date		bRdate;
	
	// 생성자
	public BookDto() {}
	
	public BookDto(int bId, String bTitle, int bPrice, String bImage1, String bImage2, String bContent, int bDiscount,
			Date bRdate) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bPrice = bPrice;
		this.bImage1 = bImage1;
		this.bImage2 = bImage2;
		this.bContent = bContent;
		this.bDiscount = bDiscount;
		this.bRdate = bRdate;
	}
	
	// getter & setter
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public int getbPrice() {
		return bPrice;
	}
	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}
	public String getbImage1() {
		return bImage1;
	}
	public void setbImage1(String bImage1) {
		this.bImage1 = bImage1;
	}
	public String getbImage2() {
		return bImage2;
	}
	public void setbImage2(String bImage2) {
		this.bImage2 = bImage2;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbDiscount() {
		return bDiscount;
	}
	public void setbDiscount(int bDiscount) {
		this.bDiscount = bDiscount;
	}
	public Date getbRdate() {
		return bRdate;
	}
	public void setbRdate(Date bRdate) {
		this.bRdate = bRdate;
	}
	
	@Override
	public String toString() {
		return "BookDto [bId=" + bId + ", bTitle=" + bTitle + ", bPrice=" + bPrice + ", bImage1=" + bImage1
				+ ", bImage2=" + bImage2 + ", bContent=" + bContent + ", bDiscount=" + bDiscount + ", bRdate=" + bRdate
				+ "]";
	}
	
	
	
}
