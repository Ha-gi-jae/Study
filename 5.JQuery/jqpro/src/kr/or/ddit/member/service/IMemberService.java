package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	
	// id중복 검사
	public String selectById(String inputId);
	
	// 우편번호 찾기
	public List<ZipVO> selectZipCode(String dong);
	
	// 가입하기
	public String insertMember(MemberVO vo);
}
