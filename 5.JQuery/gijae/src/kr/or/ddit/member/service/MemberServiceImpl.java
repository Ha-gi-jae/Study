package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	private static IMemberService service;
	private IMemberDao dao;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService GetService() {
		if(service == null) service= new MemberServiceImpl();
		
		return service;
	}
	
	// 회원 정보 전체 조회
	@Override
	public List<MemberVO> selectAllMember() {
		List<MemberVO> list = null;
		try {
			list = dao.selectAllMember();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 회원 정보 상세 조회
	@Override
	public MemberVO selectMemberDetail(String memId) {
		MemberVO vo = null;
		try {
			vo = dao.selectMemberDetail(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	// 회원 정보 검색 조회
	@Override
	public List<MemberVO> findMember(String keyWord) {
		List<MemberVO> list = null;
		try {
			list = dao.findMember(keyWord);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 회원 정보 수정 (비밀번호, 반아이디)
	@Override
	public int updateMember(MemberVO mv) {
		int cnt = 0;
		try {
			cnt = dao.updateMember(mv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 회원 정보 삭제
	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		try {
			cnt = dao.deleteMember(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 비밀번호 초기화
	@Override
	public int passwordReset(String memId) {
		int cnt = 0;
		try {
			cnt = dao.passwordReset(memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	

}
