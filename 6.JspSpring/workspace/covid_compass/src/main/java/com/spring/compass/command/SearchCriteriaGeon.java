package com.spring.compass.command;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SearchCriteriaGeon extends SearchCriteria implements Serializable{
	
	private String searchType2 ="";
	
	public String getSearchType2() {
		return searchType2;
	}



	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}



	public SearchCriteriaGeon(int page, int perPageNum, String searchType, String searchType2, String keyword) {
		setPage(page);
		setPerPageNum(perPageNum);
		setSearchType(searchType);
		setSearchType2(searchType2);
		setKeyword(keyword);
		
		calcData();
		
	}
}
