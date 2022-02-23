package com.hgj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.hgj.command.Criteria;
import com.hgj.command.PageMaker;
import com.hgj.command.SearchCriteria;
import com.hgj.dto.MemberVO;

public class SearchMemberServiceImpl extends MemberServiceImpl {

	@Override
	public Map<String, Object> getMemberListPage(Criteria cri) throws Exception {
		SearchCriteria searchCri = (SearchCriteria)cri;
		
		SqlSession session = sqlSessionFactory.openSession(false);
		Map<String, Object> dataMap = null;
		List<MemberVO> memberList = null;
		PageMaker pageMaker = null;
		
		try {
			memberList = memberDAO.selectSearchMemberList(session, searchCri);
			pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(memberDAO.selectSearchMemeberListCount(session, searchCri));
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
		SqlSession session = sqlSessionFactory.openSession(false);

		MemberVO member = null;
		
		try {
			member = memberDAO.selectMemberById(session, id);

			session.commit();
			
			return member;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.commit();
		}
	}

	@Override
	public void regist(MemberVO member) throws Exception {
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
