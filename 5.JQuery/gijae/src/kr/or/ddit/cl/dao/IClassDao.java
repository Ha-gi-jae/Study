package kr.or.ddit.cl.dao;

import java.sql.SQLException;

import kr.or.ddit.cl.vo.ClassVO;

public interface IClassDao {
	
	//반 정보 전체 조회
	
	//반 정보 상세 조회
	
	// 반 등록
	public int insertClass(ClassVO vo) throws SQLException;
	// 반 수정
	public int updateClass(ClassVO vo) throws SQLException;
	// 반 삭제
	public int deleteClass(String classId) throws SQLException;
}
