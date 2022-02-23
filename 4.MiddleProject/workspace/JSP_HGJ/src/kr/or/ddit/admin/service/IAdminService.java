package kr.or.ddit.admin.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.admin.vo.PagingVO;

public interface IAdminService {
	
	//아이디 중복검사
	public AdminVO idCheck(String id);
	
	//전체 조회
	public List<AdminVO> selectList(PagingVO pv);
	
	public int memSize();
	//상세 조회
	public AdminVO selectDetail(String id);
	
	//이름 검색
	public List<AdminVO> selectName(String name);
	
	//아이디 검색
	public List<AdminVO> selectId(String id);
	
	//번호 검색
	public List<AdminVO> selectPhone(String phone);
	
	//이메일 검색
	public List<AdminVO> selectEmail(String email);
	
	//등록
	public int insertMember(AdminVO vo);
	//수정
	public int updateMember(AdminVO vo);
	//삭제
	public int deleteMember(String id);
}
