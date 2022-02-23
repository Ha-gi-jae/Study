package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class SmplSearchCommand extends SearchCriteria implements Serializable {
	
	public SmplSearchCommand() {}
	public SmplSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	public SmplSearchCommand(int page, int perPageNum) {
		super(page, perPageNum);
	}
	private String typeCode = "";
	private String pbhtNo = "";
	private String myArea = "";
	private String manageNo = "";
	private String areaNo="";
	private Boolean rmndSckbdCntCheck=false;
	
	
	public Boolean getRmndSckbdCntCheck() {
		return rmndSckbdCntCheck;
	}
	public void setRmndSckbdCntCheck(Boolean rmndSckbdCntCheck) {
		this.rmndSckbdCntCheck = rmndSckbdCntCheck;
	}
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getMyArea() {
		return myArea;
	}
	public void setMyArea(String myArea) {
		this.myArea = myArea;
	}
	public String getPbhtNo() {
		return pbhtNo;
	}
	public void setPbhtNo(String pbhtNo) {
		this.pbhtNo = pbhtNo;
	}
	
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	

}
