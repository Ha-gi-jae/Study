package com.spring.compass.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PbhtStatsDateCommand {

	private String oneDay;
	private String twoDay;
	private String threeDay;
	private String fourDay;
	private String fiveDay;
	private String sixDay;
	private String sevenDay;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

	public String getOneDay() {
		return oneDay;
	}

	public void setOneDay(String oneDay) {
		this.oneDay = oneDay;
	}

	public String getTwoDay() {
		return twoDay;
	}

	public void setTwoDay(String twoDay) {
		this.twoDay = twoDay;
	}

	public String getThreeDay() {
		return threeDay;
	}

	public void setThreeDay(String threeDay) {
		this.threeDay = threeDay;
	}

	public String getFourDay() {
		return fourDay;
	}

	public void setFourDay(String fourDay) {
		this.fourDay = fourDay;
	}

	public String getFiveDay() {
		return fiveDay;
	}

	public void setFiveDay(String fiveDay) {
		this.fiveDay = fiveDay;
	}

	public String getSixDay() {
		return sixDay;
	}

	public void setSixDay(String sixDay) {
		this.sixDay = sixDay;
	}

	public String getSevenDay() {
		return sevenDay;
	}

	public void setSevenDay(String sevenDay) {
		this.sevenDay = sevenDay;
	}

	public Map<String, Object> getMap() {
		Map<String, Object> weekMap = new HashMap<String, Object>();

		weekMap.put(oneDay, oneDay);
		weekMap.put(twoDay, twoDay);
		weekMap.put(threeDay, threeDay);
		weekMap.put(fourDay, fourDay);
		weekMap.put(fiveDay, fiveDay);
		weekMap.put(sixDay, sixDay);
		weekMap.put(sevenDay, sevenDay);

		return weekMap;
	}
	
	public List<String> toList(){
		List<String> weekList = new ArrayList<String>();
		
		weekList.add(oneDay);
		weekList.add(twoDay);
		weekList.add(threeDay);
		weekList.add(fourDay);
		weekList.add(fiveDay);
		weekList.add(sixDay);
		weekList.add(sevenDay);
		
		return weekList;
	}

}
