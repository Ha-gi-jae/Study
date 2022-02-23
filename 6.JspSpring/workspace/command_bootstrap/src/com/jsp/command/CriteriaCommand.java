package com.jsp.command;

public class CriteriaCommand {
	// 파라미터 타입을 무조건 받을 수 있게 String!
	private String page;
	private String perPageNum;
	private String searchType;
	private String keyword;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
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
	
//	command 사용자의 요구를 받아주는 객체
	
//	dto 데이터 스키마 VO  - 1개임 
//	Db기준 command 화면 기준 VO. - 여러개가 올 수 있음. 
	
	public SearchCriteria toSearchCriteria() {
		SearchCriteria cri = new SearchCriteria();
		if(page !=null && !page.isEmpty()) {
			cri.setPage(Integer.parseInt(page));
		}
		if(perPageNum != null && !perPageNum.isEmpty()) {
			cri.setPerPageNum(Integer.parseInt(perPageNum));
		}
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);
		
		return cri;
	}
	
}
