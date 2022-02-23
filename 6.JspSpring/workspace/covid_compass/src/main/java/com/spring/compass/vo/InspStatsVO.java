package com.spring.compass.vo;

import java.util.Date;

public class InspStatsVO {

	
	private String inspstatsNo;
	private String inspNo;
	private int reqSmpleCnt;
//	private Date statsYmd;
	private String statsYmd;
	
	
	
	public String getStatsYmd() {
		return statsYmd;
	}
	public void setStatsYmd(String statsYmd) {
		this.statsYmd = statsYmd;
	}
	public String getInspstatsNo() {
		return inspstatsNo;
	}
	public void setInspstatsNo(String inspstatsNo) {
		this.inspstatsNo = inspstatsNo;
	}
	public String getInspNo() {
		return inspNo;
	}
	public void setInspNo(String inspNo) {
		this.inspNo = inspNo;
	}
	public int getReqSmpleCnt() {
		return reqSmpleCnt;
	}
	public void setReqSmpleCnt(int reqSmpleCnt) {
		this.reqSmpleCnt = reqSmpleCnt;
	}
//	public Date getStatsYmd() {
//		return statsYmd;
//	}
//	public void setStatsYmd(Date statsYmd) {
//		this.statsYmd = statsYmd;
//	}
	
	@Override
	public String toString() {
		return "InspStatsVO [inspstatsNo=" + inspstatsNo + ", inspNo=" + inspNo + ", reqSmpleCnt=" + reqSmpleCnt
				+ ", statsYmd=" + statsYmd + "]";
	}
	
	
	
	
	
}
