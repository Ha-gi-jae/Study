package com.jsp.dataSource;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import com.jsp.context.ApplicationContext;
import com.jsp.dto.MemberVO;
import com.jsp.listener.MockApplicationContextInitListener;

public class TestOracleMyBatisSqlSessionFactory {
	
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession session;
	
	//테스트 1번에 인스턴스가 1번씩.
	// 그래서 테스트가 3번이라 인스턴스가 3번 만들어짐.
	{
		MockApplicationContextInitListener mockListener = new MockApplicationContextInitListener();
		mockListener.contextInitalized("classpath:com/jsp/context/application-context.xml");
		Map<String, Object> container = ApplicationContext.getApplicationContext();
		this.sqlSessionFactory = (SqlSessionFactory)container.get("sqlSessionFactory");
	}
	
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
		
		Assert.assertEquals(287, memberList.size());
	}
	
	@After
	public void complete() {
		session.close();
	}
}
