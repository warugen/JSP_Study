package com.tj.member;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDTO {
	private String 		id;
	private String 		pw;
	private String 		name;
	private String 		email;
	private Timestamp 	birth;
	private Date 		rdate;
	private String		address;
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String pw, String name, String email, Timestamp birth, Date rdate, String address) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.rdate = rdate;
		this.address = address;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", birth=" + birth
				+ ", rdate=" + rdate + ", address=" + address + "]";
	}
	
}
