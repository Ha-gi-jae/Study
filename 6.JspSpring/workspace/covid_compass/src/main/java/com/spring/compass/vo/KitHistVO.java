package com.spring.compass.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

@SuppressWarnings("serial")
public class KitHistVO implements Serializable {

	private String kithistNo;
	private String inspNo;
	private String inspempNo;
	private int inputCnt;
	
	public String getKithistNo() {
		return kithistNo;
	}

	public void setKithistNo(String kithistNo) {
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
