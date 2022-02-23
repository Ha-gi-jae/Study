package com.spring.compass.util;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import com.spring.compass.vo.DailyCovidVO;

public class MakeComma {
	
	public static Map<String, String> makeCommaDailyCovidVO(Map<String, DailyCovidVO> dailyCovidMap){
		NumberFormat numberformat = NumberFormat.getInstance();
		Map<String, String> commaDailyCovidMap = new HashMap<String, String>();
		
		String onedayConfirm = dailyCovidMap.get("oneDay").getConfirm();
		String commaOnedayConfirm = numberformat.format(Double.parseDouble(onedayConfirm));
		commaDailyCovidMap.put("commaOnedayConfirm", commaOnedayConfirm);
		
		String twodayConfirm = dailyCovidMap.get("twoDay").getConfirm();
		String commaTwodayConfirm = numberformat.format(Double.parseDouble(twodayConfirm));
		commaDailyCovidMap.put("commaTwodayConfirm", commaTwodayConfirm);
		
		
		String threedayConfirm = dailyCovidMap.get("threeDay").getConfirm();
		String commaThreedayConfirm = numberformat.format(Double.parseDouble(threedayConfirm));
		commaDailyCovidMap.put("commaThreedayConfirm", commaThreedayConfirm);
		
		String fourdayConfirm = dailyCovidMap.get("fourDay").getConfirm();
		String commaFourdayConfirm = numberformat.format(Double.parseDouble(fourdayConfirm));
		commaDailyCovidMap.put("commaFourdayConfirm", commaFourdayConfirm);
		
		String fivedayConfirm = dailyCovidMap.get("fiveDay").getConfirm();
		String commaFivedayConfirm = numberformat.format(Double.parseDouble(fivedayConfirm));
		commaDailyCovidMap.put("commaFivedayConfirm", commaFivedayConfirm);
		
		String sixdayConfirm = dailyCovidMap.get("sixDay").getConfirm();
		String commaSixdayConfirm = numberformat.format(Double.parseDouble(sixdayConfirm));
		commaDailyCovidMap.put("commaSixdayConfirm", commaSixdayConfirm);
		
		String sevendayConfirm = dailyCovidMap.get("sevenDay").getConfirm();
		String commaSevendayConfirm = numberformat.format(Double.parseDouble(sevendayConfirm));
		commaDailyCovidMap.put("commaSevendayConfirm", commaSevendayConfirm);
		
		String avgConfirm = dailyCovidMap.get("oneDay").getAvgConfirm();
		String commaAvgConfirm = numberformat.format(Double.parseDouble(avgConfirm));
		commaDailyCovidMap.put("commaAvgConfirm", commaAvgConfirm);
		
		return commaDailyCovidMap;
	}
	
}
