package com.tj.ex.dto;

import java.sql.Timestamp;

public class BoardDto {
	/*
	 * bID         NUMBER(6)       PRIMARY KEY,
    bNAME       VARCHAR2(50)    NOT NULL,
    bTITLE      VARCHAR2(100)   NOT NULL,
    bCONTENT    VARCHAR2(1000) ,
    bDATE       DATE            DEFAULT SYSDATE NOT NULL,
    bHIT        NUMBER(6)       DEFAULT 0 NOT NULL,
    bGROUP      NUMBER(6)       NOT NULL,
    bSTEP       NUMBER(3)       NOT NULL,
    bINDENT     NUMBER(3)       NOT NULL,
    bIP         VARCHAR2(20)    NOT NULL
	 * */
	
	private int bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String bip;
	
	public BoardDto() {}
	public BoardDto(int bid, String bname, String btitle, String bcontent, Timestamp bdate, int bhit, int bgroup,
			int bstep, int bindent, String bip) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bip = bip;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Timestamp getBdate() {
		return bdate;
	}
	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public String getBip() {
		return bip;
	}
	public void setBip(String bip) {
		this.bip = bip;
	}
	
	@Override
	public String toString() {
		return "BoardDto [bid=" + bid + ", bname=" + bname + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bdate=" + bdate + ", bhit=" + bhit + ", bgroup=" + bgroup + ", bstep=" + bstep + ", bindent="
				+ bindent + ", bip=" + bip + "]";
	}
}
