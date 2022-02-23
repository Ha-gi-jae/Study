package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class PageMaker implements Serializable{
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

	private int totalCount; // 전체 행의 개수
	private int startPage = 1; // 시작 페이지 번호
	private int endPage = 1; // 마지막 페이지 번호
	private int realEndPage; // 끝 페이지 번호
	private boolean prev; // 이전페이지 버튼 유무
	private boolean next; // 다음페이지 버튼 유무

	private int displayPageNum = 10; // 한 페이지에 보여줄 페이지번호 개수
	
	public void custumSetDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum; 
	}
	
	SearchCriteria cri = new SearchCriteria(); 

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public boolean isPrev() {
		return prev;
	}	
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public SearchCriteria getCri() {
		return cri;
	}

	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}

	// starPage,endPage, prev, next 설정. by totalCount
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) 
							* displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		realEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage >= realEndPage ? false : true;
		
	}
}
