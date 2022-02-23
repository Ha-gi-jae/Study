package com.spring.compass.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class LtctVO implements Serializable{

	private String instNo;
	private String instNm;
	private int empCnt = 0;
	private String instTelno;
	private String instCode="C104";
	private int rmndSckbdCnt = 0;
	private int sckbdCnt = 0;
	private String instAdres;
	private String ltctNo;
	private String cityNo;
	private String areaNo;
	
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	public String getInstCode() {
		return instCode;
	}
	public void setInstCode(String instCode) {
		this.instCode = instCode;
	}
	public String getCityNo() {
		return cityNo;
	}
	public void setCityNo(String cityNo) {
		this.cityNo = cityNo;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	public String getInstNo() {
		return instNo;
	}
	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}
	public String getInstNm() {
		return instNm;
	}
	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}
	public int getEmpCnt() {
		return empCnt;
	}
	public void setEmpCnt(int empCnt) {
		this.empCnt = empCnt;
	}
	public String getInstTelno() {
		return instTelno;
	}
	public void setInstTelno(String instTelno) {
		this.instTelno = instTelno;
	}
	public int getRmndSckbdCnt() {
		return rmndSckbdCnt;
	}
	public void setRmndSckbdCnt(int rmndSckbdCnt) {
		this.rmndSckbdCnt = rmndSckbdCnt;
	}
	public int getSckbdCnt() {
		return sckbdCnt;
	}
	public void setSckbdCnt(int sckbdCnt) {
		this.sckbdCnt = sckbdCnt;
	}
	public String getInstAdres() {
		return instAdres;
	}
	public void setInstAdres(String instAdres) {
		this.instAdres = instAdres;
	}
	public String getLtctNo() {
		return ltctNo;
	}
	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}
}
