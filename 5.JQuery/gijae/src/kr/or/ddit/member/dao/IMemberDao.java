package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {
	
	// 회원 정보 전체 조회
	public List<MemberVO> selectAllMember() throws SQLException;
	// 회원 정보 상세 조회
	public MemberVO selectMemberDetail(String memId) throws SQLException;
	
	// 회원 정보 검색 조회
	public List<MemberVO> findMember(String keyWord)throws SQLException;
	
	// 회원 정보 수정 
	public int updateMember(MemberVO mv) throws SQLException;
		
	// 회원 정보 삭제
	public int deleteMember(String memId) throws SQLException;
	
	// 비밀번호 초기화
	public int passwordReset(String memId) throws SQLException;
}
