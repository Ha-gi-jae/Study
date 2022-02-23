package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.SmplResultVO;

public class DgnssDetailCommand implements Serializable{

	private String pstiNm;
	private String nlty = "KOR";
	private Date reqYmd;
	private String vacCode;
	private Date resYmd = new Date();
	private String pstvYn;
	private String feverYn = "N";
	private String pregnYn = "N";
	private String rrn;
	private String pstiTelno;
	private String pstiAdres;
	private String symptms;
	private String manageNo;
	private String smplNo;
	private String pstiNo;
	private String dgnssNo;
	private String gender;
	private String vacType;
	private String dgnssNote;
	private String dgnssCode;
	private String dgnssResultCode;
	private String areaNo;
	
	private String dgnssHsptNo;
	private String dgnssHsptNm;
	
	public String getDgnssHsptNo() {
		return dgnssHsptNo;
	}
	public void setDgnssHsptNo(String dgnssHsptNo) {
		this.dgnssHsptNo = dgnssHsptNo;
	}
	public String getDgnssHsptNm() {
		return dgnssHsptNm;
	}
	public void setDgnssHsptNm(String dgnssHsptNm) {
		this.dgnssHsptNm = dgnssHsptNm;
	}
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	public String getDgnssCode() {
		return dgnssCode;
	}
	public void setDgnssCode(String dgnssCode) {
		this.dgnssCode = dgnssCode;
	}
	public String getDgnssResultCode() {
		return dgnssResultCode;
	}
	public void setDgnssResultCode(String dgnssResultCode) {
		this.dgnssResultCode = dgnssResultCode;
	}

	private String age;
	
	public String getDgnssNote() {
		return dgnssNote;
	}
	public void setDgnssNote(String dgnssNote) {
		this.dgnssNote = dgnssNote;
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
	public String getSmplNo() {
		return smplNo;
	}

	public void setSmplNo(String smplNo) {
		this.smplNo = smplNo;
	}

	public String getPstiNo() {
		return pstiNo;
	}

	public void setPstiNo(String pstiNo) {
		this.pstiNo = pstiNo;
	}

	public String getDgnssNo() {
		return dgnssNo;
	}

	public void setDgnssNo(String dgnssNo) {
		this.dgnssNo = dgnssNo;
	}

	public String getVacType() {
		return vacType;
	}

	public void setVacType(String vacType) {
		this.vacType = vacType;
	}

	public void setData(VPstiCommand psti) {
		
		if(psti== null) return; 
			
		this.pstiNm = psti.getPstiNm();
		this.nlty = psti.getNlty();
		this.vacCode = psti.getVacCode();
		
		this.vacType = CommonCodeUtil.getCodeName(this.vacCode);
		
		this.feverYn = psti.getFeverYn();
		this.pregnYn = psti.getPregnYn();
		this.rrn = psti.getRrn();
		this.pstiTelno = psti.getPstiTelno();
		this.pstiAdres = psti.getPstiAdres();
		this.symptms = psti.getSymptms();
		this.manageNo = psti.getManageNo();
		
		if(psti.getGender() != null) {
			this.gender = psti.getGender().equals("M") ? "남" : "여"; 
		}else {
			this.gender = "";
		}
		this.pstiNo = psti.getPstiNo();
		this.age = psti.getAge();
		this.areaNo = psti.getAreaNo();
		

	}
	public void setData(SmplResultVO smplResult) {
		
		if(smplResult == null) return;
		
		if(smplResult.getResYmd() != null) {
			this.resYmd = smplResult.getResYmd();
		}else {
			// 임시방편, 에러 막으려고 한 것임
			// 반드시 고칠것!!!!!!!!!!
			this.resYmd = new Date(); 
		}
		
		if(smplResult.getPstvYn() != null) {
			this.pstvYn = smplResult.getPstvYn().equals("Y") ? "양성" : "음성" ;
		}else {
			this.pstvYn = "검사중";
		}
		this.smplNo = smplResult.getSmplNo();
		this.pstvYn = smplResult.getPstvYn();
	}
	public void setData(DgnssResultVO dgnssResult) {
		
		if(dgnssResult == null) return;
		
		this.reqYmd = dgnssResult.getReqYmd();
		this.dgnssNo = dgnssResult.getDgnssNo();
		this.dgnssNote = dgnssResult.getDgnssNote();
		this.dgnssResultCode = "정보없음";
		this.dgnssCode = "정보없음";
		this.dgnssHsptNo = dgnssResult.getHsptNo();
		
		if(dgnssResult.getDgnssCode() != null) {
			this.dgnssCode = CommonCodeUtil.getCodeName(dgnssResult.getDgnssCode());
		}
		if(dgnssResult.getDgnssResultCode() != null) {
			this.dgnssResultCode = CommonCodeUtil.getCodeName(dgnssResult.getDgnssResultCode());
		}
		
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

	public Date getReqYmd() {
		return reqYmd;
	}

	public void setReqYmd(Date reqYmd) {
		this.reqYmd = reqYmd;
	}

	public String getVacCode() {
		return vacCode;
	}

	public void setVacCode(String vacCode) {
		this.vacCode = vacCode;
	}

	public Date getResYmd() {
		return resYmd;
	}

	public void setResYmd(Date resYmd) {
		this.resYmd = resYmd;
	}

	public String getPstvYn() {
		return pstvYn;
	}

	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn;
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

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
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

	public String getSymptms() {
		return symptms;
	}

	public void setSymptms(String symptms) {
		this.symptms = symptms;
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	public DgnssDetailCommand() {}
	


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	

}
