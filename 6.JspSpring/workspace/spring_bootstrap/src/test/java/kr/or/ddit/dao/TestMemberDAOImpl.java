package kr.or.ddit.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.jsp.dao.MemberDAO;
import com.jsp.dto.MemberVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:kr/or/ddit/context/root-context.xml")
@Transactional
public class TestMemberDAOImpl {

	// 조립 여기서 해줘야함..
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private SqlSession sqlSession;
	
	// White-Box Test
	
	@Test
	public void testSelectMember() throws Exception{
		
		String id = "mimi";
		
		MemberVO member = memberDAO.selectMemberById(sqlSession, id);
		
		Assert.assertEquals(id, member.getId());
	}
	
	@Test
	@Rollback
	public void insertMember() throws Exception{
		
		MemberVO testmember = new MemberVO();
		
		testmember.setId("kaka");
		testmember.setPwd("kaka");
		testmember.setEmail("kaka@kaka.net");
		testmember.setPicture("kaka.jpg");
		testmember.setPhone("010-1111-1111");
		testmember.setName("김카카");
		testmember.setAuthority("ROLE_USER");
		
		memberDAO.insertMember(sqlSession, testmember);

		MemberVO member = memberDAO.selectMemberById(sqlSession, testmember.getId());
		
		Assert.assertEquals(testmember.getId(), member.getId());
	}
}
