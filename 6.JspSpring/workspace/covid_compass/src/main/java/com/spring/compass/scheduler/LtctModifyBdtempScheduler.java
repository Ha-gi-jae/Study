package com.spring.compass.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.compass.service.LtctService;
import com.spring.compass.vo.IsoptntVO;

public class LtctModifyBdtempScheduler {
	
	private LtctService ltctService;
	
	public void setLtctService(LtctService ltctService) {
		this.ltctService = ltctService;
	}
	
	public void modifyBdtempIsoptnt() throws Exception{
		List<String> isoptntNoList = ltctService.getIsoptntNoList();
		
		for(int i=0; i<isoptntNoList.size(); i++) {
			IsoptntVO isoptnt = new IsoptntVO();
			double bdtemp = (Math.floor(((Math.random()+36) + (Math.random()*2))* 10) ) / 10;
			isoptnt.setIsoptntNo(isoptntNoList.get(i));
			isoptnt.setBdtemp(bdtemp);
			ltctService.modifyIsoptntBdtempByIsoptntNo(isoptnt);
		}
	}
}
