package com.hgj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.command.Criteria;
import com.hgj.command.PageMaker;
import com.hgj.dao.MemberDAO;
import com.hgj.dto.MemberVO;

public abstract class MemberServiceImpl implements MemberService {
	
	protected SqlSessionFactory sqlSessionFactory;
	
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	protected MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<MemberVO> getMemberList() throws Exception {
		
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
		}finally {
			session.close();
		}
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) throws Exception {
		SqlSession session = sqlSessionFactory.openSession(false);
		
		List<MemberVO> memberList =  null;
		try {
			memberList = memberDAO.selectMemberList(session, cri);
			session.commit();
			return memberList;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
	}
	
	@Override
	public Map<String, Object> getMemberListPage(Criteria cri) throws Exception {
		
		SqlSession session = sqlSessionFactory.openSession(false);
		
		Map<String, Object> dataMap = null;
		List<MemberVO> memberList = null;
		PageMaker pageMaker = null;
		
		try {
			memberList = memberDAO.selectMemberList(session, cri);
			
			pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memberDAO.selectMemberListCount(session));
			// ListCount 가 TotalCount. 이거 하는 순간 calcData()가 실행되면서  값 셋팅해줌.
			
			dataMap = new HashMap<String, Object>();
			dataMap.put("memberList", memberList);
			dataMap.put("pageMaker", pageMaker);
			
			session.commit();
			return dataMap;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
	}
	
	@Override
	public abstract MemberVO getMember(String id) throws Exception;
	
}
