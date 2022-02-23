package com.spring.compass.command;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;

public class SlfptntDetailVO {
	
	private String pstiNo;			// 고유번호
	private String pstiNm; 			// 이름
	private String rrn; 			// 주민
	private String age; 			// 나이
	private String gender; 			// 성별
	private String pregnYn; 		// 임신
	private String nlty; 			// 국적
	private String pstiTelno; 		// 연락처
	private String pstiAdres; 		// 주소
	private String feverYn; 		// 발열
	private String symptms; 		// 증상
	private String vacCode; 		// 백신접종
	private String rechkdYn; 		// 검사경위

	private Date reqYmd; 			// 검사일자
	private String pstvYn; 			// 검사결과
	private String ngtvCnt; 		// 누적음성

	private String instNm; 			// 진료병원
	private String dgnssResultCode; // 진료결과
	private String dgnssNote; 		// 진료메모
	
	
	public void setData(VPstiCommand psti) {
		
		if(psti == null) return;
		this.pstiNo = psti.getPstiNo();
		this.pstiNm = psti.getPstiNm();		
		this.rrn = psti.getRrn(); 		
		this.age = psti.getAge();		
		
		if(psti.getGender() != null) {
			this.gender = psti.getGender().equals("M") ? "남" : "여" ; 		
		}else {
			this.gender = ""; 		
		}		
		this.pregnYn = psti.getPregnYn();	
		this.nlty = psti.getNlty(); 		
		this.pstiTelno = psti.getPstiTelno();
		this.pstiAdres = psti.getPstiAdres();
		this.feverYn = psti.getFeverYn();
		this.symptms = psti.getSymptms();
		this.vacCode = CommonCodeUtil.getCodeName(psti.getVacCode());
		this.rechkdYn = psti.getRechkdYn().equals("N") ? "본인판단" : "자가격리";
	}
	public void setData(SlfptntDetailSmplCnfmVO sdscVO) {
		
		
		if(sdscVO == null) return;
		
		this.reqYmd = sdscVO.getReqYmd();
		if(sdscVO.getPstvYn() != null) {
			this.pstvYn = sdscVO.getPstvYn().equals("Y") ? "양성" : "음성"; 
		}else {
			this.pstvYn = "";
		} 
		this.ngtvCnt = sdscVO.getNgtvCnt();
		
	}
	public void setData(SlfptntDetailDgnssHsptVO sddhVO) {
		
		if(sddhVO == null) return;
		
		this.instNm = sddhVO.getInstNm();
		this.dgnssResultCode = CommonCodeUtil.getCodeName(sddhVO.getDgnssResultCode());
		this.dgnssNote = sddhVO.getDgnssNote();
	}
	
	
	
	public String getPstiNo() {
		return pstiNo;
	}
	public void setPstiNo(String pstiNo) {
		this.pstiNo = pstiNo;
	}
	public String getPstiNm() {
		return pstiNm;
	}
	public void setPstiNm(String pstiNm) {
		this.pstiNm = pstiNm;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPregnYn() {
		return pregnYn;
	}
	public void setPregnYn(String pregnYn) {
		this.pregnYn = pregnYn;
	}
	public String getNlty() {
		return nlty;
	}
	public void setNlty(String nlty) {
		this.nlty = nlty;
	}
	public String getPstiTelno() {
		return pstiTelno;
	}
	public void setPstiTelno(String pstiTelno) {
		this.pstiTelno = pstiTelno;
	}
	public String getPstiAdres() {
		return pstiAdres;
	}
	public void setPstiAdres(String pstiAdres) {
		this.pstiAdres = pstiAdres;
	}
	public String getFeverYn() {
		return feverYn;
	}
	public void setFeverYn(String feverYn) {
		this.feverYn = feverYn;
	}
	public String getSymptms() {
		return symptms;
	}
	public void setSymptms(String symptms) {
		this.symptms = symptms;
	}
	public String getVacCode() {
		return vacCode;
	}
	public void setVacCode(String vacCode) {
		this.vacCode = vacCode;
	}
	public String getRechkdYn() {
		return rechkdYn;
	}
	public void setRechkdYn(String rechkdYn) {
		this.rechkdYn = rechkdYn;
	}
	public Date getReqYmd() {
		return reqYmd;
	}
	public void setReqYmd(Date reqYmd) {
		this.reqYmd = reqYmd;
	}
	public String getPstvYn() {
		return pstvYn;
	}
	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn;
	}
	public String getNgtvCnt() {
		return ngtvCnt;
	}
	public void setNgtvCnt(String ngtvCnt) {
		this.ngtvCnt = ngtvCnt;
	}
	public String getInstNm() {
		return instNm;
	}
	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}
	public String getDgnssResultCode() {
		return dgnssResultCode;
	}
	public void setDgnssResultCode(String dgnssResultCode) {
		this.dgnssResultCode = dgnssResultCode;
	}
	public String getDgnssNote() {
		return dgnssNote;
	}
	public void setDgnssNote(String dgnssNote) {
		this.dgnssNote = dgnssNote;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

	
	
}
