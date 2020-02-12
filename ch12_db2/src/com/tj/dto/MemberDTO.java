package com.tj.dto;

public class MemberDTO {
	private String 	id;			// 아이디
	private String 	name;		// 이름
	private String 	pw;			// 패스워드
	private String 	phone1;		// 국번
	private String 	phone2;		// 중간번호
	private String 	phone3;		// 끝번호
	private String	gender;		// 성별

	// 매개변수 없는 생성자
	public MemberDTO() {}
	// 매개변수 있는 생성자
	public MemberDTO(String id, String name, String pw, String phone1, String phone2, String phone3, String gender) {
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.gender = gender;
	}
	
	// getter, setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	// toString
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", name=" + name + ", pw=" + pw + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", gender=" + gender + "]";
	}
}
