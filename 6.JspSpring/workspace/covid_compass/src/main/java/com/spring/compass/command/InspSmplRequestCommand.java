package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class InspSmplRequestCommand implements Serializable{

	private String smplNo;
	private String pbhtNo;
	private String instNo;
	private String manageNo;
	private String instNm;
	private String pstiNo;
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
	public String getInstNm() {
		return instNm;
	}
	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}
	public String getPstiNo() {
		return pstiNo;
	}
	public void setPstiNo(String pstiNo) {
		this.pstiNo = pstiNo;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
