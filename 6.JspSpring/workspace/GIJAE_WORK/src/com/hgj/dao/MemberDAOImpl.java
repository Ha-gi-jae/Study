package com.hgj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hgj.dto.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public List<MemberVO> selectMemberList(SqlSession session) throws Exception {
		
		List<MemberVO> memberList = session.selectList("Member-Mapper.selectMemberList");
		
		return memberList;
	}

}
