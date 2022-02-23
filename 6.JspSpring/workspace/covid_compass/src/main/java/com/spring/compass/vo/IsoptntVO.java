package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class IsoptntVO implements Serializable{

	private String hsptlzCode;
	private String manageNo;
	private String isoptntNo;
	private Date outYmd;
	private String ltctNo;
	private Date inYmd = new Date();
	private double bdtemp;
	
	public double getBdtemp() {
		return bdtemp;
	}
	public void setBdtemp(double bdtemp) {
		this.bdtemp = bdtemp;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	public String getHsptlzCode() {
		return hsptlzCode;
	}
	public void setHsptlzCode(String hsptlzCode) {
		this.hsptlzCode = hsptlzCode;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getIsoptntNo() {
		return isoptntNo;
	}
	public void setIsoptntNo(String isoptntNo) {
		this.isoptntNo = isoptntNo;
	}
	public Date getOutYmd() {
		return outYmd;
	}
	public void setOutYmd(Date outYmd) {
		this.outYmd = outYmd;
	}
	public String getLtctNo() {
		return ltctNo;
	}
	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}

}
