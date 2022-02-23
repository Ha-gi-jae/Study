package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class LtctSearchCommand extends SearchCriteria implements Serializable{
	
	public LtctSearchCommand() {}
	
	public LtctSearchCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	public LtctSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	private String ltctNo = "";
	private String typeCode = "";
	private String myArea = "";
	private String manageNo = "";
	private String areaNo = "";
	private Boolean rmndSckbdCntCheck = false;
	
	
	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public Boolean getRmndSckbdCntCheck() {
		return rmndSckbdCntCheck;
	}

	public void setRmndSckbdCntCheck(Boolean rmndSckbdCntCheck) {
		this.rmndSckbdCntCheck = rmndSckbdCntCheck;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getMyArea() {
		return myArea;
	}

	public void setMyArea(String myArea) {
		this.myArea = myArea.substring(0,2);
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

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