package com.jsp.command;

import java.util.Date;

import com.jsp.dto.BoardVO;

public class BoardModifyCommand {
	
	private String bno;
	private String title;
	private String content;
	
	private String writer;
	
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public BoardVO toBoardVO() {
		BoardVO board = new BoardVO();
		
		board.setBno(Integer.parseInt(this.bno));
		board.setTitle(this.title); // this 안적고 그냥 title 적어도된다. 명시적으로 하려고 this. 써준거임 ㅎㅎ.
		board.setContent(this.content);
		board.setUpdatedate(new Date());
		board.setWriter(writer);
		
		return board;
	}
}
