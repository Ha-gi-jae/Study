package kr.or.ddit.cl.service;

import java.sql.SQLException;

import kr.or.ddit.cl.vo.ClassVO;

public interface IClassService {
	
	// 반 등록
	public int insertClass(ClassVO vo);
	// 반 수정
	public int updateClass(ClassVO vo);
	// 반 삭제
	public int deleteClass(String classId);
}
