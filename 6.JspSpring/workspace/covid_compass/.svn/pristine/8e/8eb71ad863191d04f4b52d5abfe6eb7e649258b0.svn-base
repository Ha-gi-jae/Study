package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class SearchCriteria implements Serializable{
	
	private String searchType = "";
	private String keyword = "";
	private String instNo;
	private int page = 1;
	private int startRowNum = 0;
	private int perPageNum = 15;
	
	private int endRowNum = 0;
	
	public SearchCriteria() {}
	
	public SearchCriteria(int page, int perPageNum) {
		setPage(page);
		setPerPageNum(perPageNum);
		
		calcData();
	}
	
	public SearchCriteria(int page, int perPageNum, String searchType, String keyword) {
		setPage(page);
		setPerPageNum(perPageNum);
		setSearchType(searchType);
		setKeyword(keyword);
		
		calcData();
	}
	
	public void calcData() {
		setStartRowNum((page - 1) * perPageNum + 1);
		setEndRowNum(page * perPageNum);
		
	}
	
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum > 0 ? endRowNum : 0;
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page > 0 ? page : 1;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum > 0 ? startRowNum : 0;
	}
	
	public int getEndRowNum() {
		return endRowNum;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum > 0 ? perPageNum : 1;
	}
	
	
	public String getInstNo() {
		return instNo;
	}

	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
			
}
