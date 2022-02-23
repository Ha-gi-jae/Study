package com.spring.compass.vo;


public class WholeCovidVO {
	
	 private String confirm;
	 private String domestic;
	 private String overseas;
	 private String wholedeath;
	 private String lethality;
	 private String millionConfirmPrsStr;
	 private String millionDeathPrsStr;
	 
	 
	public String getMillionConfirmPrsStr() {
		return millionConfirmPrsStr;
	}
	public String getMillionDeathPrsStr() {
		return millionDeathPrsStr;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
		int chck = this.confirm.indexOf(",");
		if(chck == -1) {
			double wholeConfirmDR = Double.parseDouble(this.confirm);
			double millionPrsConfirm = wholeConfirmDR/100000;
			this.millionConfirmPrsStr = String.format("%.2f", millionPrsConfirm);
		}
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
	public String getWholedeath() {
		return wholedeath;
	}
	public void setWholedeath(String wholedeath) {
		this.wholedeath = wholedeath;
		int chck = this.wholedeath.indexOf(",");
		if(chck == -1) {
			double wholedeathDR = Double.parseDouble(this.wholedeath);
			double millionPrsDeath = wholedeathDR/100000;
			this.millionDeathPrsStr = String.format("%.2f", millionPrsDeath);
		}
	}
	
	public String getLethality() {
		return lethality;
	}
	public void setLethality(String lethality) {
		this.lethality = lethality;
	}
	@Override
	public String toString() {
		return "WholeCovidVO [confirm=" + confirm + ", domestic=" + domestic + ", overseas=" + overseas
				+ ", wholedeath=" + wholedeath + ", lethality=" + lethality + "]";
	}
	
	 
	
	
}
