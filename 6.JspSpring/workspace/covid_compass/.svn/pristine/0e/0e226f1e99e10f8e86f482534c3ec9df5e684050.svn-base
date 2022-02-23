package com.spring.compass.scheduler;


import java.util.List;

import com.spring.compass.service.HsptService;
import com.spring.compass.vo.HsptStatsVO;

public class HsptStatisticsInsertScheduler {
	
	private HsptService hsptService;
	
	
	public void setHsptService(HsptService hsptService) {
		this.hsptService = hsptService;
	}



	public void registHsptStatistics() throws Exception{
		List<String> hsptNoList = hsptService.getAllHsptNo();
		for(int i=0; i<hsptNoList.size(); i++) {
			HsptStatsVO hsptStats = new HsptStatsVO();
			String hsptStatsSeq = hsptService.getHsptStatsSeq();
			hsptStats.setHsptStatsNo(hsptStatsSeq);
			hsptStats.setHsptNo(hsptNoList.get(i));
			
			hsptService.registHsptStats(hsptStats);
			System.out.println("등록되었습니다."+i);
		}
		
		
	}
	
	
	
}
