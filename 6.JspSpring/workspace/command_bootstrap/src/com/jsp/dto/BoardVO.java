package com.jsp.dto;

import java.util.Date;

public class BoardVO {

	private int bno;			// 게시판 번호
	private String title;		// 제목
	private String writer;		// 작성자
	private String content;		// 내용
	private int viewcnt;		// 조회수
	private Date regDate;		// 등록날짜
	private Date updatedate;	// 수정날짜
	
	private int replycnt;		// 댓글 개수 Reply 구현하고나서 Reply DAO에서 땡길꺼임.

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	
}
