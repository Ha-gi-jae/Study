package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class DgnssListSearchCommand 
	extends SearchCriteria
	implements Serializable{
	
	public DgnssListSearchCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	public DgnssListSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	private String hsptNo;


	public String getHsptNo() {
		return hsptNo;
	}


	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	
	
}
