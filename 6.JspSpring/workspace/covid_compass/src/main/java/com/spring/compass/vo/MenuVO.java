package com.spring.compass.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class MenuVO implements Serializable{

	private String menuNo;
	private String menuType;
	private String menuUrl;
	private String menuLevel;
	private String menuIsnav;
	private String upmenuNo;
	private String menuNm;
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo; 
	}
	public String getMenuNo() {
		return menuNo; 
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType; 
	}
	public String getMenuType() {
		return menuType; 
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl; 
	}
	public String getMenuUrl() {
		return menuUrl; 
	}
	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel; 
	}
	public String getMenuLevel() {
		return menuLevel; 
	}
	public void setMenuIsnav(String menuIsnav) {
		this.menuIsnav = menuIsnav; 
	}
	public String getMenuIsnav() {
		return menuIsnav; 
	}
	public void setUpmenuNo(String upmenuNo) {
		this.upmenuNo = upmenuNo; 
	}
	public String getUpmenuNo() {
		return upmenuNo; 
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm; 
	}
	public String getMenuNm() {
		return menuNm; 
	}

}
