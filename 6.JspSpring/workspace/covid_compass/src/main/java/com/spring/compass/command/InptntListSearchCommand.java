package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class InptntListSearchCommand 
				extends SearchCriteria 
				implements Serializable{
	
	private String typeCode = "";
	private String hsptNo = "";
	private String searchCode = "";
	
	

	public InptntListSearchCommand() {}
	
	public InptntListSearchCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	public InptntListSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
		
	}
	
	public String getSearchCode() {
		return searchCode;
	}
	
	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}
	
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}


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
