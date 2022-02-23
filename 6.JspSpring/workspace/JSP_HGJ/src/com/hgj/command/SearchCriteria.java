package com.hgj.command;

import com.hgj.exception.NotNumberException;

public class SearchCriteria extends Criteria {
	
	private String searchType="";
	private String keyword="";
	// 명시적 초기화를 해주지 않을경우 비었을 때 null이 들어간다.
	
	public SearchCriteria() {}
	
	public SearchCriteria(String pageStr, String perPageNumStr,String searchType, String keyword) throws NotNumberException {
		super(pageStr, perPageNumStr);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
