package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class LtctRequestSmplVO implements Serializable {

	private String smplNo;
	private String pbhtNo;
	private String instNo;
	private String manageNo;
	public String getSmplNo() {
		return smplNo;
	}
	public void setSmplNo(String smplNo) {
		this.smplNo = smplNo;
	}
	public String getPbhtNo() {
		return pbhtNo;
	}
	public void setPbhtNo(String pbhtNo) {
		this.pbhtNo = pbhtNo;
	}
	public String getInstNo() {
		return instNo;
	}
	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
}
