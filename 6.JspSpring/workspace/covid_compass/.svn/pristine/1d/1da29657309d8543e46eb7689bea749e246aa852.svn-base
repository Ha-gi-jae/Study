package com.spring.compass.service;

import java.sql.SQLException;
import java.util.List;

import com.spring.compass.dao.MenuDAO;
import com.spring.compass.vo.MenuVO;

public class MenuServiceImpl implements MenuService{

	private MenuDAO menuDAO = null;
	
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}
	
	@Override
	public List<MenuVO> test() throws Exception {
		List<MenuVO> menuList = menuDAO.test();
		return menuList;
	}

	@Override
	public MenuVO getMenu(String menuNo) throws Exception {
		MenuVO menu = menuDAO.selectMenuByMenuNo(menuNo);
		return menu;
	}

	@Override
	public List<MenuVO> getMenuList() throws Exception {
		List<MenuVO> menuList = menuDAO.selectMenuList();
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String menuNo) throws Exception {
		List<MenuVO> menuList = menuDAO.selectSubMenuList(menuNo);
		return menuList;
	}

	@Override
	public List<MenuVO> getEmpSubMenuList(String menuNo) throws Exception {
		List<MenuVO> menuList = menuDAO.selectEmpSubMenuList(menuNo);
		return menuList;
	}

	@Override
	public List<MenuVO> getAllSubMenuList(String menuNo) throws Exception {
		List<MenuVO> menuList = menuDAO.selectAllSubMenuList(menuNo);
		return menuList;
	}
	

}
