package com.spring.compass.scheduler;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.compass.controller.CommonController;
import com.spring.compass.service.HsptService;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntstatsVO;

public class HsptStatisticsUpdateScheduler implements Serializable{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(HsptStatisticsUpdateScheduler.class);
	
	private HsptService hsptService;

	
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	public void setSaveDeathPath(String saveDeathPath) {
		this.saveDeathPath = saveDeathPath;
	}

	public void setSaveDeathFileName(String saveDeathFileName) {
		this.saveDeathFileName = saveDeathFileName;
	}

	public void setSaveOutptntPath(String saveOutptntPath) {
		this.saveOutptntPath = saveOutptntPath;
	}

	public void setSaveOutptntFileName(String saveOutptntFileName) {
		this.saveOutptntFileName = saveOutptntFileName;
	}

	public void setSaveRlsedPath(String saveRlsedPath) {
		this.saveRlsedPath = saveRlsedPath;
	}

	public void setSaveRlsedFileName(String saveRlsedFileName) {
		this.saveRlsedFileName = saveRlsedFileName;
	}
	
	public void setHsptService(HsptService hsptService) {
		this.hsptService = hsptService;
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
	
	// 통계 업데이트
	// 로그를 이용한 통계는 로그에 담긴 모든 기간
	// 로그에 없는 통게는 오늘에 해당하는 통계 업데이트
	public void updateHsptStatistics() throws Exception{
		
		// 로그를 이용한 업데이트 처리
		updateHsptStatisticsDgnssCnt();
		updateHsptStatisticsReqSckbdCnt();
		updateHsptStatisticsInptntCnt();
		updateHsptStatisticsGoLtctCnt();
		updateHsptStatisticsGoSelfCnt();
		updateHsptStatisticsOutptntCnt();
		updateHsptStatisticsDeathCnt();
//		updateHsptStatisticsRlsedCnt();
		
		List<String> hsptNoList = hsptService.getAllHsptNo();
		
		String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		for(String hsptNo : hsptNoList) {
			
			
			HsptStatsVO hsptstats = new HsptStatsVO();
			
			hsptstats.setHsptNo(hsptNo);
			hsptstats.setStatsYmd(dateStr);
			String hsptStatsNo = hsptService.getHsptStatusNo(hsptstats);
			hsptstats.setHsptStatsNo(hsptStatsNo);
			
			InptntstatsVO inptnt = new InptntstatsVO();
			inptnt.setHsptNo(hsptNo);
			inptnt.setOutYmd(dateStr);
			inptnt.setInYmd(dateStr);
			
			// 금일 퇴원(이원)자 수
			int outCnt = hsptService.getOutCnt(inptnt);
			hsptstats.setOutCnt(outCnt);
			
			// 금일 퇴원(사망)자 수
			int deathCnt = hsptService.getDeathCnt(inptnt);
			hsptstats.setDeathCnt(deathCnt);
			
			
			// 금일 입원자 수
			int inptntCnt = hsptService.getCurInptntCnt(inptnt);
			hsptstats.setInptntCnt(inptntCnt);
			
			// 금일 퇴원(완치)자 수
			int rlsedCnt = hsptService.getRlsedCnt(inptnt);
			hsptstats.setRlsedCnt(rlsedCnt);
			
			// 현재 입원 환자 수
			int allInptntCnt = hsptService.getAllInptntCnt(hsptNo);
			hsptstats.setCurInptntCnt(allInptntCnt);
			
			HsptVO hspt = hsptService.getHsptByHsptNo(hsptNo);
			
			int rmndSckbdCnt = hspt.getRmndSckbdCnt();
			hsptstats.setRmndSckbdCnt(rmndSckbdCnt);
			int sckbdCnt = hspt.getSckbdCnt();
			hsptstats.setSckbdCnt(sckbdCnt);
			
			LOGGER.debug("hsptNo is : " + hsptNo);
			LOGGER.debug("{}", hsptstats);
			
			hsptService.modifyHsptStatsByQuery(hsptstats);

		}
		
		
	}

	
	public void updateHsptStatisticsOutptntCnt() throws Exception{
		
		
		String  filePath = saveOutptntPath +File.separator +saveOutptntFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();
			
			Map<String, Object> dataMap = getCount(saveOutptntPath, saveOutptntFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int outptntCnt = (int)dataMap.get("cnt");
			
			hsptstats.setOutCnt(outptntCnt);
			
			if(outptntCnt != -1) {
				hsptService.modifyHsptStatsOutCnt(hsptstats);
			}
		}
	}
	
	public void updateHsptStatisticsDeathCnt() throws Exception{
		
		
		String  filePath = saveDeathPath +File.separator +saveDeathFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();
			
			Map<String, Object> dataMap = getCount(saveDeathPath, saveDeathFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int deathCnt = (int)dataMap.get("cnt");
			
			hsptstats.setDeathCnt(deathCnt);
			
			if(deathCnt != -1) {
				hsptService.modifyHsptStatsDeathCnt(hsptstats);
			}
		}
	}
	
	public void updateHsptStatisticsRlsedCnt() throws Exception{
		
		
		String  filePath = saveRlsedPath +File.separator +saveRlsedFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();
			
			Map<String, Object> dataMap = getCount(saveRlsedPath, saveRlsedFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int rlsedCnt = (int)dataMap.get("cnt");
			
			hsptstats.setDeathCnt(rlsedCnt);
			
			if(rlsedCnt != -1) {
				hsptService.modifyHsptStatsRlsedCnt(hsptstats);
			}
		}
	}
	public void updateHsptStatisticsDgnssCnt() throws Exception{
		
		
		String  filePath = saveDgnssPath +File.separator +saveDgnssFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();

			Map<String, Object> dataMap = getCount(saveDgnssPath, saveDgnssFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int dgnssCnt = (int)dataMap.get("cnt");
			
			hsptstats.setDgnssCnt(dgnssCnt);
			
			if(dgnssCnt != -1) {
				hsptService.modifyHsptStatsDgnssCnt(hsptstats);
			}
		}
	}
	public void updateHsptStatisticsReqSckbdCnt() throws Exception{
		
		
		String  filePath = saveReqSckbdPath +File.separator +saveReqSckbdFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();

			Map<String, Object> dataMap = getCount(saveReqSckbdPath, saveReqSckbdFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int reqSckbdCnt = (int)dataMap.get("cnt");
			
			hsptstats.setReqSckbdCnt(reqSckbdCnt);
			
			if(reqSckbdCnt != -1) {
				hsptService.modifyHsptStatsReqSckbdCnt(hsptstats);
			}
		}
	}
	public void updateHsptStatisticsInptntCnt() throws Exception{
		String  filePath = saveInptntPath +File.separator +saveInptntFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();

			Map<String, Object> dataMap = getCount(saveInptntPath, saveInptntFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int inptntCnt = (int)dataMap.get("cnt");
			
			hsptstats.setInptntCnt(inptntCnt);
			
			if(inptntCnt != -1) {
				hsptService.modifyHsptStatsInptntCnt(hsptstats);
			}
		}
	}
	public void updateHsptStatisticsGoLtctCnt() throws Exception{
		String  filePath = saveGoLtctPath +File.separator +saveGoLtctFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();

			Map<String, Object> dataMap = getCount(saveGoLtctPath, saveGoLtctFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int goLtctCnt = (int)dataMap.get("cnt");
			
			hsptstats.setGoLtctCnt(goLtctCnt);
			
			if(goLtctCnt != -1) {
				hsptService.modifyHsptStatsGoLtctCnt(hsptstats);
			}
		}
	}
	public void updateHsptStatisticsGoSelfCnt() throws Exception{
		String  filePath = saveGoSelfPath +File.separator +saveGoSelfFileName;
		
		File file = new File(filePath);
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		String line="";
		while((line=in.readLine())!=null) {
			HsptStatsVO hsptstats = new HsptStatsVO();

			Map<String, Object> dataMap = getCount(saveGoSelfPath, saveGoSelfFileName, line);
			hsptstats = (HsptStatsVO) dataMap.get("hsptstats");
			
			int goSelfCnt = (int)dataMap.get("cnt");
			
			hsptstats.setDgnssCnt(goSelfCnt);
			
			if(goSelfCnt != -1) {
				hsptService.modifyHsptStatsGoSlfCnt(hsptstats);
			}
		}
	}
	
	private int getSameHsptNoCnt(String savePath, String fileName, String hsptNo, String dateStr)  throws IOException{
		
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
			
			if(hsptNo.equals(chkhsptNo)&&dateStr.equals(chkdateStr)) {
				count++;
			}
			
		}
		
		return count;
	}
	

	private Map<String, Object> getCount(String savePath, String fileName, String line) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		HsptStatsVO hsptstats = new HsptStatsVO();
		int num = line.indexOf("]");
		String trans = line.substring(num+1, line.length());
		String[] store = trans.split(",");
		hsptstats.setHsptNo(store[0]);
		String dateStr = store[1];
		hsptstats.setStatsYmd(dateStr);
		String hsptStatsNo = hsptService.getHsptStatusNo(hsptstats);
		hsptstats.setHsptStatsNo(hsptStatsNo);
		System.out.println("hsptstatsNo"+hsptStatsNo);
		
		dataMap.put("hsptstats", hsptstats);
		
		int cnt = hsptStatsNo != null ? getSameHsptNoCnt(savePath, fileName, store[0], store[1]) : -1;
		
		dataMap.put("cnt", cnt);
		
		return dataMap;
	}	
	
}
