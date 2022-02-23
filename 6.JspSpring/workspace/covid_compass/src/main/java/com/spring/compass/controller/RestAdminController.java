package com.spring.compass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.service.AdminService;
import com.spring.compass.util.LogReadingUtil;
import com.spring.compass.vo.LoginVO;

@RestController
@RequestMapping("/rest-main")
public class RestAdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Resource(name="loginUserFilePath")
	private String loginFilePath;
	
	@Resource(name="loginUserFileName")
	private String loginFileName;
	
	@RequestMapping("/main-loginList")
	public ResponseEntity<Map<String, Object>> loginList()throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		//System.out.println("왔습니다.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		try {
		List<LoginVO> mainLogList = new LogReadingUtil().getMainLoginList(loginFilePath, loginFileName);
		dataMap.put("mainLogList", mainLogList);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/insp-list")
	public ResponseEntity<Map<String, Object>> mainInspList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="5")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String searchType2,
															@RequestParam(defaultValue="")String keyword)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType, searchType2, keyword);
		try {
			Map<String, Object> inspMap = adminService.getMainInspList(cri);
			entity = new ResponseEntity<Map<String,Object>>(inspMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/pbht-list")
	public ResponseEntity<Map<String, Object>> mainPbhtList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="5")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String searchType2,
															@RequestParam(defaultValue="")String keyword)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType, searchType2, keyword);
		try {
			Map<String, Object> pbhtMap = adminService.getMainPbhtList(cri);
			entity = new ResponseEntity<Map<String,Object>>(pbhtMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/hspt-list")
	public ResponseEntity<Map<String, Object>> mainhsptList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="5")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String searchType2,
															@RequestParam(defaultValue="")String keyword)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType, searchType2, keyword);
		try {
			Map<String, Object> hsptMap = adminService.getMainHsptList(cri);
			entity = new ResponseEntity<Map<String,Object>>(hsptMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
	}
	
	@RequestMapping(value="/ltct-list")
	public ResponseEntity<Map<String, Object>> mainLtctList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="5")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String searchType2,
															@RequestParam(defaultValue="")String keyword)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType, searchType2, keyword);
		try {
			Map<String, Object> ltctMap = adminService.getMainLtctList(cri);
			entity = new ResponseEntity<Map<String,Object>>(ltctMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			
		}
		
		return entity;
	}
	
	
	
}
