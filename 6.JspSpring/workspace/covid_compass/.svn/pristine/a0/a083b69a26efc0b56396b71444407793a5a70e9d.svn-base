package com.spring.compass.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.service.AdminService;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.MberVO;

@RestController
@RequestMapping("/rest-inst")
public class RestInstController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/inst-list")
	public ResponseEntity<Map<String, Object>> instList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String searchType2,
														@RequestParam(defaultValue="")String keyword)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType,searchType2, keyword);
		try {
			Map<String, Object> dataMap = adminService.getInstListPage(cri);
			List<InstVO> instList = (List<InstVO>) dataMap.get("instList");
			if(instList.size()>0) {
				InstVO firstInst = instList.get(0);
				List<MberVO> firstMberList = adminService.getmberList(firstInst.getInstNo());
				dataMap.put("firstInst", firstInst);
				dataMap.put("firstMberList", firstMberList);
			}
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	
}
