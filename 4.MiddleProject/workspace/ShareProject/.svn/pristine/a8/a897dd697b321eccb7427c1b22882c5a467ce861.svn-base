package kr.or.ddit.adminClass.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.adminClass.vo.AdminClassVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IAdminClassDao {
	// 반 전체 조회
	public List<AdminClassVO> groupByAllClass(PagingVO pv) throws SQLException;
	
	public int classSize() throws SQLException;
	
	// 반 삭제
	public int deleteClass(String class_id)throws SQLException;
	
	// 반 삭제 전 회원 반 null로 초기화
	public int classUpdateMember(String class_id)throws SQLException;
	
	// 반 등록
	public int insertClass(AdminClassVO vo) throws SQLException; 
	
	// 반 수정
	public int updateClass(AdminClassVO vo) throws SQLException;
	
	// 반에서 회원 삭제
	public int deleteMember(String memId) throws SQLException;
	
	public List<AdminClassVO> groupByClassMember(PagingVO pv) throws SQLException;
	
	public int ClassMemberSize(String class_id) throws SQLException;
}
