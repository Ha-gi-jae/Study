package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.slf4j.LoggerFactory;

import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.util.XSSUtil;

import org.slf4j.Logger;

public class PstiVO implements Serializable{
	//import org.slf4j.Logger;
	//import org.slf4j.LoggerFactory;	
	private static final Logger LOGGER = LoggerFactory.getLogger(PstiVO.class);
	
	private String pregnYn = "N";
	private String feverYn = "N";
	private String inspNo;
	private String nlty = "KOR";
	private String chkdYn = "N";
	private String pstiAdres;
	private String rrn;
	private String pstiNm;
	private String jobCode;
	private String symptms;
	private String gender;
	private String pstiTelno;
	private String vacCode;
	private Date wrtYmd = new Date();
	private Date delYmd = new Date(new Date().getTime() + (1000 * 60 * 60 * 24));
	private String pstiNo;
	private String rechkdYn = "N";
	private String manageNo;
	private String areaNo;
	
	
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
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	public String getPregnYn() {
		return pregnYn;
	}
	public void setPregnYn(String pregnYn) {
		this.pregnYn = pregnYn;
	}
	public String getFeverYn() {
		return feverYn;
	}
	public void setFeverYn(String feverYn) {
		this.feverYn = feverYn;
	}
	public String getInspNo() {
		return inspNo;
	}
	public void setInspNo(String inspNo) {
		this.inspNo = inspNo;
	}
	public String getNlty() {
		return nlty;
	}
	public void setNlty(String nlty) {
		this.nlty = XSSUtil.xssProcess(nlty);
	}
	public String getChkdYn() {
		return chkdYn;
	}
	public void setChkdYn(String chkdYn) {
		this.chkdYn = chkdYn;
	}
	public String getPstiAdres() {
		return pstiAdres;
	}
	public void setPstiAdres(String pstiAdres) {
		this.pstiAdres = XSSUtil.xssProcess(pstiAdres);
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getPstiNm() {
		return pstiNm;
	}
	public void setPstiNm(String pstiNm) {
		this.pstiNm = XSSUtil.xssProcess(pstiNm);
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public String getSymptms() {
		return symptms;
	}
	public void setSymptms(String symptms) {
		this.symptms = symptms;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPstiTelno() {
		return pstiTelno;
	}
	public void setPstiTelno(String pstiTelno) {
		this.pstiTelno = pstiTelno;
	}
	public String getVacCode() {
		return vacCode;
	}
	public void setVacCode(String vacCode) {
		this.vacCode = vacCode;
	}
	public Date getWrtYmd() {
		return wrtYmd;
	}
	public void setWrtYmd(Date wrtYmd) {
		this.wrtYmd = wrtYmd;
	}
	public Date getDelYmd() {
		return delYmd;
	}
	public void setDelYmd(Date delYmd) {
		this.delYmd = delYmd;
	}
	public String getPstiNo() {
		return pstiNo;
	}
	public void setPstiNo(String pstiNo) {
		this.pstiNo = pstiNo;
	}
	public String getRechkdYn() {
		return rechkdYn;
	}
	public void setRechkdYn(String rechkdYn) {
		this.rechkdYn = rechkdYn;
	}
	
	
}
