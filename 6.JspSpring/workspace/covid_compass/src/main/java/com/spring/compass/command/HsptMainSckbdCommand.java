package com.spring.compass.command;

import java.io.Serializable;


@SuppressWarnings("serial")
public class HsptMainSckbdCommand implements Serializable{

	private String hsptNo;
	private int inptntCnt;
	private int rlsedCnt;
	private int goCnt;
	private int deathCnt;
	private int curInptntCnt;
	
	
	public int getCurInptntCnt() {
		return curInptntCnt;
	}
	public void setCurInptntCnt(int curInptntCnt) {
		this.curInptntCnt = curInptntCnt;
	}
	public String getHsptNo() {
		return hsptNo;
	}
	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}
	public int getInptntCnt() {
		return inptntCnt;
	}
	public void setInptntCnt(int inptntCnt) {
		this.inptntCnt = inptntCnt;
	}
	public int getRlsedCnt() {
		return rlsedCnt;
	}
	public void setRlsedCnt(int rlsedCnt) {
		this.rlsedCnt = rlsedCnt;
	}
	public int getGoCnt() {
		return goCnt;
	}
	public void setGoCnt(int goCnt) {
		this.goCnt = goCnt;
	}
	public int getDeathCnt() {
		return deathCnt;
	}
	public void setDeathCnt(int deathCnt) {
		this.deathCnt = deathCnt;
	}








}
