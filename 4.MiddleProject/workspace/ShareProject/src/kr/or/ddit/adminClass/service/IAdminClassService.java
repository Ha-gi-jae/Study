package kr.or.ddit.adminClass.service;

import java.util.List;

import kr.or.ddit.adminClass.vo.AdminClassVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IAdminClassService {
	public List<AdminClassVO> groupByAllClass(PagingVO pv);
	
	public int classSize();
	
	//반삭제
	public int deleteClass(String class_id);
	
	// 반 삭제전 회원 반 null로 초기화
	public int classUpdateMember(String class_id);
	
	
	// 반등록
	public int insertClass(AdminClassVO vo);
	
	// 반 수정
	public int updateClass(AdminClassVO vo);
	
	// 반에서 회원삭제
	public int deleteMember(String memId);
	
	public List<AdminClassVO> groupByClassMember(PagingVO pv);
	
	public int ClassMemberSize(String class_id);
}
