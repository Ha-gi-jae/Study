package com.spring.compass.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.service.PstiServiceLKH;
import com.spring.compass.vo.PstiVO;

public class MakeStatisticsLogByPbht {
	
	private static MakeStatisticsLogByPbht makeStatisticsPbht;
	
	private PstiServiceLKH pstiServiceLKH;
	
	public void setPstiServiceLKH(PstiServiceLKH pstiServiceLKH) {
		this.pstiServiceLKH = pstiServiceLKH;
	}
	
	
	private MakeStatisticsLogByPbht() {};
	
	public static MakeStatisticsLogByPbht getInstance() {
		if(makeStatisticsPbht == null) makeStatisticsPbht = new MakeStatisticsLogByPbht();
		
		return makeStatisticsPbht;
	}
	
	//검사횟수로그
	private String savePbhtSmpleCntPath ="c:\\pbhtStatisticsInspSmpleCnt\\pbhtInspSmpleCnt";
	private String savePbhtSmpleCntFileName ="pbhtInspSmpleCntStatistics.log.csv";
	
	//양성수성별로그
	private String savePstvGenderPath ="c:\\pbhtStatisticsPstvGender\\pbhtPstvGender";
	private String savePstvGenderName="pbhtPstvGenderStatistics.log.csv";
	
	//음성수성별로그
	private String saveNgtvGenderPath ="c:\\pbhtStatisticsNgtvGender\\pbhtNgtvGender";
	private String saveNgtvGenderName="pbhtNgtvGenderStatistics.log.csv";
	
	//양성수나이로그
	private String savePstvAgePath="c:\\pbhtStatisticsPstvAge\\pbhtPstvAge";
	private String savePstvAgeFileName="pbhtPstvAgeStatistics.log.csv";
	
	//음성수나이로그
	private String saveNgtvAgePath="c:\\pbhtStatisticsNgtvAge\\pbhtNgtvAge";
	private String saveNgtvAgeFileName="pbhtNgtvAgeStatistics.log.csv";
	
	
	
	
	
	

	public void setSavePbhtSmpleCntPath(String savePbhtSmpleCntPath) {
		this.savePbhtSmpleCntPath = savePbhtSmpleCntPath;
	}


	public void setSavePbhtSmpleCntFileName(String savePbhtSmpleCntFileName) {
		this.savePbhtSmpleCntFileName = savePbhtSmpleCntFileName;
	}


	public void setSavePstvGenderPath(String savePstvGenderPath) {
		this.savePstvGenderPath = savePstvGenderPath;
	}

	public void setSavePstvGenderName(String savePstvGenderName) {
		this.savePstvGenderName = savePstvGenderName;
	}

	public void setSaveNgtvGenderPath(String saveNgtvGenderPath) {
		this.saveNgtvGenderPath = saveNgtvGenderPath;
	}

	public void setSaveNgtvGenderName(String saveNgtvGenderName) {
		this.saveNgtvGenderName = saveNgtvGenderName;
	}

	public void setSavePstvAgePath(String savePstvAgePath) {
		this.savePstvAgePath = savePstvAgePath;
	}

	public void setSavePstvAgeFileName(String savePstvAgeFileName) {
		this.savePstvAgeFileName = savePstvAgeFileName;
	}

	public void setSaveNgtvAgePath(String saveNgtvAgePath) {
		this.saveNgtvAgePath = saveNgtvAgePath;
	}

	public void setSaveNgtvAgeFileName(String saveNgtvAgeFileName) {
		this.saveNgtvAgeFileName = saveNgtvAgeFileName;
	}

	//검사횟수로그
	public void makePbhtStatisticsSmpleCnt(String pbhtNo) throws IOException{
		
		File file = new File(savePbhtSmpleCntPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[pbhtStatistics:SmpleCnt]";
		String log = tag+pbhtNo+","+statiLogTime;
		
		String logFilePath = savePbhtSmpleCntPath +File.separator + savePbhtSmpleCntFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	//양성수성별로그
	public void makePbhtStatisticsPstvGender(String manageNo, String pbhtNo) throws Exception{
		if(pstiServiceLKH == null) System.out.println("강건");
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		
		String gender = psti.getGender();
		
		File file = new File(savePstvGenderPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[pbhtStatistics:PstvGender]";
		String log = tag+pbhtNo+","+gender+","+statiLogTime;
		
		String logFilePath = savePstvGenderPath +File.separator + savePstvGenderName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
	
	//음성수성별로그
	public void makePbhtStatisticsNgtvGender(String manageNo, String pbhtNo) throws Exception{
		if(pstiServiceLKH == null) System.out.println("강건");
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		String gender = psti.getGender();
		File file = new File(saveNgtvGenderPath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[pbhtStatistics:NgtvGender]";
		String log = tag+pbhtNo+","+gender+","+statiLogTime;
		
		String logFilePath = saveNgtvGenderPath +File.separator + saveNgtvGenderName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
		
		//양성수나이로그
		public void makePbhtStatisticsPstvAge(String manageNo, String pbhtNo) throws Exception{
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		String age = psti.getAge();
		
		File file = new File(savePstvAgePath);
		
		if(!file.exists()) file.mkdirs();
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String statiLogTime = fmt.format(logTime);
		
		String tag ="[pbhtStatistics:PstvAge]";
		String log = tag+pbhtNo+","+age+","+statiLogTime;
		
		String logFilePath = savePstvAgePath +File.separator + savePstvAgeFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		out.write(log);
		out.newLine();
		out.close();
		
	}
		//음성수나이로그
		public void makePbhtStatisticsNgtvAge(String manageNo, String pbhtNo) throws Exception{
			VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
			String age = psti.getAge();
			File file = new File(saveNgtvAgePath);
			
			if(!file.exists()) file.mkdirs();
			Date logTime = new Date();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			String statiLogTime = fmt.format(logTime);
			
			String tag ="[pbhtStatistics:NgtvAge]";
			String log = tag+pbhtNo+","+age+","+statiLogTime;
			
			String logFilePath = saveNgtvAgePath +File.separator + saveNgtvAgeFileName;
			
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
			
			out.write(log);
			out.newLine();
			out.close();
			
		}
	
	
	
	
}
