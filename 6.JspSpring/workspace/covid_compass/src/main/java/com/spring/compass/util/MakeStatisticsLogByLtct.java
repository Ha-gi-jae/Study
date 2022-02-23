package com.spring.compass.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MakeStatisticsLogByLtct {
	
	private static MakeStatisticsLogByLtct makeStatisticsLtct;
	
	private MakeStatisticsLogByLtct() {};
	
	public static MakeStatisticsLogByLtct getInstance() {
		if(makeStatisticsLtct == null) makeStatisticsLtct = new MakeStatisticsLogByLtct();
		
		return makeStatisticsLtct;
	}
	
	private String saveReqDgnssPath ="c:\\ltctStatisticsReqDgnss\\ltctReqDgnss";
	private String saveReqDgnssFileName ="ltctReqDgnssStatistics.log.csv";
	private String saveIsoptntPath ="c:\\ltctStatisticsIsoptnt\\ltctIsoptnt";
	private String saveIsoptntFileName ="ltctIsoptntStatistics.log.csv";
	private String saveRlsedPath ="c:\\ltctStatisticsRlsed\\ltctRlsed";
	private String saveRlsedFileName ="ltctRlsedStatistics.log.csv";
	private String saveOutptntPath ="c:\\ltctStatisticsOutptnt\\ltctOutptnt";
	private String saveOutptntFileName ="ltctOutptntStatistics.log.csv";

	public static void setMakeStatisticsLtct(MakeStatisticsLogByLtct makeStatisticsLtct) {
		MakeStatisticsLogByLtct.makeStatisticsLtct = makeStatisticsLtct;
	}

	public void setSaveReqDgnssPath(String saveReqDgnssPath) {
		this.saveReqDgnssPath = saveReqDgnssPath;
	}

	public void setSaveReqDgnssFileName(String saveReqDgnssFileName) {
		this.saveReqDgnssFileName = saveReqDgnssFileName;
	}

	public void setSaveIsoptntPath(String saveIsoptntPath) {
		this.saveIsoptntPath = saveIsoptntPath;
	}

	public void setSaveIsoptntFileName(String saveIsoptntFileName) {
		this.saveIsoptntFileName = saveIsoptntFileName;
	}

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

	// 요청 진료수로그
	public void makeLtctStatisticsReqDgnss(String ltctNo) throws IOException{
		
		File file = new File(saveReqDgnssPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[ltctStatistics:ReqDgnss]";
		String log = tag+ltctNo+","+statiLogTime;
		
		String logFilePath = saveReqDgnssPath +File.separator + saveReqDgnssFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	// 금일 입소인원수 로그
	public void makeLtctStatisticsIsoptnt(String ltctNo) throws IOException{
		
		File file = new File(saveIsoptntPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[ltctStatistics:Isoptnt]";
		String log = tag+ltctNo+","+statiLogTime;
		
		String logFilePath = saveIsoptntPath +File.separator + saveIsoptntFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	// 금일 퇴원(완치) 로그
	public void makeLtctStatisticsRlsed(String ltctNo) throws IOException{
		
		File file = new File(saveRlsedPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[ltctStatistics:Rlsed]";
		String log = tag+ltctNo+","+statiLogTime;
		
		String logFilePath = saveRlsedPath +File.separator + saveRlsedFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}

	// 금일 퇴원(이원) 로그
	public void makeLtctStatisticsOutptnt(String ltctNo) throws IOException{
		
		File file = new File(saveOutptntPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[ltctStatistics:Outptnt]";
		String log = tag+ltctNo+","+statiLogTime;
		
		String logFilePath = saveOutptntPath +File.separator + saveOutptntFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	
}
