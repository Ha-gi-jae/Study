package com.jsp.command;

public class SummernoteDeleteImgCommand {
	
	private String fileName;
	// Object 객체도 get set을 씀.
	// class.forName을 쓰게된다. 
	// ㄴ> reflection.
	// constructor 호출 하려함.
	// 고로 class = new instance를 쓰게된다 // new instance - 기본 생성자.
	// 오버로딩한 생성자 쓰고싶으면 new instance 쓰지말고 만들고  setmethod 써야함..
	// class.forName을 쓰면 클래스 타입을 알게되고 그 타입을 이용해 instance를 뽑아내는것.
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
