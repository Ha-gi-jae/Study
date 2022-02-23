package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class LtctListToSckbdreqCommand implements Serializable{
	
	private String instNo;
	private String instNm;
	private int empCnt;
	private String instTelno;
	private int rmndSckbdCnt;
	private int sckbdCnt;
	private String instAdres;
	private String areaNo;
	private double opRate;
	private String ltctNo;
	
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
	public String getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}
	public double getOpRate() {
		return opRate;
	}
	public void setOpRate(double opRate) {
		this.opRate = opRate >= 0 ? opRate : 0;
	}
	public String getLtctNo() {
		return ltctNo;
	}
	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}
	
	
}
