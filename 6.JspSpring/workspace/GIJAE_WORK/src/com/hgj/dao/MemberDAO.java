package com.hgj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hgj.dto.MemberVO;

public interface MemberDAO {
	
	List<MemberVO> selectMemberList(SqlSession session)throws Exception;
}
