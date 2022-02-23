package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.vo.LtctVO;

public class SckbdreqDetailCommand extends ReqInptntDetailCommand implements Serializable{
	
	public SckbdreqDetailCommand() {}
	
	private String ltctAreaNo;
	private int ltctEmpCnt;
	private String ltctAdres;
	private String ltctNm;
	private String ltctNo;
	private String ltctTelno;
	private int rmndSckbdCnt;
	private int sckbdCnt;
	
	private boolean lastRecord;
	
	public String getLtctAreaNo() {
		return ltctAreaNo;
	}

	public void setLtctAreaNo(String ltctAreaNo) {
		this.ltctAreaNo = ltctAreaNo;
	}

	public int getLtctEmpCnt() {
		return ltctEmpCnt;
	}

	public void setLtctEmpCnt(int ltctEmpCnt) {
		this.ltctEmpCnt = ltctEmpCnt;
	}

	public String getLtctAdres() {
		return ltctAdres;
	}

	public void setLtctAdres(String ltctAdres) {
		this.ltctAdres = ltctAdres;
	}

	public String getLtctNm() {
		return ltctNm;
	}

	public void setLtctNm(String ltctNm) {
		this.ltctNm = ltctNm;
	}

	public String getLtctNo() {
		return ltctNo;
	}

	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}

	public String getLtctTelno() {
		return ltctTelno;
	}

	public void setLtctTelno(String ltctTelno) {
		this.ltctTelno = ltctTelno;
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

	public boolean isLastRecord() {
		return lastRecord;
	}

	public void setLastRecord(boolean lastRecord) {
		this.lastRecord = lastRecord;
	}

	public void setData(LtctVO ltct) {
		if(ltct == null) return;
		this.ltctAreaNo = ltct.getAreaNo();
		this.ltctEmpCnt = ltct.getEmpCnt();
		this.ltctAdres = ltct.getInstAdres();
		this.ltctNm = ltct.getInstNm();
		this.ltctNo = ltct.getLtctNo();
		this.ltctTelno = ltct.getInstTelno();
		this.rmndSckbdCnt = ltct.getRmndSckbdCnt();
		this.sckbdCnt = ltct.getSckbdCnt();
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
