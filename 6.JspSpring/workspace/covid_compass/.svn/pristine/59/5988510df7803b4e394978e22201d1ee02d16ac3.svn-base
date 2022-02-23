package com.spring.compass.scheduler;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.spring.compass.service.InspService;
import com.spring.compass.vo.InspStatsVO;

public class InspStatisticsUpdateScheduler {
	
	private InspService inspService;
	private String savePath;
	private String fileName;
	
	
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public void setInspService(InspService inspService) {
		this.inspService = inspService;
	}
	
	
	
	public void updateInspStatistics() throws Exception{
		
		String  filePath = savePath +File.separator +fileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			InspStatsVO inspstats = new InspStatsVO();
			int num = line.indexOf("]");
			String trans = line.substring(num+1, line.length());
			String[] store = trans.split(",");
			inspstats.setInspNo(store[0]);
			String dateStr = store[1];
			inspstats.setStatsYmd(dateStr);
			
			String inspStatsNo = inspService.getInspStatsNo(inspstats);
			if(inspStatsNo == null) continue;
			inspstats.setInspstatsNo(inspStatsNo);
			
			int reqSmpleCnt = getReqSmpleCnt(store[0], dateStr);
			
			inspstats.setReqSmpleCnt(reqSmpleCnt);
			
			
			inspService.modifyInspStats(inspstats);
			
		}
		
		
		
	}
	
	private int getReqSmpleCnt(String inspNo, String dateStr)  throws IOException{
		int count =0;
			
		String  filePath = savePath +File.separator +fileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		
		while((line=in.readLine())!=null) {
			int num = line.indexOf("]");
			String trans = line.substring(num+1, line.length());
			String[] store = trans.split(",");
			String chkinspNo = store[0];
			String chkdateStr = store[1];
			
			if(inspNo.equals(chkinspNo)&&dateStr.equals(chkdateStr)) {
				count++;
			}
			
		}
		
		return count;
	}
	
	
	
}
