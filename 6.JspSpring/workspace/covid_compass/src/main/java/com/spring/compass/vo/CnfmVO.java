package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class CnfmVO implements Serializable{

	private String ngtvCnt;
	private String pbhtNo;
	private String cnfmNo;
	private String manageNo;
	private String outYmd;
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	private Date inYmd = new Date();
	public String getNgtvCnt() {
		return ngtvCnt;
	}
	public void setNgtvCnt(String ngtvCnt) {
		this.ngtvCnt = ngtvCnt;
	}
	public String getPbhtNo() {
		return pbhtNo;
	}
	public void setPbhtNo(String pbhtNo) {
		this.pbhtNo = pbhtNo;
	}
	public String getCnfmNo() {
		return cnfmNo;
	}
	public void setCnfmNo(String cnfmNo) {
		this.cnfmNo = cnfmNo;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getOutYmd() {
		return outYmd;
	}
	public void setOutYmd(String outYmd) {
		this.outYmd = outYmd;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}

}
