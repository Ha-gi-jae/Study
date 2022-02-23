package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class LtctIsoptntHighTempCardListVO implements Serializable{

	private double bdtemp;
    private String pstiNm;
    private String pstiTelno;
    private String symptms;
    private Date inYmd;
    private String manageNo;
    private int today;
    
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public double getBdtemp() {
		return bdtemp;
	}
	public void setBdtemp(double bdtemp) {
		this.bdtemp = bdtemp;
	}
	public String getPstiNm() {
		return pstiNm;
	}
	public void setPstiNm(String pstiNm) {
		this.pstiNm = pstiNm;
	}
	public String getPstiTelno() {
		return pstiTelno;
	}
	public void setPstiTelno(String pstiTelno) {
		this.pstiTelno = pstiTelno;
	}
	public String getSymptms() {
		return symptms;
	}
	public void setSymptms(String symptms) {
		this.symptms = symptms;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
