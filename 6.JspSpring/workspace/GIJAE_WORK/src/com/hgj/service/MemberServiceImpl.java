package com.hgj.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.dao.MemberDAO;
import com.hgj.dao.MemberDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.MemberVO;

public class MemberServiceImpl implements MemberService {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	private MemberDAO memberDAO;


	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}


	@Override
	public List<MemberVO> getMemberList() throws Exception {

		// 오토 커밋  false
		SqlSession session = sqlSessionFactory.openSession(false);
		
		List<MemberVO> memberList = null;
		
		try {
			memberList = memberDAO.selectMemberList(session);
			
			session.commit();
			
			return memberList;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
			// 컨트롤러한테 Exception 리턴.
		}finally {
			// try든 catch 든 끝나고나서 세션 닫아주기.
			session.close();
		}
	}
	
	
}
