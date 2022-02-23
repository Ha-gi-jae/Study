package com.spring.compass.command;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SmplResultVO;

public class CnfrmListDetailVO {
	
	private String pstiNo;
	private String pstiNm;
	private String rrn;
	private String gender;
	private String pregnYn;
	private String nlty;
	private String pstiTelno;
	private String pstiAdres;
	private String feverYn;
	private String symptms;
	private String vacCode;
	private String rechkdYn;
	private String manageNo;
	private String cnfmNo;
	private Date inYmd;
	private String ngtvCnt;
	private String sttusCode;
	private String instNm;
	private Date updateYmd;
	private String instTelno;
	private String instAdres;
	private String smplNo;
	private String pstvYn;
	private String dgnssNo;
	private String dgnssCode;
	private String age;

	public void setData(VPstiCommand pstiVO) {
		
		if(pstiVO == null) return;
		
		this.pstiNo = pstiVO.getPstiNo();  
		this.pstiNm = pstiVO.getPstiNm();
		this.rrn = pstiVO.getRrn();
		
		if(pstiVO.getGender() != null) {
			this.gender = pstiVO.getGender().equals("M") ? "남" : "여";
		}else {
			this.gender = "";
		}
		
		this.pregnYn = pstiVO.getPregnYn();  
		this.nlty = pstiVO.getNlty();
		this.pstiTelno = pstiVO.getPstiTelno();
		this.pstiAdres = pstiVO.getPstiAdres();
		this.feverYn = pstiVO.getFeverYn();
		this.symptms = pstiVO.getSymptms();  
		this.vacCode = CommonCodeUtil.getCodeName(pstiVO.getVacCode()); 
		if(pstiVO.getRechkdYn() != null) {
			this.rechkdYn = pstiVO.getRechkdYn().equals("N") ? "본인판단" : "자가격리";
		}else {
			this.rechkdYn = "";
		}
		this.age = pstiVO.getAge();
	}
	
	public void setData(CnfmVO cnfmVO) {
		
		if(cnfmVO == null) return;
		
		this.cnfmNo = cnfmVO.getCnfmNo();  
		this.inYmd = cnfmVO.getInYmd();
		this.ngtvCnt = cnfmVO.getNgtvCnt(); 
		
	}
	public void setData(CnfrmListDetailManageInstVO cldmiVO) {
		
		if(cldmiVO == null) return;
		
		this.manageNo = cldmiVO.getManageNo();  
		
		if(cldmiVO.getSttusCode() != null) {
			this.sttusCode = (cldmiVO.getSttusCode().equals("A102") || cldmiVO.getSttusCode().equals("A104"))
					? CommonCodeUtil.getCodeName(cldmiVO.getSttusCode() + "_NM2")
							: CommonCodeUtil.getCodeName(cldmiVO.getSttusCode());
		}else {
			this.sttusCode = "";
		}
		this.instNm = cldmiVO.getInstNm();  
		this.updateYmd = cldmiVO.getUpdateYmd();
		this.instTelno = cldmiVO.getInstTelno();  
		this.instAdres = cldmiVO.getInstAdres();
	}
	public void setData(SmplResultVO smplVO) {
		
		if(smplVO == null) return;
		
		this.smplNo = smplVO.getSmplNo();
		if(smplVO.getPstvYn() != null) {
			this.pstvYn = smplVO.getPstvYn().equals("Y") ? "양성" : "음성";  
		}else {
			this.pstvYn = "";
		}
		
	}
	public void setData(DgnssVO dgnssVO) {
		
		if(dgnssVO == null) return;
		
		this.dgnssNo = dgnssVO.getDgnssNo();  
		this.dgnssCode = CommonCodeUtil.getCodeName(dgnssVO.getDgnssCode()); 
		
	}
	
	
	
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getPstvYn() {
		return pstvYn;
	}

	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender.equals("M") ? "남" : "여";
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
		this.vacCode = CommonCodeUtil.getCodeName(vacCode);
	}

	public String getRechkdYn() {
		return rechkdYn;
	}

	public void setRechkdYn(String rechkdYn) {
		this.rechkdYn = rechkdYn.equals("N") ? "본인판단" : "자가격리";
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
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

	public String getNgtvCnt() {
		return ngtvCnt;
	}

	public void setNgtvCnt(String ngtvCnt) {
		this.ngtvCnt = ngtvCnt;
	}

	public String getSttusCode() {
		return sttusCode;
	}

	public void setSttusCode(String sttusCode) {
		this.sttusCode = (sttusCode.equals("A102") || sttusCode.equals("A104"))
				? CommonCodeUtil.getCodeName(sttusCode + "_NM2")
				: CommonCodeUtil.getCodeName(sttusCode);
	}

	public String getInstNm() {
		return instNm;
	}

	public void setInstNm(String instnm) {
		this.instNm = instnm;
	}

	public Date getUpdateYmd() {
		return updateYmd;
	}

	public void setUpdateYmd(Date updateYmd) {
		this.updateYmd = updateYmd;
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

}
