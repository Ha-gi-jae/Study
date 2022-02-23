package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class SckbdreqListSearchCommand extends InptntListSearchCommand implements Serializable{
	
	public SckbdreqListSearchCommand() {}
	
	public SckbdreqListSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	private String ltctNo = "";

	public String getLtctNo() {
		return ltctNo;
	}

	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
