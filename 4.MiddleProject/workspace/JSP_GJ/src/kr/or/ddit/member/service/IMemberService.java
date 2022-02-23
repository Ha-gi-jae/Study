package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

public interface IMemberService {
	
	
	public MemberVO idCheck(String id);
	
	public List<MemberVO> listMember(PagingVO pv);
	
	public int memSize(PagingVO pv);
	
	public MemberVO detailMember(String id);
	
	public List<MemberVO> selectName(String name);
	
	public List<MemberVO> selectId(String id);
	
	public List<MemberVO> selectPhone(String phone);
	
	public List<MemberVO> selectEmail(String email);
	
	public int insertMember(MemberVO vo);
	
	public int updateMember(MemberVO vo);
	
	public int deleteMember(String id);
}
