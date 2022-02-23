package com.spring.compass.vo;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class PcrKitVO implements Serializable {

	private int kithistNo;
	private String inspNo;
	private String inspempNo;
	private int inputCnt;
	private Date inputYmd;
	private String mberNm;
	
	public String getMberNm() {
		return mberNm;
	}
	public void setMberNm(String mberNm) {
		this.mberNm = mberNm;
	}
	public int getKithistNo() {
		return kithistNo;
	}
	public void setKithistNo(int kithistNo) {
		this.kithistNo = kithistNo;
	}
	public String getInspNo() {
		return inspNo;
	}
	public void setInspNo(String inspNo) {
		this.inspNo = inspNo;
	}
	public String getInspempNo() {
		return inspempNo;
	}
	public void setInspempNo(String inspempNo) {
		this.inspempNo = inspempNo;
	}
	public int getInputCnt() {
		return inputCnt;
	}
	public void setInputCnt(int inputCnt) {
		this.inputCnt = inputCnt;
	}
	public Date getInputYmd() {
		return inputYmd;
	}
	public void setInputYmd(Date inputYmd) {
		this.inputYmd = inputYmd;
	}
	
	
	
}
