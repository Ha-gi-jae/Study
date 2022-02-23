package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.admin.vo.PagingVO;

public interface IAdminDao {
	
	// 아이디중복검사
	public AdminVO idCheck(String id) throws SQLException;
	
	//전체 조회
	public List<AdminVO> selectList(PagingVO pv) throws SQLException;
	
	public int memSize() throws SQLException;
	
	//상세 조회
	public AdminVO selectDetail(String id) throws SQLException;
	
	//이름 검색
	public List<AdminVO> selectName(String name) throws SQLException;
	
	//아이디 검색
	public List<AdminVO> selectId(String id) throws SQLException;
	
	//번호 검색
	public List<AdminVO> selectPhone(String phone) throws SQLException;
	
	//이메일 검색
	public List<AdminVO> selectEmail(String email) throws SQLException;
	
	//등록
	public int insertMember(AdminVO vo) throws SQLException;
	//수정
	public int updateMember(AdminVO vo) throws SQLException;
	//삭제
	public int deleteMember(String id) throws SQLException;
}
