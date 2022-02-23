package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.vo.PstiVO;

public class VPstiCommand implements Serializable{

	private String pregnYn;
	private String feverYn;
	private String inspNo;
	private String nlty;
	private String manageNo;
	private String chkdYn;
	private String bir;
	private String pstiAdres;
	private String rrn;
	private String pstiNm;
	private String jobCode;
	private String symptms;
	private String gender;
	private String pstiTelno;
	private String vacCode;
	private Date wrtYmd;
	private Date delYmd;
	private String pstiNo;
	private String rechkdYn;
	private String age;
	private String areaNo;
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
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
		this.nlty = nlty;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getChkdYn() {
		return chkdYn;
	}
	public void setChkdYn(String chkdYn) {
		this.chkdYn = chkdYn;
	}
	public String getBir() {
		return bir;
	}
	public void setBir(String bir) {
		this.bir = bir;
	}
	public String getPstiAdres() {
		return pstiAdres;
	}
	public void setPstiAdres(String pstiAdres) {
		this.pstiAdres = pstiAdres;
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
		this.pstiNm = pstiNm;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	public PstiVO toPsti() {
		PstiVO psti = new PstiVO();
		
		psti.setAreaNo(this.areaNo);
		psti.setChkdYn(this.chkdYn);
		psti.setDelYmd(this.delYmd);
		psti.setFeverYn(this.feverYn);
		psti.setGender(this.gender);
		psti.setInspNo(this.inspNo);
		psti.setJobCode(this.jobCode);
		psti.setManageNo(this.manageNo);
		psti.setNlty(this.nlty);
		psti.setPregnYn(this.pregnYn);
		psti.setPstiAdres(this.pstiAdres);
		psti.setPstiNm(this.pstiNm);
		psti.setPstiNo(this.pstiNo);
		psti.setPstiTelno(this.pstiTelno);
		psti.setRechkdYn(this.rechkdYn);
		psti.setRrn(this.rrn);
		psti.setSymptms(this.symptms);
		psti.setVacCode(this.vacCode);
		psti.setWrtYmd(this.wrtYmd);
		
		return psti;
	}
		
}
