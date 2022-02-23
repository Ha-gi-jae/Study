package com.spring.compass.scheduler;

import com.spring.compass.service.InspService;

public class InspRemovePstiScheduler {

	private InspService inspService;
	
	public void setInspService(InspService inspService) {
		this.inspService = inspService;
	}
	
	public void removePsti()throws Exception{
		inspService.removePsti();
	}
}
