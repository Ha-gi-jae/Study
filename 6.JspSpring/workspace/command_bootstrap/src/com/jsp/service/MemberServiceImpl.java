package com.jsp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jsp.command.Criteria;
import com.jsp.command.PageMaker;
import com.jsp.dao.MemberDAO;
import com.jsp.dto.MemberVO;

public abstract class MemberServiceImpl implements MemberService {
	
	//protected로 안하면 private이라 SearchMemberServuceImpl에서 쓰지 못함.
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
		SqlSession session = sqlSessionFactory.openSession(false); // True = 오토커밋 
		
		List<MemberVO> memberList = null;
		try {
			memberList = memberDAO.selectMemberList(session);
			
			session.commit();
			
//			return memberList; 원래는 여기가 맞으나 가독성을 위해 맨 밑에 내림.
			
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			//.......
			throw e;
		}finally {
			session.close();
		}
		return memberList;
//		여기서 리턴 해주는 것은 exception이 터지지 않았을때만해준다. exception터지면 throw e가 리턴된다.
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) throws Exception {
		
		SqlSession session = sqlSessionFactory.openSession(false);
		
		List<MemberVO> memberList = null;
		
		try {
			memberList = memberDAO.selectMemberList(session, cri);
			session.commit();
			return memberList;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			//.......
			throw e;
		}finally {
			session.close();
		}
	}

	@Override
	public Map<String, Object> getMemberListPage(Criteria cri) throws Exception {
		
		SqlSession session = sqlSessionFactory.openSession(false);
		Map<String, Object> dataMap = null;
		
		try {
			
		List<MemberVO> memberList = null;
		PageMaker pageMaker = null;
		
		memberList = memberDAO.selectMemberList(session, cri);
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(session));
		
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
// 안해줘도된다.
//	@Override
//	public abstract MemberVO getMember(String id) throws Exception;
//
//	@Override
//	public abstract void registMember(MemberVO member) throws Exception;
}
