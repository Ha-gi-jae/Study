package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class InspPstiSearchCommand extends SearchCriteria implements Serializable{

	public InspPstiSearchCommand() {}
	
	public InspPstiSearchCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	public InspPstiSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	private String inspNo = "";
	
	public String getInspNo() {
		return inspNo;
	}
	
	public void setInspNo(String inspNo) {
		this.inspNo = inspNo;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
