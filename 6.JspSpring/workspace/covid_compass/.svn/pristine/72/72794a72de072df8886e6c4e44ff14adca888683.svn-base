package com.spring.compass.command;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class HsptSearchCommand extends SearchCriteria implements Serializable{

	private String areaNo1;
	private String areaNo2;
	private String areaNo3;
	
	private String areaNo;
	
	private String hsptNo;
	private String pbhtNo;
	private String ltctNo;
	
	public String getHsptNo() {
		return hsptNo;
	}

	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}

	public String getPbhtNo() {
		return pbhtNo;
	}

	public void setPbhtNo(String pbhtNo) {
		this.pbhtNo = pbhtNo;
	}

	public String getLtctNo() {
		return ltctNo;
	}

	public void setLtctNo(String ltctNo) {
		this.ltctNo = ltctNo;
	}

	public HsptSearchCommand() {}
	
	public HsptSearchCommand(int page, int perPageNum, String searchType, String keyword) {
		super(page, perPageNum, searchType, keyword);
	}
	
	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public String getAreaNo1() {
		return areaNo1;
	}

	public void setAreaNo1(String areaNo1) {
		this.areaNo1 = areaNo1;
	}

	public String getAreaNo2() {
		return areaNo2;
	}

	public void setAreaNo2(String areaNo2) {
		this.areaNo2 = areaNo2;
	}

	public String getAreaNo3() {
		return areaNo3;
	}

	public void setAreaNo3(String areaNo3) {
		this.areaNo3 = areaNo3;
	}

	public void setData(String areaNo) {
		
		String middle = String.valueOf(areaNo.charAt(1));
		String left = String.valueOf(Integer.parseInt(middle) - 1);
		String right = String.valueOf(Integer.parseInt(middle) + 1);
		
		areaNo2 = "0" + middle;
		areaNo1 = "0" + left;
		areaNo3 = "0" + right;
		
		this.areaNo = areaNo;
		
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);	
	}
	
}
