package com.jsp.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;

public interface MemberDAO {
	
	//회원 리스트 조회
	List<MemberVO> selectMemberList(SqlSession session) throws Exception;
	List<MemberVO> selectMemberList(SqlSession session, Criteria cri) throws Exception;
	List<MemberVO> selectSearchMemberList(SqlSession session, SearchCriteria cri) throws Exception;
	
	//일반 리스트 개수
	int selectMemberListCount(SqlSession session) throws Exception;
	// 검색 리스트 개수
	int selectSearchMemberListCount(SqlSession session, SearchCriteria cri) throws SQLException;
	
	void insertMember(SqlSession session, MemberVO member) throws SQLException;
	
	MemberVO selectMemberById(SqlSession session, String id) throws SQLException;
	
	void updateMember(SqlSession session, MemberVO member) throws SQLException;
	
	void deleteMember(SqlSession session, String id) throws SQLException;
	
	void enabledMember(SqlSession session, MemberVO member) throws SQLException;
	
	void enabledMember(SqlSession session, String id, int enabled) throws SQLException;
}
