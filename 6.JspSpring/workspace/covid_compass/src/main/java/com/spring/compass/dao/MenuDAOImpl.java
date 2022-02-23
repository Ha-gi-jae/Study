package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.compass.vo.MenuVO;

public class MenuDAOImpl implements MenuDAO{

	private SqlSession sqlSession = null;
	private String nameSpace = "Menu-Mapper.";
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MenuVO> test() throws SQLException{
		
		List<MenuVO> menuList = sqlSession.selectList(nameSpace + "test");
		return menuList;
	}

	@Override
	public MenuVO selectMenuByMenuNo(String menuNo) throws SQLException {
		MenuVO menu = sqlSession.selectOne(nameSpace + "selectMenuByMenuNo", menuNo);
		return menu;
	}

	@Override
	public List<MenuVO> selectMenuList() throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList(nameSpace + "selectMenuList");
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenuList(String menuNo) throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList(nameSpace + "selectSubMenuList", menuNo);
		return menuList;
	}

	@Override
	public List<MenuVO> selectEmpSubMenuList(String menuNo) throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList(nameSpace + "selectEmpSubMenuList", menuNo);
		return menuList;
	}

	@Override
	public List<MenuVO> selectAllSubMenuList(String menuNo) throws SQLException {
		List<MenuVO> menuList = sqlSession.selectList(nameSpace + "selectAllSubMenuList", menuNo);
		return menuList;
	}

	


}
