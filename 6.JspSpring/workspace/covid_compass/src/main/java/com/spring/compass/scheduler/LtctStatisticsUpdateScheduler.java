package com.spring.compass.scheduler;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.spring.compass.service.HsptService;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.LtctServiceLKH;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.LtctStatsVO;

public class LtctStatisticsUpdateScheduler {
	
	private LtctServiceLKH ltctServiceLKH;
	private String saveReqDgnssPath ="c:\\ltctStatisticsReqDgnss\\ltctReqDgnss";
	private String saveReqDgnssFileName ="ltctReqDgnssStatistics.log.csv";
	private String saveIsoptntPath ="c:\\ltctStatisticsIsoptnt\\ltctIsoptnt";
	private String saveIsoptntFileName ="ltctIsoptntStatistics.log.csv";
	private SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	

	public LtctServiceLKH getLtctServiceLKH() {
		return ltctServiceLKH;
	}

	public void setLtctServiceLKH(LtctServiceLKH ltctServiceLKH) {
		this.ltctServiceLKH = ltctServiceLKH;
	}

	public String getSaveReqDgnssPath() {
		return saveReqDgnssPath;
	}

	public void setSaveReqDgnssPath(String saveReqDgnssPath) {
		this.saveReqDgnssPath = saveReqDgnssPath;
	}

	public String getSaveReqDgnssFileName() {
		return saveReqDgnssFileName;
	}

	public void setSaveReqDgnssFileName(String saveReqDgnssFileName) {
		this.saveReqDgnssFileName = saveReqDgnssFileName;
	}

	public String getSaveIsoptntPath() {
		return saveIsoptntPath;
	}

	public void setSaveIsoptntPath(String saveIsoptntPath) {
		this.saveIsoptntPath = saveIsoptntPath;
	}

	public String getSaveIsoptntFileName() {
		return saveIsoptntFileName;
	}

	public void setSaveIsoptntFileName(String saveIsoptntFileName) {
		this.saveIsoptntFileName = saveIsoptntFileName;
	}
	
	
	public void updateLtctStats() throws Exception{
		updateDgnssCnt();
		updateIsoptntCnt();
		List<String> ltctNoList = ltctServiceLKH.getLtctNoList();
		updateOutIsoptntCnt(ltctNoList);
		updateTotIsoptntCnt(ltctNoList);
		updateRlsedCnt(ltctNoList);
		
		
		
	}
	
	public void updateDgnssCnt() throws Exception{
		String  filePath = saveReqDgnssPath +File.separator +saveReqDgnssFileName;
		int reqDgnssCnt=0;
		File file = new File(filePath);
		if(file.exists()) {
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			while((line=in.readLine())!=null) {
				LtctStatsVO ltctstats = new LtctStatsVO();
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				ltctstats.setLtctNo(store[0]);
				String dateStr = store[1];
				ltctstats.setStatsYmd(dateStr);
				String ltctStatsNo = ltctServiceLKH.getLtctStatusNo(ltctstats);
				
				if(ltctStatsNo == null) continue;
				
				ltctstats.setLtctStatsNo(ltctStatsNo);
				reqDgnssCnt = getSameLtctNoCnt(saveReqDgnssPath,saveReqDgnssFileName, store[0], store[1]);
				ltctstats.setReqDgnssCnt(reqDgnssCnt);
				ltctServiceLKH.modifyReqDgnssCnt(ltctstats);
				
			}
			
		}
	
	}
	
	public void updateIsoptntCnt() throws Exception{
		String  filePath = saveIsoptntPath +File.separator +saveIsoptntFileName;
		int inIsoptntCnt=0;
		File file = new File(filePath);
		if(file.exists()) {
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			while((line=in.readLine())!=null) {
				LtctStatsVO ltctstats = new LtctStatsVO();
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				ltctstats.setLtctNo(store[0]);
				String dateStr = store[1];
				ltctstats.setStatsYmd(dateStr);
				String ltctStatsNo = ltctServiceLKH.getLtctStatusNo(ltctstats);
				if(ltctStatsNo == null) continue;
				ltctstats.setLtctStatsNo(ltctStatsNo);
				inIsoptntCnt = getSameLtctNoCnt(saveIsoptntPath, saveIsoptntFileName, store[0], store[1]);
				ltctstats.setInIsoptntCnt(inIsoptntCnt);
				ltctServiceLKH.modifyInIsoptntCnt(ltctstats);
				
			}
		}
	}
	
	public void updateOutIsoptntCnt(List<String> ltctNoList) throws Exception{
		for(int i=0; i<ltctNoList.size(); i++) {
			int outIsoptntCnt=0;
			LtctStatsVO ltctStats = new LtctStatsVO();
			String ltctStatsNo = ltctServiceLKH.selectLtctStatusNoByQuery(ltctNoList.get(i));
			outIsoptntCnt = ltctServiceLKH.selectOutIsoptntCnt(ltctNoList.get(i));
			ltctStats.setLtctStatsNo(ltctStatsNo);
			ltctStats.setOutIsoptntCnt(outIsoptntCnt);
			ltctServiceLKH.modifyOutIsoptntCnt(ltctStats);
		}
		
	}
	
	public void updateTotIsoptntCnt(List<String> ltctNoList) throws Exception{
		for(int i=0; i<ltctNoList.size(); i++) {
			int totIsoptntCnt=0;
			LtctStatsVO ltctStats = new LtctStatsVO();
			String ltctStatsNo = ltctServiceLKH.selectLtctStatusNoByQuery(ltctNoList.get(i));
			totIsoptntCnt = ltctServiceLKH.getTotIsoptntCnt(ltctNoList.get(i));
			ltctStats.setLtctStatsNo(ltctStatsNo);
			ltctStats.setTotIsoptntCnt(totIsoptntCnt);
			ltctServiceLKH.modifyTotIsoptntCnt(ltctStats);
		}
		
	}
	
	public void updateRlsedCnt(List<String> ltctNoList) throws Exception{
		for(int i=0; i<ltctNoList.size(); i++) {
			int rlsedCnt=0;
			LtctStatsVO ltctStats = new LtctStatsVO();
			String ltctStatsNo = ltctServiceLKH.selectLtctStatusNoByQuery(ltctNoList.get(i));
			rlsedCnt = ltctServiceLKH.getRlsedCnt(ltctNoList.get(i));
			ltctStats.setLtctStatsNo(ltctStatsNo);
			ltctStats.setRlsedCnt(rlsedCnt);
			ltctServiceLKH.modifyRlsedCnt(ltctStats);
		}
		
	}
	
	
	/*public String getStatsNo(String ltctNo)throws Exception{
		String statsNo = null;
		Date sysDate = new Date();
		LtctStatsVO ltctStats = new LtctStatsVO();
		String sysDateStr = fmt.format(sysDate);
		String filePath1 = saveReqDgnssPath +File.separator +saveReqDgnssFileName;
		File file = new File(filePath1);
		if(file.exists()) {
			BufferedReader in = new BufferedReader(new FileReader(file));
			String line="";
			while((line=in.readLine())!=null) {
				int num = line.indexOf("]");
				String trans = line.substring(num+1, line.length());
				String[] store = trans.split(",");
				String chkltctNo = store[0];
				ltctStats.setLtctNo(chkltctNo);
				String chkdateStr = store[1];
				ltctStats.setStatsYmd(chkdateStr);
				if(chkdateStr.equals(ltctStats.getStatsYmd()) && chkltctNo.equals(ltctNo)) {
					statsNo = ltctServiceLKH.getLtctStatusNo(ltctStats);
				}
			}
		}
		if(statsNo == null) {
			String filePath2 = saveIsoptntPath +File.separator +saveIsoptntFileName;
			File file2 = new File(filePath2);
			
			BufferedReader in2 = new BufferedReader(new FileReader(file2));
			String line2="";
			while((line2=in2.readLine())!=null) {
				int num = line2.indexOf("]");
				String trans = line2.substring(num+1, line2.length());
				String[] store = trans.split(",");
				String chkltctNo = store[0];
				ltctStats.setLtctNo(chkltctNo);
				String chkdateStr = store[1];
				ltctStats.setStatsYmd(chkdateStr);
				if(chkdateStr.equals(ltctStats.getStatsYmd())) {
					statsNo = ltctServiceLKH.getLtctStatusNo(ltctStats);
				}
			}
		}
		
		return statsNo;
	}*/
	
	public int getSameLtctNoCnt(String savePath, String fileName, String ltctNo, String dateStr) throws IOException{
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
			
			if(ltctNo.equals(chkhsptNo)&&dateStr.equals(chkdateStr)) {
				count++;
			}
			
		}
		
		return count;
	}
	
}
