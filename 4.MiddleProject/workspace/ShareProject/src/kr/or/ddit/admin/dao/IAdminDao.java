package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IAdminDao {
	
	
	public AdminVO adCheck(AdminVO av) throws SQLException;
	
	
	// 회원 정보 전체 조회
	public List<AdminVO> groupByAllMem(PagingVO pv) throws SQLException;
	
	// 회원 정보 상세 조회
	public AdminVO selectMemberDetail(String memId) throws SQLException;
	
	//회원 정보 수정
	public int updateMember(AdminVO vo) throws SQLException;
	
	// 회원 정보 삭제
	public int deleteMember(String memId) throws SQLException;
	
	// 비밀번호 초기화
	public int passwordReset(String memId) throws SQLException;
	
	public int memSize()throws SQLException;
	
	
	//조건 검색 반
	public List<AdminVO> findClass(String class_id) throws SQLException;
	//조건 검색 그룹
	public List<AdminVO> findGroup(String mem_group) throws SQLException;
	//조건 검색 이름
	public List<AdminVO> findName(String mem_name) throws SQLException;
	
	public int insertMember(AdminVO vo) throws SQLException;
	
	// 검색 사이즈
	public int findclasssize(String class_id) throws SQLException;
	
	public int findgroupsize(String mem_group) throws SQLException;
	
	public int findnamesize(String mem_name) throws SQLException;
	// 검색 페이징
	public List<AdminVO> groupByFindCls(PagingVO pv) throws SQLException;
	
	public List<AdminVO> groupByFindGroup(PagingVO pv) throws SQLException;
	
	public List<AdminVO> groupByFindName(PagingVO pv) throws SQLException;
}
