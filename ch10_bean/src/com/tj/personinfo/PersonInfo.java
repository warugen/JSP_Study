package com.tj.personinfo;


public class PersonInfo {
	private String name;
	private int	age;
	private char gender;
	private String address;
	
	public PersonInfo() {
		// 반드시 매개변수없는 생성자는 있어야한다.
	}

	public PersonInfo(String name, int age, char gender, String address) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
