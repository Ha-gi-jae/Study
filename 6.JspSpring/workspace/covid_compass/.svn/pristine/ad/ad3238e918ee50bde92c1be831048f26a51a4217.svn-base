package com.spring.compass.scheduler;


import java.util.List;

import com.spring.compass.service.LtctService;
import com.spring.compass.vo.LtctStatsVO;

public class LtctStatisticsInsertScheduler {
	
	private LtctService ltctService;
	
	
	public void setLtctService(LtctService ltctService) {
		this.ltctService = ltctService;
	}



	public void registLtctStatistics() throws Exception{
		List<String> ltctNoList = ltctService.getAllLtctNo();
		for(int i=0; i<ltctNoList.size(); i++) {
			LtctStatsVO ltctStats = new LtctStatsVO();
			String ltctStatsSeq = ltctService.getLtctStatsSeq();
			ltctStats.setLtctStatsNo(ltctStatsSeq);
			ltctStats.setLtctNo(ltctNoList.get(i));
			
			ltctService.registLtctStats(ltctStats);
			System.out.println("등록되었습니다."+i);
		}
		
		
	}
	
	
	
}
