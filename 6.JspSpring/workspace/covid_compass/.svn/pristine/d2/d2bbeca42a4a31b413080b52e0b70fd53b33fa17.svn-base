package com.spring.compass.command;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;

public class CnfrmDgnssWaitDetailVO {

	private String pstiNm;
	private String nlty;
	private String rechkdYn;
	private String vacCode;
	private String gender;
	private String age;
	private String feverYn;
	private String pregnYn;
	private Date inYmd;
	private String pstvYn;
	private String cnfmNo;
	private String rrn;
	private String pstiAdres;
	private String pstiTelno;
	private String symptms;
	private String sttusCode;
	private String manageNo;
	private String bir;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	public String getBir() {
		return bir;
	}

	public void setBir(String bir) {
		this.bir = bir;
	}

	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getPstiNm() {
		return pstiNm;
	}
	public void setPstiNm(String pstiNm) {
		this.pstiNm = pstiNm;
	}
	public String getNlty() {
		return nlty;
	}
	public void setNlty(String nlty) {
		this.nlty = nlty;
	}
	public String getRechkdYn() {
		return rechkdYn;
	}
	public void setRechkdYn(String rechkdYn) {
		this.rechkdYn = rechkdYn.equals("N") ? "본인판단" : "자가격리";
	}
	public String getVacCode() {
		return vacCode;
	}
	public void setVacCode(String vacCode) {
		this.vacCode = CommonCodeUtil.getCodeName(vacCode);
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		
		
		this.gender = gender.equals("M") ? "남" : "여" ;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getFeverYn() {
		return feverYn;
	}
	public void setFeverYn(String feverYn) {
		this.feverYn = feverYn;
	}
	public String getPregnYn() {
		return pregnYn;
	}
	public void setPregnYn(String pregnYn) {
		this.pregnYn = pregnYn;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}
	public String getPstvYn() {
		return pstvYn;
	}
	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn.equals("Y") ? "양성" : "음성";
	}
	public String getCnfmNo() {
		return cnfmNo;
	}
	public void setCnfmNo(String cnfmNo) {
		this.cnfmNo = cnfmNo;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getPstiAdres() {
		return pstiAdres;
	}
	public void setPstiAdres(String pstiAdres) {
		this.pstiAdres = pstiAdres;
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
	public String getSttusCode() {
		return sttusCode;
	}
	public void setSttusCode(String sttusCode) {
		this.sttusCode = CommonCodeUtil.getCodeName(sttusCode + "_NM2");;
	}
	
	
}
