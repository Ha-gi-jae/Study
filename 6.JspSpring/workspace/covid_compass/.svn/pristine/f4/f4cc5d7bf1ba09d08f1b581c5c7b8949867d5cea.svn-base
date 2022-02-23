package com.spring.compass.vo;

import java.text.NumberFormat;

public class DailyCovidVO {
	
	private String beforeday;
	private String confirm;
	private String millionConfirmStr;
	private String domestic;
	private String overseas;
	private String death;
	private String millionDeathStr;
	private String day;
	private String month;
	private String year;
	private String avgMillionConfirm;
	private String avgMillionDeath;
	private String avgConfirm;
	private String avgDeath;
	private NumberFormat numberformat = NumberFormat.getInstance();
	

	public String getAvgConfirm() {
		return avgConfirm;
	}

	public void setAvgConfirm(String avgConfirm) {
		this.avgConfirm = avgConfirm;
	}

	public String getAvgDeath() {
		return avgDeath;
	}

	public void setAvgDeath(String avgDeath) {
		this.avgDeath = avgDeath;
	}

	public String getAvgMillionConfirm() {
		return avgMillionConfirm;
	}

	public void setAvgMillionConfirm(String avgMillionConfirm) {
		this.avgMillionConfirm = avgMillionConfirm;
	}

	public String getAvgMillionDeath() {
		return avgMillionDeath;
	}

	public void setAvgMillionDeath(String avgMillionDeath) {
		this.avgMillionDeath = avgMillionDeath;
	}

	public String getMillionConfirmStr() {
		return millionConfirmStr;
	}

	public void setMillionConfirmStr(String millionConfirmStr) {
		this.millionConfirmStr = millionConfirmStr;
	}

	public String getMillionDeathStr() {
		return millionDeathStr;
	}

	public void setMillionDeathStr(String millionDeathStr) {
		this.millionDeathStr = millionDeathStr;
	}

	public String getDay() {
		return day;
	}
	
	public String getMonth() {
		return month;
	}
	
	public String getYear() {
		return year;
	}
	
	public String getBeforeday() {
		return beforeday;
	}
	public void setBeforeday(String beforeday) {
		this.beforeday = beforeday;
		String dateFmt[] = this.beforeday.split("-");
		this.day=dateFmt[0];
		this.month=dateFmt[1];
		this.year=dateFmt[2];
		
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
		
	}
	public String getDomestic() {
		return domestic;
	}
	public void setDomestic(String domestic) {
		this.domestic = domestic;
	}
	public String getOverseas() {
		return overseas;
	}
	public void setOverseas(String overseas) {
		this.overseas = overseas;
	}
	public String getDeath() {
		return death;
	}
	public void setDeath(String death) {
		this.death = death;
	}
	
	
	@Override
	public String toString() {
		return "DailyCovidVO [beforeday=" + beforeday + ", confirm=" + confirm + ", millionConfirmStr="
				+ millionConfirmStr + ", domestic=" + domestic + ", overseas=" + overseas + ", death=" + death
				+ ", millionDeathStr=" + millionDeathStr + ", day=" + day + ", month=" + month + ", year=" + year
				+ ", avgConfirm=" + avgConfirm + ", avgDeath=" + avgDeath + "]";
	}

	
	
	
	
	
	
}
