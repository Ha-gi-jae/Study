package com.spring.compass.command;

public class SlfptntDetailDgnssHsptVO {
	
	private String instNm; 			// 진료병원
	private String dgnssResultCode; // 진료결과
	private String dgnssNote; 		// 진료메모
	
	
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
	
	
	
}
