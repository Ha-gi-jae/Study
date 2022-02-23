package com.spring.compass.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.compass.service.MenuService;
import com.spring.compass.vo.MenuVO;

@Controller
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/menu/test")
	public ModelAndView test(ModelAndView mnd) throws Exception{
		
		String url = "/menu/test";
		List<MenuVO> menuList = menuService.test();
		
		mnd.addObject("menuList", menuList);
		mnd.setViewName(url);
		
		return mnd;
	}
	
	@RequestMapping("/menu/get-menu-test")
	public ModelAndView getMenuTest(@RequestParam(value="mcode", defaultValue="M020000") String menuInnb, ModelAndView mnv) throws Exception{
		String url = "/menu/get-menu-test";
		MenuVO menu = menuService.getMenu(menuInnb);
		
		mnv.addObject("menu", menu);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/menu/get-menu-list")
	public ModelAndView getMenuList(ModelAndView mnd) throws Exception{
		String url = "/menu/get-menu-list";
		List<MenuVO> menuList = menuService.getMenuList();
		
		mnd.addObject("menuList", menuList);
		mnd.setViewName(url);
		
		return mnd;
	}
}
