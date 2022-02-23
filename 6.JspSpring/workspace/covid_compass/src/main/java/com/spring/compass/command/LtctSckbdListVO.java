package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class LtctSckbdListVO implements Serializable {

	private String manageNo;
	private String hsptNo;
	private Date sckbdreqYmd;
	private String pstiNm;
	private String gender;
	private String age;
	private String pstiTelno;
	private String hsptNm;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHsptNm() {
		return hsptNm;
	}
	public void setHsptNm(String hsptNm) {
		this.hsptNm = hsptNm;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getHsptNo() {
		return hsptNo;
	}
	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}
	public Date getSckbdreqYmd() {
		return sckbdreqYmd;
	}
	public void setSckbdreqYmd(Date sckbdreqYmd) {
		this.sckbdreqYmd = sckbdreqYmd;
	}
	public String getPstiNm() {
		return pstiNm;
	}
	public void setPstiNm(String pstiNm) {
		this.pstiNm = pstiNm;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPstiTelno() {
		return pstiTelno;
	}
	public void setPstiTelno(String pstiTelno) {
		this.pstiTelno = pstiTelno;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
