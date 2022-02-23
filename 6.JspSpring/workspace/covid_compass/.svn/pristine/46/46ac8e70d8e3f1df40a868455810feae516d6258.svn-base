package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class InstSearchCommand extends SearchCriteria implements Serializable{

	private String hsptNo;
	private String areaNo;
	
	private String myArea;
	
	private boolean rmndSckbdCntCheck = false;
	
	public boolean isRmndSckbdCntCheck() {
		return rmndSckbdCntCheck;
	}

	public void setRmndSckbdCntCheck(boolean rmndSckbdCntCheck) {
		this.rmndSckbdCntCheck = rmndSckbdCntCheck;
	}

	public String getMyArea() {
		return myArea;
	}

	public void setMyArea(String instAdres) {
		this.myArea = instAdres.substring(0,2);
	}

	public String getHsptNo() {
		return hsptNo;
	}

	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public InstSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}	
	
}
