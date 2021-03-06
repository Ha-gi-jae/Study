package kr.or.ddit.board.vo;

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
	
	private String board_title;
	
	private String board_title_id;

	public String getBoard_title_id() {
		return board_title_id;
	}

	public void setBoard_title_id(String board_title_id) {
		this.board_title_id = board_title_id;
	}

	private String board_content;
	
	private String notice_title;
	private String notice_content;
	
	private String group;
	private String msg_from;
	
	private String class_id;
	
	private int rnum;
	
	private String mem_group;
	private String mem_name;
	
	
	public String getMem_group() {
		return mem_group;
	}

	public void setMem_group(String mem_group) {
		this.mem_group = mem_group;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getBoard_title() {
		return board_title;
	}
	
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	public String getBoard_content() {
		return board_content;
	}
	
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	
	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	
	
	public String getMsg_from() {
		return msg_from;
	}

	public void setMsg_from(String msg_from) {
		this.msg_from = msg_from;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
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
