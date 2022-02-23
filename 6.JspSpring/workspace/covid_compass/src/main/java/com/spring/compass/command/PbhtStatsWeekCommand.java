package com.spring.compass.command;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PbhtStatsWeekCommand {
		
	private String dgnssResultCode;
	private int cnt;
	private String resYmd;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
	public String getDgnssResultCode() {
		return dgnssResultCode;
	}

	public void setDgnssResultCode(String dgnssResultCode) {
		this.dgnssResultCode = dgnssResultCode;
	}

	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getResYmd() {
		return resYmd;
	}
	public void setResYmd(String resYmd) {
		this.resYmd = resYmd;
	}
	
}
