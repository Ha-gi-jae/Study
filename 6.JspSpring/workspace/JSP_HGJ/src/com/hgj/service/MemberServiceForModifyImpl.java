package com.hgj.service;

import org.apache.ibatis.session.SqlSession;

import com.hgj.dto.MemberVO;

public class MemberServiceForModifyImpl extends SearchMemberServiceImpl implements MemberServiceForModify {

	@Override
	public void modify(MemberVO member) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			memberDAO.updateMember(session, member);
		}finally {
			session.close();
		}
	}

	@Override
	public void remove(String id) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		
		try {
			memberDAO.deleteMember(session, id);
		}finally {
			session.close();
		}
		
	}

	@Override
	public void enabled(String id, int enabled) throws Exception {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			memberDAO.enabledMember(session, id, enabled);
		}finally {
			session.close();
		}
		
	}

}
