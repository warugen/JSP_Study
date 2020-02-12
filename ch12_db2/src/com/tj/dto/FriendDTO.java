package com.tj.dto;

public class FriendDTO {
	private int 	sno;
	private String 	name;
	private String 	tel;
	
	public FriendDTO() {}
	
	public FriendDTO(int sno, String name, String tel) {
		super();
		this.sno = sno;
		this.name = name;
		this.tel = tel;
	}
	
	// getter, setter
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	@Override
	public String toString() {
		return "FriendDTO [sno=" + sno + ", name=" + name + ", tel=" + tel + "]";
	}
}
