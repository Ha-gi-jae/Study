package com.spring.compass.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MakerStatisticsLogByInsp {
	
	private static MakerStatisticsLogByInsp makestatisticsInsp;
	
	private MakerStatisticsLogByInsp(){};
	
	public static MakerStatisticsLogByInsp getMakerStatisticsLogByInspInstance() {
		if(makestatisticsInsp == null) {
			makestatisticsInsp = new MakerStatisticsLogByInsp();
		}
		
		return makestatisticsInsp;
	}
	
	private String savePath="c:\\inspstatistics\\inspstatistics";
	private String saveFileName="inspstats.log.csv";
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	
	
	public void makeInspStatisticsLog(String inspNo) throws IOException{
		File file = new File(savePath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[statistics:insp]";
		String log = tag+inspNo+","
						+statiLogTime;
		
		
		
		String logFilePath = savePath+ File.separator + saveFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	
	
	
	
	
	
}
