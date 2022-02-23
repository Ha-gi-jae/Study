package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class InptntstatsVO implements Serializable{

	private String hsptNo;
	private String hsptlzCode;
	private String manageNo;
	private String inptntNo;
	private String outYmd;
	private String inYmd;
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
	public String getOutYmd() {
		return outYmd;
	}
	public void setOutYmd(String outYmd) {
		this.outYmd = outYmd;
	}
	public String getInYmd() {
		return inYmd;
	}
	public void setInYmd(String inYmd) {
		this.inYmd = inYmd;
	}
	
	

}
