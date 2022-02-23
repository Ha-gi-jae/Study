package com.spring.compass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.service.MenuService;
import com.spring.compass.vo.MenuVO;

@RestController
public class RestCommonController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/common/submenu")
	public ResponseEntity<List<MenuVO>> submenu(@RequestParam(value="mCode", defaultValue="M000000") String menuNo) 
			throws Exception {
		ResponseEntity<List<MenuVO>> entity = null;
		List<MenuVO> subMenu = null;
		
		try {
			subMenu = menuService.getSubMenuList(menuNo);
			entity = new ResponseEntity<List<MenuVO>>(subMenu, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
}
