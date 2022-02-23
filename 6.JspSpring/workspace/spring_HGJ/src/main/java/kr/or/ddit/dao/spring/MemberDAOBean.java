package kr.or.ddit.dao.spring;

import java.sql.SQLException;
import java.util.List;

import com.jsp.command.Criteria;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.MemberVO;

public interface MemberDAOBean {

	//회원 리스트 조회
	List<MemberVO> selectMemberList() throws Exception;
	List<MemberVO> selectMemberList(Criteria cri) throws Exception;
	List<MemberVO> selectSearchMemberList(SearchCriteria cri) throws Exception;
	
	//일반 리스트 개수
	int selectMemberListCount() throws Exception;
	// 검색 리스트 개수
	int selectSearchMemberListCount(SearchCriteria cri) throws SQLException;
	
	void insertMember(MemberVO member) throws SQLException;
	
	MemberVO selectMemberById(String id) throws SQLException;
	
	void updateMember(MemberVO member) throws SQLException;
	
	void deleteMember(String id) throws SQLException;
	
	void enabledMember(MemberVO member) throws SQLException;
	
	void enabledMember(String id, int enabled) throws SQLException;
}
