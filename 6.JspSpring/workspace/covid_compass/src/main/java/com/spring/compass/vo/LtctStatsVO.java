package com.spring.compass.vo;


public class LtctStatsVO {
	
	private String ltctStatsNo;
	private String ltctNo;
	private int reqDgnssCnt;
	private int inIsoptntCnt;
	private int outIsoptntCnt;
	private int totIsoptntCnt;
	private int rlsedCnt;
	private String statsYmd;
	
	public String getLtctStatsNo() {
		return ltctStatsNo;
	}
	public void setLtctStatsNo(String ltctStatsNo) {
		this.ltctStatsNo = ltctStatsNo;
	}
	public String getLtctNo() {
		return ltctNo;
	}
	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}
	
	public int getReqDgnssCnt() {
		return reqDgnssCnt;
	}
	public void setReqDgnssCnt(int reqDgnssCnt) {
		this.reqDgnssCnt = reqDgnssCnt;
	}
	public int getInIsoptntCnt() {
		return inIsoptntCnt;
	}
	public void setInIsoptntCnt(int inIsoptntCnt) {
		this.inIsoptntCnt = inIsoptntCnt;
	}
	public int getOutIsoptntCnt() {
		return outIsoptntCnt;
	}
	public void setOutIsoptntCnt(int outIsoptntCnt) {
		this.outIsoptntCnt = outIsoptntCnt;
	}
	public int getTotIsoptntCnt() {
		return totIsoptntCnt;
	}
	public void setTotIsoptntCnt(int totIsoptntCnt) {
		this.totIsoptntCnt = totIsoptntCnt;
	}
	public int getRlsedCnt() {
		return rlsedCnt;
	}
	public void setRlsedCnt(int rlsedCnt) {
		this.rlsedCnt = rlsedCnt;
	}
	public String getStatsYmd() {
		return statsYmd;
	}
	public void setStatsYmd(String statsYmd) {
		this.statsYmd = statsYmd;
	}
	
	
}
