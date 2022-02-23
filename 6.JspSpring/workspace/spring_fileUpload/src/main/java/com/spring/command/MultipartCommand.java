package com.spring.command;

import org.springframework.web.multipart.MultipartFile;

public class MultipartCommand {

	private String title;
	private MultipartFile file;
	// Command에서는 String, MultipartFile 만 쓰고.
	// controller에서 String 으로 받고 Integer.parseInt 하는게 좋음.
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
