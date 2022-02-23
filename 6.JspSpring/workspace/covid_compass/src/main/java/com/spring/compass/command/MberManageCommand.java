package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class MberManageCommand extends SearchCriteria implements Serializable{
	
	public MberManageCommand() {}
	
	public MberManageCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	public MberManageCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	private String instNo = "";

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
