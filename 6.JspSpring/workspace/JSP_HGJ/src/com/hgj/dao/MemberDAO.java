package com.hgj.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hgj.command.Criteria;
import com.hgj.command.SearchCriteria;
import com.hgj.dto.MemberVO;

public interface MemberDAO {

	List<MemberVO> selectMemberList(SqlSession session) throws Exception;
	List<MemberVO> selectMemberList(SqlSession session, Criteria cri) throws Exception;
	List<MemberVO> selectSearchMemberList(SqlSession session, SearchCriteria cri) throws Exception;
	
	int selectMemberListCount(SqlSession session) throws Exception;
	int selectSearchMemeberListCount(SqlSession session, SearchCriteria cri) throws Exception;

	MemberVO selectMemberById(SqlSession session, String id) throws SQLException;
	
	void insertMember(SqlSession session, MemberVO member) throws SQLException;

	void updateMember(SqlSession session, MemberVO member) throws SQLException;

	void deleteMember(SqlSession session, String id) throws SQLException;
	
	void enabledMember(SqlSession session, String id, int enabled) throws SQLException;
}
