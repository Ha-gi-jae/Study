package com.spring.compass.command;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;

public class CnfrmDgnssReqDetailVO {

	private String pstiNm;
	private String nlty;
	private String rechkdYn;
	private String vacCode;
	private String gender;
	private String age;
	private String feverYn;
	private String pregnYn;
	private String inYmd;
	private String pstvYn;
	private String cnfmNo;
	private String rrn;
	private String pstiAdres;
	private String pstiTelno;
	private String symptms;
	private String type;
	private String dgnssNo;
	private Date reqYmd;
	private String dgnssCode;
	private String instNm;
	private String instAdres;
	private String instTelno;
	private Date cancleYmd;
	private String sttusCode;
	private String hsptNo;
	private boolean result;
	
	
	public String getHsptNo() {
		return hsptNo;
	}
	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
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
	public String getInYmd() {
		return inYmd;
	}
	public void setInYmd(String inYmd) {
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type.equals("A") ? "보건소" : "생활치료센터";
	}
	public String getDgnssNo() {
		return dgnssNo;
	}
	public void setDgnssNo(String dgnssNo) {
		this.dgnssNo = dgnssNo;
	}
	public String getDgnssCode() {
		return dgnssCode;
	}
	public void setDgnssCode(String dgnssCode) {
		this.dgnssCode = CommonCodeUtil.getCodeName(dgnssCode);
	}
	public String getInstNm() {
		return instNm;
	}
	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}
	public String getInstAdres() {
		return instAdres;
	}
	public void setInstAdres(String instAdres) {
		this.instAdres = instAdres;
	}
	public String getInstTelno() {
		return instTelno;
	}
	public void setInstTelno(String instTelno) {
		this.instTelno = instTelno;
	}
	public String getSttusCode() {
		return sttusCode;
	}
	public void setSttusCode(String sttusCode) {
		this.sttusCode = CommonCodeUtil.getCodeName(sttusCode + "_NM2");
	}
	
	public Date getReqYmd() {
		return reqYmd;
	}
	public void setReqYmd(Date reqYmd) {
		this.reqYmd = reqYmd;
	}
	public Date getCancleYmd() {
		return cancleYmd;
	}
	public void setCancleYmd(Date cancleYmd) {
		this.cancleYmd = cancleYmd;
	}
	
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public boolean toCancleYmd() {
		
		boolean resultData = true;
		
		Date now = new Date();
		
		if(cancleYmd.before(now)) resultData = false;
		
		return resultData;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
	
}
