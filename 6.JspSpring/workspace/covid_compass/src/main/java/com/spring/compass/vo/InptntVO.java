package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class InptntVO implements Serializable{

	private String hsptNo;
	private String hsptlzCode;
	private String manageNo;
	private String inptntNo;
	private Date outYmd;
	private Date inYmd = new Date();
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	public String getHsptNo() {
		return hsptNo;
	}
	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
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
	public String getInptntNo() {
		return inptntNo;
	}
	public void setInptntNo(String inptntNo) {
		this.inptntNo = inptntNo;
	}
	public Date getOutYmd() {
		return outYmd;
	}
	public void setOutYmd(Date outYmd) {
		this.outYmd = outYmd;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}
	

}
