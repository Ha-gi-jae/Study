package kr.or.ddit.member.vo;

public class PagingVO {

	private int pageCount = 10; // 페이지 목록 게시되는 페이지 수 (초기값: 10)
	private int countPerPage = 10; // 한 페이지당 게시되는 게시물 건 수(초기값: 10)
	private int currentPageNo; // 현재 페이지 번호
	private int totalCount; // 전체 게시물 건 수

	private int totalPageCount; // 전체 페이지 수
	private int firstPageNo; // 현재 페이지 목록의 첫 페이지 번호
	private int lastPageNo; // 현재 페이지 목록의 마지막 페이지 번호
	private int firstRecNo; // 첫번째 레코드 번호
	private int lastRecNo; // 마지막 레코드 번호
	
	private String searchType;
	private String keyWord;
	
	

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	private int rnum;
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPageSize() {
		return pageCount;
	}

	public void setPageSize(int pageSize) {
		this.pageCount = pageSize;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	// 전체 페이지 수
	public int getTotalPageCount() {
		totalPageCount = ((getTotalCount() - 1) / getCountPerPage()) + 1;
		return totalPageCount;
	}

	// 시작페이지 번호
	public int getFirstPageNo() {
		firstPageNo = ((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
		return firstPageNo;
	}

	// 마지막 페이지 번호
	public int getLastPageNo() {
		lastPageNo = getFirstPageNo() + getPageSize() - 1;
		if (lastPageNo > getTotalPageCount()) {
			lastPageNo = getTotalPageCount();
		}
		return lastPageNo;
	}

	// 첫번째 레코드 번호
	public int getFirstRecNo() {
		firstRecNo = totalCount - (getCurrentPageNo() - 1) * getCountPerPage() - getCountPerPage() + 1;
		if(firstRecNo <= 0)
			firstRecNo = 1;
		return firstRecNo;
	}

	// 마지막 레코드 번호
	public int getLastRecNo() {
		lastRecNo = totalCount - (getCurrentPageNo() - 1) * getCountPerPage();
		return lastRecNo;
	}
}
