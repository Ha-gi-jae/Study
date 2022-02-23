package com.spring.compass.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MakeStatisticsLogByHspt {
	
	private static MakeStatisticsLogByHspt makeStatisticsHspt;
	
	private MakeStatisticsLogByHspt() {};
	
	public static MakeStatisticsLogByHspt getInstance() {
		if(makeStatisticsHspt == null) makeStatisticsHspt = new MakeStatisticsLogByHspt();
		
		return makeStatisticsHspt;
	}
	
	private String saveDgnssPath ="c:\\hsptStatisticsDgnss\\hsptDgnss";
	private String saveDgnssFileName ="hsptDgnssStatistics.log.csv";
	private String saveReqSckbdPath ="c:\\hsptStatisticsReqSckbd\\hsptReqSckbd";
	private String saveReqSckbdFileName="hsptReqSckbdStatistics.log.csv";
	private String saveInptntPath="c:\\hsptStatisticsInptnt\\hsptInptnt";
	private String saveInptntFileName="hsptInptntStatistics.log.csv";
	private String saveGoLtctPath="c:\\hsptStatisticsGoltct\\hsptGoltct";
	private String saveGoLtctFileName="hsptGoltctStatistics.log.csv";
	private String saveGoSelfPath ="c:\\hsptStatisticsGoSelf\\hsptGoself";
	private String saveGoSelfFileName="hsptGoSelfStatistics.log.csv";
	private String saveDeathPath ="c:\\hsptStatisticsDeath\\hsptDeath";
	private String saveDeathFileName="hsptDeathStatistics.log.csv";
	private String saveOutptntPath ="c:\\hsptStatisticsOutptnt\\hsptOutptnt";
	private String saveOutptntFileName="hsptOutptntStatistics.log.csv";
	private String saveRlsedPath ="c:\\hsptStatisticsRlsed\\hsptRlsed";
	private String saveRlsedFileName="hsptRlsedStatistics.log.csv";
	
	public void setSaveRlsedPath(String saveRlsedPath) {
		this.saveRlsedPath = saveRlsedPath;
	}

	public void setSaveRlsedFileName(String saveRlsedFileName) {
		this.saveRlsedFileName = saveRlsedFileName;
	}

	public void setSaveOutptntPath(String saveOutptntPath) {
		this.saveOutptntPath = saveOutptntPath;
	}
	
	public void setSaveOutptntFileName(String saveOutptntFileName) {
		this.saveOutptntFileName = saveOutptntFileName;
	}
	
	public void setSaveDeathPath(String saveDeathPath) {
		this.saveDeathPath = saveDeathPath;
	}

	public void setSaveDeathFileName(String saveDeathFileName) {
		this.saveDeathFileName = saveDeathFileName;
	}

	
	public void setSaveDgnssPath(String saveDgnssPath) {
		this.saveDgnssPath = saveDgnssPath;
	}

	public void setSaveDgnssFileName(String saveDgnssFileName) {
		this.saveDgnssFileName = saveDgnssFileName;
	}
	
	public void setSaveReqSckbdPath(String saveReqSckbdPath) {
		this.saveReqSckbdPath = saveReqSckbdPath;
	}

	public void setSaveReqSckbdFileName(String saveReqSckbdFileName) {
		this.saveReqSckbdFileName = saveReqSckbdFileName;
	}
	

	public void setSaveInptntPath(String saveInptntPath) {
		this.saveInptntPath = saveInptntPath;
	}

	public void setSaveInptntFileName(String saveInptntFileName) {
		this.saveInptntFileName = saveInptntFileName;
	}
	
	
	public void setSaveGoLtctPath(String saveGoLtctPath) {
		this.saveGoLtctPath = saveGoLtctPath;
	}

	public void setSaveGoLtctFileName(String saveGoLtctFileName) {
		this.saveGoLtctFileName = saveGoLtctFileName;
	}
	
	
	
	public void setSaveGoSelfPath(String saveGoSelfPath) {
		this.saveGoSelfPath = saveGoSelfPath;
	}

	public void setSaveGoSelfFileName(String saveGoSelfFileName) {
		this.saveGoSelfFileName = saveGoSelfFileName;
	}
	
	//진료수로그
	public void makeHsptStatisticsDgnss(String hsptNo) throws IOException{
		
		File file = new File(saveDgnssPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[hsptStatistics:dgnss]";
		String log = tag+hsptNo+","+statiLogTime;
		
		String logFilePath = saveDgnssPath +File.separator + saveDgnssFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	//외부 병상신청수 로그
	public void makeHsptStatisticsReqSckbd(String hsptNo) throws IOException{
		
		File file = new File(saveReqSckbdPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[hsptStatistics:ReqSckbd]";
		String log = tag+hsptNo+","+statiLogTime;
		
		String logFilePath = saveReqSckbdPath +File.separator + saveReqSckbdFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	//금일입원자수
	public void makeHsptStatisticsInptnt(String hsptNo) throws IOException{
		
		File file = new File(saveInptntPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[hsptStatistics:Inptnt]";
		String log = tag+hsptNo+","+statiLogTime;
		
		String logFilePath = saveInptntPath +File.separator + saveInptntFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
		
		//생활치료센터 신청수
		public void makeHsptStatisticsGoLtct(String hsptNo) throws IOException{
		
		File file = new File(saveGoLtctPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[hsptStatistics:GoLtct]";
		String log = tag+hsptNo+","+statiLogTime;
		
		String logFilePath = saveGoLtctPath +File.separator + saveGoLtctFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
		//자거 격리수
		public void makeHsptStatisticsGoSelf(String hsptNo) throws IOException{
			
			File file = new File(saveGoSelfPath);
			
			if(!file.exists()) file.mkdirs();
			Date logTime = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String statiLogTime = fmt.format(logTime);
			
			String tag ="[hsptStatistics:GoSelf]";
			String log = tag+hsptNo+","+statiLogTime;
			
			String logFilePath = saveGoSelfPath +File.separator + saveGoSelfFileName;
			
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			out.close();
			
		}

		// 퇴원(사망) 로그
		public void makeHsptStatisticsDeath(String hsptNo) throws IOException{
			File file = new File(saveDeathPath);
			
			if(!file.exists()) file.mkdirs();
			Date logTime = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String statiLogTime = fmt.format(logTime);
			
			String tag ="[hsptStatistics:Death]";
			String log = tag+hsptNo+","+statiLogTime;
			
			String logFilePath = saveDeathPath +File.separator + saveDeathFileName;
			
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			out.close();
		}
		
		// 퇴원(이원) 로그
		public void makeHsptStatisticsOutptnt(String hsptNo) throws IOException{
			File file = new File(saveOutptntPath);
			
			if(!file.exists()) file.mkdirs();
			Date logTime = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String statiLogTime = fmt.format(logTime);
			
			String tag ="[hsptStatistics:Outptnt]";
			String log = tag+hsptNo+","+statiLogTime;
			
			String logFilePath = saveOutptntPath +File.separator + saveOutptntFileName;
			
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			out.close();
		}

		// 퇴원(완치) 로그
		public void makeHsptStatisticsRlsed(String hsptNo) throws IOException{
			File file = new File(saveRlsedPath);
			
			if(!file.exists()) file.mkdirs();
			Date logTime = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String statiLogTime = fmt.format(logTime);
			
			String tag ="[hsptStatistics:Rlsed]";
			String log = tag+hsptNo+","+statiLogTime;
			
			String logFilePath = saveRlsedPath +File.separator + saveRlsedFileName;
			
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			out.close();
		}
	
	
	
	
}
