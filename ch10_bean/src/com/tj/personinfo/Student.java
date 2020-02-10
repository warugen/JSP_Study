package com.tj.personinfo;

public class Student {
	private String 	studentNum;		// 학번
	private String 	name;			// 이름
	private int 	grade;			// 학년
	private char	className;		// 반이름
	private int		score;			// 점수
	
	
	public Student() {}

	public Student(String studentNum, String name, int grade, char className, int score) {
		super();
		this.studentNum = studentNum;
		this.name = name;
		this.grade = grade;
		this.className = className;
		this.score = score;
	}

	public String getStudentNum() {
		return studentNum;
	}

	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public char getClassName() {
		return className;
	}

	public void setClassName(char className) {
		this.className = className;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
	
}
