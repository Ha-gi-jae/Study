package com.spring.compass.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class main {
	
	@RequestMapping("/mainH")
	public String mainH() {
		
		System.out.println("메인이동");
		
		return "common/indexPage";
	}
	
	@RequestMapping("common/pcrKitForm")
	public String pcrKiteForm() {
		
		System.out.println("kit등록");
		
		return "common/pcrKit_Form";
		
	}
	
}
