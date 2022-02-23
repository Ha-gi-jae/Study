package com.spring.compass.scheduler;


import java.util.List;

import com.spring.compass.service.InspService;
import com.spring.compass.vo.InspStatsVO;

public class InspStatisticsInsertScheduler {
	
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
	
	
	
	public void registInspStatistics() throws Exception{
		List<String> inspNoList = inspService.inspNoList();
		for(int i=0; i<inspNoList.size(); i++) {
			InspStatsVO inspstatsVO = new InspStatsVO();
			String isnpStatsSeq = inspService.getInspSeqNo();
			inspstatsVO.setInspstatsNo(isnpStatsSeq);
			inspstatsVO.setInspNo(inspNoList.get(i));
			
			inspService.registInspStats(inspstatsVO);
			System.out.println("등록되었습니다."+i);
		}
		
		
	}
	
	
	
}
