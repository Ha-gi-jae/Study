package com.spring.compass.command;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;

public class ResSmplDetailVO {
	
	private String pstiNm;         // 성명      
	private String rrn;            // 주민등록번호  
	private String age;            // 나이      
	private String gender;         // 성별      
	private String pregnYn;        // 임신여부    
	private String nlty;           // 국적      
	private String pstiTelno;      // 연락처     
	private String pstiAdres;      // 주소      
	private String feverYn;        // 발열여부    
	private String symptms;        // 증상      
	private String vacCode;        // 백신접종    
	private String manageNo;       // 고유 넘버   
	private String rechkdYn;       // 검사경위    
	private String sttusCode;      // 상태코드    
	private String maxBrssr;       // 최고혈압    
	private String minBrssr;       // 최저혈압    
	private String bdheight;       // 신장      
	private String bdweight;       // 체중      
	private String bdheat;         // 체온 
	private String pstvYn;         // 결과         
	private String cnfmNo;         // 확진자코드      
	private Date inYmd;            // 확정일자       
	private String instNm;         // 요청기관       
	private String instTelno;      // 요청기관 연락처   
	private String instAdres;      // 요청기관 주소    
	private String resYmd;		   // 결과입력일	
	
	public void setDate(ResSmplDetailPstiHtscVO rsdphVO) {
		
		if(rsdphVO == null) return;
		
		this.pstiNm = rsdphVO.getPstiNm();
		this.rrn = rsdphVO.getRrn();
		this.age = rsdphVO.getAge();
		this.gender = rsdphVO.getGender().equals("M") ? "남" : "여";
		this.pregnYn = rsdphVO.getPregnYn();
		this.nlty = rsdphVO.getNlty();
		this.pstiTelno = rsdphVO.getPstiTelno();
		this.pstiAdres = rsdphVO.getPstiAdres();
		this.feverYn = rsdphVO.getFeverYn();
		this.symptms = rsdphVO.getSymptms();
		this.vacCode = CommonCodeUtil.getCodeName(rsdphVO.getVacCode()); 
		this.manageNo = rsdphVO.getManageNo();
		this.rechkdYn = rsdphVO.getRechkdYn().equals("N") ? "본인판단" : "자가격리"; 
//		this.sttusCode = (rsdphVO.getSttusCode().equals("A102") || rsdphVO.getSttusCode().equals("A104") || rsdphVO.getSttusCode().equals("A103"))
//				? CommonCodeUtil.getCodeName(rsdphVO.getSttusCode() + "_NM2")
//				: CommonCodeUtil.getCodeName(rsdphVO.getSttusCode());
		this.sttusCode = (rsdphVO.getSttusCode().equals("A102") || rsdphVO.getSttusCode().equals("A104") || rsdphVO.getSttusCode().equals("A103"))
				? CommonCodeUtil.getCodeName(rsdphVO.getSttusCode() + "_NM2")
						: CommonCodeUtil.getCodeName(rsdphVO.getSttusCode());
		this.maxBrssr = rsdphVO.getMaxBrssr();
		this.minBrssr = rsdphVO.getMinBrssr();
		this.bdheight = rsdphVO.getBdheight();
		this.bdweight = rsdphVO.getBdweight();
		this.bdheat = rsdphVO.getBdheat();
	}
	
	public void setDate(ResSmplDetailSmplCnfmInstVO rsdscVO) {
		
		 if(rsdscVO == null) return;
		
		 this.pstvYn = rsdscVO.getPstvYn().equals("Y") ? "양성" : "음성";    
		 this.cnfmNo = rsdscVO.getCnfmNo();
		 this.inYmd = rsdscVO.getInYmd();
		 this.instNm = rsdscVO.getInstNm();
		 this.instTelno = rsdscVO.getInstTelno();
		 this.instAdres = rsdscVO.getInstAdres();
	}
	
	public void setDate(ResSmplDetailNegativeSmplInstVO rsdnsiVO) {
		
		if(rsdnsiVO == null) return;
		
		this.pstvYn = rsdnsiVO.getPstvYn().equals("Y") ? "양성" : "음성";    
		this.resYmd = rsdnsiVO.getResYmd();
		this.instNm = rsdnsiVO.getInstNm();
		this.instTelno = rsdnsiVO.getInstTelno();
		this.instAdres = rsdnsiVO.getInstAdres();
	}
	
	
	
	public String getResYmd() {
		return resYmd;
	}

	public void setResYmd(String resYmd) {
		this.resYmd = resYmd;
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

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	public String getRechkdYn() {
		return rechkdYn;
	}

	public void setRechkdYn(String rechkdYn) {
		this.rechkdYn = rechkdYn;
	}

	public String getSttusCode() {
		return sttusCode;
	}

	public void setSttusCode(String sttusCode) {
		this.sttusCode = sttusCode;
	}

	public String getMaxBrssr() {
		return maxBrssr;
	}

	public void setMaxBrssr(String maxBrssr) {
		this.maxBrssr = maxBrssr;
	}

	public String getMinBrssr() {
		return minBrssr;
	}

	public void setMinBrssr(String minBrssr) {
		this.minBrssr = minBrssr;
	}

	public String getBdheight() {
		return bdheight;
	}

	public void setBdheight(String bdheight) {
		this.bdheight = bdheight;
	}

	public String getBdweight() {
		return bdweight;
	}

	public void setBdweight(String bdweight) {
		this.bdweight = bdweight;
	}

	public String getBdheat() {
		return bdheat;
	}

	public void setBdheat(String bdheat) {
		this.bdheat = bdheat;
	}

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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
	
	
}	 
