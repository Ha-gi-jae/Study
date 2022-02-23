package com.hgj.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.hgj.dto.MemberVO;


public class TestMemberDAOImpl {

	private SqlSessionFactory sqlSessionFactory;
	private MemberDAO memberDAO = new MemberDAOImpl();
	private SqlSession session;
	
	{
		String config = "com/hgj/myBatis/config/sqlConfig.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(config);
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Before
	public void initSqlSession() {
		session = sqlSessionFactory.openSession();
	}
	
	@After
	public void closeSqlSession() {
		session.close();
	}
	
	@Test
	public void testSelectMemberList()throws Exception{
		List<MemberVO> memberList = memberDAO.selectMemberList(session);
		
		Assert.assertEquals(7, memberList.size());
	}
}
