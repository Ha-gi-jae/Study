package com.spring.compass.command;

import java.util.Date;

public class ResSmplDetailSmplCnfmInstVO {
	
	private String pstvYn;       // 결과         
	private String cnfmNo;       // 확진자코드      
	private Date inYmd;          // 확정일자       
	private String instNm;       // 요청기관       
	private String instTelno;    // 요청기관 연락처   
	private String instAdres;    // 요청기관 주소    
	
	
	
	public String getPstvYn() {
		return pstvYn;
	}
	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn;
	}
	public String getCnfmNo() {
		return cnfmNo;
	}
	public void setCnfmNo(String cnfmNo) {
		this.cnfmNo = cnfmNo;
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}
	public String getInstNm() {
		return instNm;
	}
	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}
	public String getInstTelno() {
		return instTelno;
	}
	public void setInstTelno(String instTelno) {
		this.instTelno = instTelno;
	}
	public String getInstAdres() {
		return instAdres;
	}
	public void setInstAdres(String instAdres) {
		this.instAdres = instAdres;
	}
	
}
     
     
     
     
     
     