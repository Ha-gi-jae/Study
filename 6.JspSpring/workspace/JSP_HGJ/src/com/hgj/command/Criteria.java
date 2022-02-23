package com.hgj.command;

import com.hgj.exception.NotNumberException;

public class Criteria {
	
	private int page = 1;		 //시작페이지
	private int perPageNum = 10; //페이지에 표시할 갯수
	private int startRowNum = 0; // 시작 행 번호
	
	public Criteria() {
		
	}
	public Criteria(int page, int perPageNum) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	public Criteria(String pageStr, String perPageNumStr) throws NotNumberException{
		try {
			this.page = Integer.parseInt(pageStr);
			this.perPageNum = Integer.parseInt(perPageNumStr);
			setStartRowNum();
		}catch (NumberFormatException e) {
			throw new NotNumberException();
		}
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page < 1) {
			this.page = 1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;
	}
	
	
}
