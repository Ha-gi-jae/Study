package com.spring.compass.command;

import java.text.NumberFormat;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PbhtStatsCommand {

	private String inspSmpleCnt;
	private String pstvCnt;
	private String ngtvCnt;
	private NumberFormat nbf = NumberFormat.getInstance();
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	public String getInspSmpleCnt() {
		return inspSmpleCnt;
	}
	public void setInspSmpleCnt(String inspSmpleCnt) {
		Double inspSmpleCntDB = Double.parseDouble(inspSmpleCnt);
		String commaInspSmpleCnt = nbf.format(inspSmpleCntDB);
		this.inspSmpleCnt = commaInspSmpleCnt;
	}
	public String getPstvCnt() {
		return pstvCnt;
	}
	public void setPstvCnt(String pstvCnt) {
		Double pstvCntDB = Double.parseDouble(pstvCnt);
		String commaPstvCnt = nbf.format(pstvCntDB);
		this.pstvCnt = commaPstvCnt;
	}
	public String getNgtvCnt() {
		return ngtvCnt;
	}
	public void setNgtvCnt(String ngtvCnt) {
		Double ngtvCntDB = Double.parseDouble(ngtvCnt);
		String commaNgtvCnt = nbf.format(ngtvCntDB);
		this.ngtvCnt = commaNgtvCnt;
	}

}
