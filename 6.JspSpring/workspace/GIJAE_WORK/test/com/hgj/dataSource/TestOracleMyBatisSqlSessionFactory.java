package com.hgj.dataSource;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.hgj.dto.MemberVO;

public class TestOracleMyBatisSqlSessionFactory {

	private SqlSessionFactory sqlSessionFactory = new OracleMyBatisSqlSessionFactory();
	private SqlSession session;
	
	@Before
	public void init() {
		session = sqlSessionFactory.openSession();
	}
	
	@Test
	public void testNotNullSession() {
		Assert.assertNotNull(session);
	}
	
	@Test
	public void testNotNullConnection() {
		Assert.assertNotNull(session.getConnection());
	}
	
	@Test
	public void testSQL() throws SQLException{
		List<MemberVO> memberList = session.selectList("Member-Mapper.selectMemberList");
		
		Assert.assertEquals(7, memberList.size());
		
	}
	
	@After
	public void complete() {
		session.close();
	}
	
	
}
