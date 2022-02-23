package com.spring.compass.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;

public class TestResultCheckVO {
	private String bir;
	private String pstiNm;
	private String gender;
	private Date htscYmd;
	private String pstvYn;
	private Date resYmd;
	private String instNm;
	private String smplResCode;
	private String smplNo;
	private String pstiNo;
	private String instNo;
	private String pbhtNm;
	private String manageNo;
	private String rrn;

	public void setSmplResCode(String smplResCode) {
		this.smplResCode = CommonCodeUtil.getCodeName(smplResCode);
	}
	
	
	public String getRrn() {
		return rrn;
	}


	public void setRrn(String rrn) {
		this.rrn = rrn;
	}


	public String getSmplResCode() {
		return smplResCode;
	}

	public String getBir() {
		return bir;
	}

	public void setBir(String bir) {
		this.bir = bir;
	}

	public String getPstiNm() {
		return pstiNm;
	}

	public void setPstiNm(String pstiNm) {
		this.pstiNm = pstiNm;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPstvYn() {
		return pstvYn;
	}

	public void setPstvYn(String pstvYn) {
		this.pstvYn = pstvYn;
	}

	public Date getHtscYmd() {
		return htscYmd;
	}


	public void setHtscYmd(Date htscYmd) {
		this.htscYmd = htscYmd;
	}


	public Date getResYmd() {
		return resYmd;
	}


	public void setResYmd(Date resYmd) {
		this.resYmd = resYmd;
	}

	public String getInstNm() {
		return instNm;
	}

	public void setInstNm(String instNm) {
		this.instNm = instNm;
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

	public String getInstNo() {
		return instNo;
	}

	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}

	public String getPbhtNm() {
		return pbhtNm;
	}

	public void setPbhtNm(String pbhtNm) {
		this.pbhtNm = pbhtNm;
	}

	public String getManageNo() {
		return manageNo;
	}

	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}

	
}
