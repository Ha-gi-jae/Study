package com.spring.compass.util;

import java.util.Map;

import com.spring.compass.vo.DailyCovidVO;

public class MakeMillionCalc {
	
	
	public static Map<String, DailyCovidVO> calcDailyMillion(String wholeConfirm, String wholeDeath, Map<String, DailyCovidVO> dailyMap){
		Double wholeConfirmDR = Double.parseDouble(wholeConfirm);
		DailyCovidVO sevenDay =dailyMap.get("sevenDay");
		Double millionsSeven = wholeConfirmDR/100000;
		String sevenMillionConfirmStr = String.format("%.2f", millionsSeven);
		sevenDay.setMillionConfirmStr(sevenMillionConfirmStr);
		
		DailyCovidVO sixDay =dailyMap.get("sixDay");
		Double millionSix = (wholeConfirmDR- Double.parseDouble(sevenDay.getConfirm()))/100000;
		String sixMillionConfirmStr = String.format("%.2f", millionSix);
		sixDay.setMillionConfirmStr(sixMillionConfirmStr);
		
		DailyCovidVO fiveDay = dailyMap.get("fiveDay");
		Double millionFive =(wholeConfirmDR- 
							(Double.parseDouble(sevenDay.getConfirm())
							+Double.parseDouble(sixDay.getConfirm())))/100000;
		String fiveMillionConfirmStr = String.format("%.2f", millionFive);
		fiveDay.setMillionConfirmStr(fiveMillionConfirmStr);
		
		DailyCovidVO fourDay = dailyMap.get("fourDay");
		Double millionFour = (wholeConfirmDR- 
							(Double.parseDouble(sevenDay.getConfirm())
							 +Double.parseDouble(sixDay.getConfirm())
							 +Double.parseDouble(fiveDay.getConfirm())
							))/100000;
		String fourMillionConfirmStr = String.format("%.2f", millionFour);
		fourDay.setMillionConfirmStr(fourMillionConfirmStr);
		
		DailyCovidVO threeDay = dailyMap.get("threeDay");
		Double millionThree = (wholeConfirmDR- 
							(Double.parseDouble(sevenDay.getConfirm())
							+Double.parseDouble(sixDay.getConfirm())
							+Double.parseDouble(fiveDay.getConfirm())
							+Double.parseDouble(fourDay.getConfirm())
							))/100000;
		String threeMillionConfirmStr = String.format("%.2f", millionThree);
		threeDay.setMillionConfirmStr(threeMillionConfirmStr);
		
		DailyCovidVO twoDay = dailyMap.get("twoDay");
		Double millionTwo = (wholeConfirmDR- 
							(Double.parseDouble(sevenDay.getConfirm())
							+Double.parseDouble(sixDay.getConfirm())
							+Double.parseDouble(fiveDay.getConfirm())
							+Double.parseDouble(fourDay.getConfirm())
							+Double.parseDouble(threeDay.getConfirm())))/100000;
		String twoMillionConfirmStr = String.format("%.2f", millionTwo);
		twoDay.setMillionConfirmStr(twoMillionConfirmStr);
		
		DailyCovidVO oneDay = dailyMap.get("oneDay");
		Double millionOne = (wholeConfirmDR- 
							(Double.parseDouble(sevenDay.getConfirm())
							+Double.parseDouble(sixDay.getConfirm())
							+Double.parseDouble(fiveDay.getConfirm())
							+Double.parseDouble(fourDay.getConfirm())
							+Double.parseDouble(threeDay.getConfirm())
							+Double.parseDouble(twoDay.getConfirm())))/100000;
		String oneMillionConfirmStr = String.format("%.2f", millionOne);
		oneDay.setMillionConfirmStr(oneMillionConfirmStr);
		
		
		Double avgConfirmDB = (millionsSeven + millionSix + millionFive 
				 			  +millionFour +millionThree +millionTwo+millionOne)/7;
		String avgMillionConfirm = String.format("%.2f", avgConfirmDB);
		oneDay.setAvgMillionConfirm(avgMillionConfirm);
		twoDay.setAvgMillionConfirm(avgMillionConfirm);
		threeDay.setAvgMillionConfirm(avgMillionConfirm);
		fourDay.setAvgMillionConfirm(avgMillionConfirm);
		fiveDay.setAvgMillionConfirm(avgMillionConfirm);
		sixDay.setAvgMillionConfirm(avgMillionConfirm);
		sevenDay.setAvgMillionConfirm(avgMillionConfirm);
		
		Double dailyAvgConfirm =(Double.parseDouble(oneDay.getConfirm())
							   +Double.parseDouble(twoDay.getConfirm())
							   +Double.parseDouble(threeDay.getConfirm())
							   +Double.parseDouble(fourDay.getConfirm())
							   +Double.parseDouble(fiveDay.getConfirm())
							   +Double.parseDouble(sixDay.getConfirm())
							   +Double.parseDouble(sevenDay.getConfirm()))/7;
		String avgConfirm = String.format("%.0f", dailyAvgConfirm);
		oneDay.setAvgConfirm(avgConfirm);
		twoDay.setAvgConfirm(avgConfirm);
		threeDay.setAvgConfirm(avgConfirm);
		fourDay.setAvgConfirm(avgConfirm);
		fiveDay.setAvgConfirm(avgConfirm);
		sixDay.setAvgConfirm(avgConfirm);
		sevenDay.setAvgConfirm(avgConfirm);
		//////////////////////////////////////////////////////////////////////////////////
		Double wholeDeathDR = Double.parseDouble(wholeDeath);
		Double millionsSeven2 = wholeDeathDR/1000000;
		String sevenMillionDeathStr = String.format("%.2f", millionsSeven2);
		sevenDay.setMillionDeathStr(sevenMillionDeathStr);
		
		Double millionSix2 = (wholeDeathDR- Double.parseDouble(sevenDay.getDeath()))/100000;
		String sixMillionDeathStr = String.format("%.2f", millionSix2);
		sixDay.setMillionDeathStr(sixMillionDeathStr);;
		
		Double millionFive2 = (wholeDeathDR- 
							(Double.parseDouble(sevenDay.getDeath())
							+Double.parseDouble(sixDay.getDeath())
							))/10000;
		String fiveMillionDeathStr = String.format("%.2f", millionFive2);
		fiveDay.setMillionDeathStr(fiveMillionDeathStr);;
		
		Double millionFour2 = (wholeDeathDR- 
							(Double.parseDouble(sevenDay.getDeath())
							+Double.parseDouble(sixDay.getDeath())
							+Double.parseDouble(fiveDay.getDeath())))/100000;
		String fourMillionDeathStr = String.format("%.2f", millionFour2);
		fourDay.setMillionDeathStr(fourMillionDeathStr);
		
		Double millionThree2 = (wholeDeathDR- 
							(Double.parseDouble(sevenDay.getDeath())
							+Double.parseDouble(sixDay.getDeath())
							+Double.parseDouble(fiveDay.getDeath())
							+Double.parseDouble(fourDay.getDeath())))/100000;
		String threeMillionDeathStr = String.format("%.2f", millionThree2);
		threeDay.setMillionDeathStr(threeMillionDeathStr);
		
		Double millionTwo2 = (wholeDeathDR- 
							(Double.parseDouble(sevenDay.getDeath())
							+Double.parseDouble(sixDay.getDeath())
							+Double.parseDouble(fiveDay.getDeath())
							+Double.parseDouble(fourDay.getDeath())
							+Double.parseDouble(threeDay.getDeath())))/100000;
		String twoMillionDeathStr = String.format("%.2f", millionTwo2);
		twoDay.setMillionDeathStr(twoMillionDeathStr);
		
		Double millionOne2 = (wholeDeathDR- 
							(Double.parseDouble(sevenDay.getDeath())
							+Double.parseDouble(sixDay.getDeath())
							+Double.parseDouble(fiveDay.getDeath())
							+Double.parseDouble(fourDay.getDeath())
							+Double.parseDouble(threeDay.getDeath())
							+Double.parseDouble(twoDay.getDeath())))/100000;
		String oneMillionDeathStr = String.format("%.2f", millionOne2);
		oneDay.setMillionDeathStr(oneMillionDeathStr);
		
		Double avgDeathDB = (millionsSeven2 + millionSix2 + millionFive2 
	 			  +millionFour2 +millionThree2 +millionTwo2 +millionOne2)/7;
		String avgMillionDeath = String.format("%.2f", avgDeathDB);
		oneDay.setAvgMillionDeath(avgMillionDeath);
		twoDay.setAvgMillionDeath(avgMillionDeath);
		threeDay.setAvgMillionDeath(avgMillionDeath);
		fourDay.setAvgMillionDeath(avgMillionDeath);
		fiveDay.setAvgMillionDeath(avgMillionDeath);
		sixDay.setAvgMillionDeath(avgMillionDeath);
		sevenDay.setAvgMillionDeath(avgMillionDeath);
		
		
		Double dailyAvgDeath =(Double.parseDouble(oneDay.getDeath())
				   +Double.parseDouble(twoDay.getDeath())
				   +Double.parseDouble(threeDay.getDeath())
				   +Double.parseDouble(fourDay.getDeath())
				   +Double.parseDouble(fiveDay.getDeath())
				   +Double.parseDouble(sixDay.getDeath())
				   +Double.parseDouble(sevenDay.getDeath()))/7;
		String avgDeath = String.format("%.0f", dailyAvgDeath);
		oneDay.setAvgDeath(avgDeath);
		twoDay.setAvgDeath(avgDeath);
		threeDay.setAvgDeath(avgDeath);
		fourDay.setAvgDeath(avgDeath);
		fiveDay.setAvgDeath(avgDeath);
		sixDay.setAvgDeath(avgDeath);
		sevenDay.setAvgDeath(avgDeath);

		return dailyMap;
	}
	
}
