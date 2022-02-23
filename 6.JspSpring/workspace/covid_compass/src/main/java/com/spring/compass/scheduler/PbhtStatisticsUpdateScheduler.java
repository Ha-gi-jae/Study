package com.spring.compass.scheduler;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.spring.compass.service.HsptService;
import com.spring.compass.service.PbhtService;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.InspStatsVO;
import com.spring.compass.vo.PbhtStatsVO;

public class PbhtStatisticsUpdateScheduler {
	
		private PbhtService pbhtService;
	
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
	

		public void setPbhtService(PbhtService pbhtService) {
			this.pbhtService = pbhtService;
		}

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
		
		
	public void updatePbhtStatistics() throws Exception{
		String  filePath = savePbhtSmpleCntPath +File.separator +savePbhtSmpleCntFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			PbhtStatsVO pbhtStats = new PbhtStatsVO();
			int num = line.indexOf("]");
			String trans = line.substring(num+1, line.length());
			String[] store = trans.split(",");
			pbhtStats.setPbhtNo(store[0]);
			String dateStr = store[1];
			pbhtStats.setStatsYmd(dateStr);
			
			String pbhtstatsNo = pbhtService.getPbhtStatsNo(pbhtStats);
			
			if(pbhtstatsNo == null) continue;
			
			pbhtStats.setPbhtstatsNo(pbhtstatsNo);
			
			int inspSmpleCnt = getSamePbhtNoCnt(savePbhtSmpleCntPath, 
												savePbhtSmpleCntFileName, 
												pbhtStats.getPbhtNo(), 
												pbhtStats.getStatsYmd());
			pbhtStats.setInspSmpleCnt(inspSmpleCnt);
			
			Map<String, Integer> pstvGenderMap = getPstvGendercnt(pbhtStats.getPbhtNo(), pbhtStats.getStatsYmd());
			
			int pstvMcnt = pstvGenderMap.get("male");
			int pstvFcnt = pstvGenderMap.get("feMale");
			int pstvCnt = pstvMcnt+pstvFcnt;
			
			pbhtStats.setPstvCnt(pstvCnt);
			pbhtStats.setPstvMcnt(pstvMcnt);
			pbhtStats.setPstvFcnt(pstvFcnt);
			
			Map<String, Integer> ngtvGenderMap = getNgtvGendercnt(pbhtStats.getPbhtNo(), pbhtStats.getStatsYmd());
			
			int ngtvMcnt = ngtvGenderMap.get("male");
			int ngtvFcnt = ngtvGenderMap.get("feMale");
			int ngtvCnt = ngtvMcnt+ngtvFcnt;
			
			pbhtStats.setNgtvCnt(ngtvCnt);
			pbhtStats.setNgtvMcnt(ngtvMcnt);
			pbhtStats.setNgtvFcnt(ngtvFcnt);
			
			Map<String, Integer> pstvAgeMap = getPstvAgecnt(pbhtStats.getPbhtNo(), pbhtStats.getStatsYmd());
			
			pbhtStats.setPstv00cnt(pstvAgeMap.get("teenagerYounger"));
			pbhtStats.setPstv10cnt(pstvAgeMap.get("teenager"));
			pbhtStats.setPstv20cnt(pstvAgeMap.get("twenty"));
			pbhtStats.setPstv30cnt(pstvAgeMap.get("thirty"));
			pbhtStats.setPstv40cnt(pstvAgeMap.get("forty"));
			pbhtStats.setPstv50cnt(pstvAgeMap.get("fifty"));
			pbhtStats.setPstv60cnt(pstvAgeMap.get("sixty"));
			pbhtStats.setPstv70cnt(pstvAgeMap.get("seventy"));
			pbhtStats.setPstv80cnt(pstvAgeMap.get("eighty"));
			
			Map<String, Integer> ngtvAgeMap = getNgtvAgecnt(pbhtStats.getPbhtNo(), pbhtStats.getStatsYmd());
			
			pbhtStats.setNgtv00cnt(ngtvAgeMap.get("teenagerYounger"));
			pbhtStats.setNgtv10cnt(ngtvAgeMap.get("teenager"));
			pbhtStats.setNgtv20cnt(ngtvAgeMap.get("twenty"));
			pbhtStats.setNgtv30cnt(ngtvAgeMap.get("thirty"));
			pbhtStats.setNgtv40cnt(ngtvAgeMap.get("forty"));
			pbhtStats.setNgtv50cnt(ngtvAgeMap.get("fifty"));
			pbhtStats.setNgtv60cnt(ngtvAgeMap.get("sixty"));
			pbhtStats.setNgtv70cnt(ngtvAgeMap.get("seventy"));
			pbhtStats.setNgtv80cnt(ngtvAgeMap.get("eighty"));
			
			pbhtService.modifyPbhtStats(pbhtStats);
		}
		
		
	}
		
		private Map<String, Integer> getNgtvAgecnt(String pbhtNo, String statsYmd) throws IOException{
		Map<String, Integer> ngtvAgeMap = new HashMap<String, Integer>();
		String savePath=saveNgtvAgePath;
		String fileName=saveNgtvAgeFileName;
		String filePath = savePath + File.separator +fileName;
		int teenagerYounger =0;
		int teenager =0;
		int twenty =0;
		int thirty =0;
		int forty =0;
		int fifty =0;
		int sixty =0;
		int seventy =0;
		int eighty =0;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		
		while((line=in.readLine())!=null) {
			int num = line.indexOf("]");
			String trans = line.substring(num+1, line.length());
			String[] store = trans.split(",");
			String chkPbhtNo = store[0];
			String chkAge =store[1];
			String chkAgefmt = chkAge.substring(0, 1);
			String chkStatsYmd = store[2];
			
			if(chkPbhtNo.equals(pbhtNo) && chkAge.length()==1 && chkStatsYmd.equals(statsYmd)) teenagerYounger ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("1") && chkStatsYmd.equals(statsYmd)) teenager ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("2") && chkStatsYmd.equals(statsYmd)) twenty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("3") && chkStatsYmd.equals(statsYmd)) thirty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("4") && chkStatsYmd.equals(statsYmd)) forty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("5") && chkStatsYmd.equals(statsYmd)) fifty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("6") && chkStatsYmd.equals(statsYmd)) sixty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("7") && chkStatsYmd.equals(statsYmd)) seventy ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("8") && chkStatsYmd.equals(statsYmd)) eighty ++;
			if(chkPbhtNo.equals(pbhtNo) && chkAge.length()==3 && chkStatsYmd.equals(statsYmd)) eighty ++;
		}
		
		ngtvAgeMap.put("teenagerYounger", teenagerYounger);
		ngtvAgeMap.put("teenager", teenager);
		ngtvAgeMap.put("twenty", twenty);
		ngtvAgeMap.put("thirty", thirty);
		ngtvAgeMap.put("forty", forty);
		ngtvAgeMap.put("fifty", fifty);
		ngtvAgeMap.put("sixty", sixty);
		ngtvAgeMap.put("seventy", seventy);
		ngtvAgeMap.put("eighty", eighty);
		
		return ngtvAgeMap;
	}
	
	
		private Map<String, Integer> getPstvAgecnt(String pbhtNo, String statsYmd) throws IOException{
			Map<String, Integer> pstvAgeMap = new HashMap<String, Integer>();
			String savePath=savePstvAgePath;
			String fileName=savePstvAgeFileName;
			String filePath = savePath + File.separator +fileName;
			int teenagerYounger =0;
			int teenager =0;
			int twenty =0;
			int thirty =0;
			int forty =0;
			int fifty =0;
			int sixty =0;
			int seventy =0;
			int eighty =0;
			
			File file = new File(filePath);
			
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			
			while((line=in.readLine())!=null) {
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				String chkPbhtNo = store[0];
				String chkAge =store[1];
				String chkAgefmt = chkAge.substring(0, 1);
				String chkStatsYmd = store[2];
				
				if(chkPbhtNo.equals(pbhtNo) && chkAge.length()==1 && chkStatsYmd.equals(statsYmd)) teenagerYounger ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("1") && chkStatsYmd.equals(statsYmd)) teenager ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("2") && chkStatsYmd.equals(statsYmd)) twenty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("3") && chkStatsYmd.equals(statsYmd)) thirty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("4") && chkStatsYmd.equals(statsYmd)) forty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("5") && chkStatsYmd.equals(statsYmd)) fifty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("6") && chkStatsYmd.equals(statsYmd)) sixty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("7") && chkStatsYmd.equals(statsYmd)) seventy ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAgefmt.equals("8") && chkStatsYmd.equals(statsYmd)) eighty ++;
				if(chkPbhtNo.equals(pbhtNo) && chkAge.length()==3 && chkStatsYmd.equals(statsYmd)) eighty ++;
			}
			
			pstvAgeMap.put("teenagerYounger", teenagerYounger);
			pstvAgeMap.put("teenager", teenager);
			pstvAgeMap.put("twenty", twenty);
			pstvAgeMap.put("thirty", thirty);
			pstvAgeMap.put("forty", forty);
			pstvAgeMap.put("fifty", fifty);
			pstvAgeMap.put("sixty", sixty);
			pstvAgeMap.put("seventy", seventy);
			pstvAgeMap.put("eighty", eighty);
			
			return pstvAgeMap;
		}
		
		private Map<String,Integer> getNgtvGendercnt(String pbhtNo, String statsYmd) throws IOException{
			Map<String, Integer> ngtvGenderMap = new HashMap<String, Integer>();
			int maleCount =0;
			int feMaleCount=0;
			String savePath=saveNgtvGenderPath;
			String fileName=saveNgtvGenderName;
			
			String filePath = savePath+File.separator+fileName;
			
			File file = new File(filePath);
			
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			
			while((line=in.readLine())!=null) {
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				String chkhsptNo = store[0];
				String chkGender = store[1];
				String chkDate = store[2];
				
				if(chkGender.equals("M")&&chkhsptNo.equals(pbhtNo)&&chkDate.equals(statsYmd))maleCount ++;
				if(chkGender.equals("F")&&chkhsptNo.equals(pbhtNo)&&chkDate.equals(statsYmd))feMaleCount ++;
				
			}
			ngtvGenderMap.put("male", maleCount);
			ngtvGenderMap.put("feMale", feMaleCount);
			
			return ngtvGenderMap;
	}

	
	
		private Map<String,Integer> getPstvGendercnt(String pbhtNo, String statsYmd) throws IOException{
			Map<String, Integer> pstvGenderMap = new HashMap<String, Integer>();
			int maleCount =0;
			int feMaleCount=0;
			String savePath=savePstvGenderPath;
			String fileName=savePstvGenderName;
			
			String filePath = savePath+File.separator+fileName;
			
			File file = new File(filePath);
			
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			
			while((line=in.readLine())!=null) {
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				String chkhsptNo = store[0];
				String chkGender = store[1];
				String chkDate = store[2];
				
				if(chkGender.equals("M")&&chkhsptNo.equals(pbhtNo)&&chkDate.equals(statsYmd))maleCount ++;
				if(chkGender.equals("F")&&chkhsptNo.equals(pbhtNo)&&chkDate.equals(statsYmd))feMaleCount ++;
				
			}
			pstvGenderMap.put("male", maleCount);
			pstvGenderMap.put("feMale", feMaleCount);
			
			return pstvGenderMap;
		}
	
		private int getSamePbhtNoCnt(String savePath, String fileName, String pbhtNo, String dateStr)  throws IOException{
		int count =0;
			
		String  filePath = savePath +File.separator +fileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		
		while((line=in.readLine())!=null) {
			int num = line.indexOf("]");
			String trans = line.substring(num+1, line.length());
			String[] store = trans.split(",");
			String chkhsptNo = store[0];
			String chkdateStr = store[1];
			
			if(pbhtNo.equals(chkhsptNo)&&dateStr.equals(chkdateStr)) {
				count++;
			}
			
		}
		
		return count;
	}
	
	
	
}
