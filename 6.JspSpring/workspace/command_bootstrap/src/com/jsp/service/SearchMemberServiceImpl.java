package com.jsp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;

public class SearchMemberServiceImpl extends MemberServiceImpl{
	
	@Override
	public Map<String, Object> getMemberListPage(Criteria cri) throws Exception{
		
		SearchCriteria searchCri = (SearchCriteria)cri;
		
		SqlSession session = sqlSessionFactory.openSession(false);
		Map<String, Object> dataMap = null;
		
		try {
			
		List<MemberVO> memberList = null;
		PageMaker pageMaker = null;
		
		memberList = memberDAO.selectSearchMemberList(session, searchCri); // Criteria가 아닌 SearchCriteria 로 바뀐다.
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectSearchMemberListCount(session, searchCri));
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
	public MemberVO getMember(String id) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			MemberVO member = memberDAO.selectMemberById(session, id);
			return member;
		}finally {
			session.close();
		}
	}

	@Override
	public void registMember(MemberVO member) throws Exception {
		SqlSession session = sqlSessionFactory.openSession(false);

		try {
			memberDAO.insertMember(session, member);
			session.commit();
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
		
	}
}
