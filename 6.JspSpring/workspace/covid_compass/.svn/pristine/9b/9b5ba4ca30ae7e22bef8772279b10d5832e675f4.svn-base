package com.spring.compass.scheduler;


import java.util.List;

import com.spring.compass.service.PbhtService;
import com.spring.compass.vo.PbhtStatsVO;

public class PbhtStatisticsInsertScheduler {
	
	private PbhtService pbhtService;
	
	
	public void setPbhtService(PbhtService pbhtService) {
		this.pbhtService = pbhtService;
	}



	public void registPbhtStatistics() throws Exception{
		List<String> pbhtNoList = pbhtService.getPbhtNoList();
		for(int i=0; i<pbhtNoList.size(); i++) {
			PbhtStatsVO pbhtStats = new PbhtStatsVO();
			String pbhtStatsNo = pbhtService.getPbhtStatsSeq();
			pbhtStats.setPbhtstatsNo(pbhtStatsNo);
			pbhtStats.setPbhtNo(pbhtNoList.get(i));
			
			pbhtService.registPbhtStats(pbhtStats);
			System.out.println("등록되었습니다."+i);
		}
		
		
	}
	
	
	
}
