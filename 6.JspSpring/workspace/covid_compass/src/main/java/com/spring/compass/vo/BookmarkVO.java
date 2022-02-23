package com.spring.compass.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class BookmarkVO implements Serializable {
	
	private String fromInstNo;
	private String toInstNo;
	private String fromInstCode;
	private String toInstCode;
	
	public BookmarkVO() {}
	
	
	public BookmarkVO(String fromInstNo, String toInstNo, String fromInstCode, String toInstCode) {
		super();
		this.fromInstNo = fromInstNo;
		this.toInstNo = toInstNo;
		this.fromInstCode = fromInstCode;
		this.toInstCode = toInstCode;
	}


	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}

	public String getFromInstNo() {
		return fromInstNo;
	}

	public void setFromInstNo(String fromInstNo) {
		this.fromInstNo = fromInstNo;
	}

	public String getToInstNo() {
		return toInstNo;
	}

	public void setToInstNo(String toInstNo) {
		this.toInstNo = toInstNo;
	}

	public String getFromInstCode() {
		return fromInstCode;
	}

	public void setFromInstCode(String fromInstCode) {
		this.fromInstCode = fromInstCode;
	}

	public String getToInstCode() {
		return toInstCode;
	}

	public void setToInstCode(String toInstCode) {
		this.toInstCode = toInstCode;
	}
}
