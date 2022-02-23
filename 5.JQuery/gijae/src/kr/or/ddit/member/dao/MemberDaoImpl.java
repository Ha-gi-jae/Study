package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	
	private static SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
		
	// 회원 정보 전체 조회
	@Override
	public List<MemberVO> selectAllMember() throws SQLException {
		return client.queryForList("member.selectAllMember");
	}
	// 회원 정보 상세 조회
	@Override
	public MemberVO selectMemberDetail(String memId) throws SQLException {
		return (MemberVO) client.queryForObject("member.selectMemberDetail", memId);
	}
	
	// 회원 정보 검색 조회
	@Override
	public List<MemberVO> findMember(String keyWord) throws SQLException {
		return client.queryForList("member.findMember", keyWord);
	}
	
	// 회원 정보 수정
	@Override
	public int updateMember(MemberVO mv) throws SQLException {
		return client.update("member.updateMember", mv);
	}
	
	// 회원 정보 삭제
	@Override
	public int deleteMember(String memId) throws SQLException {
		return client.delete("member.deleteMember", memId);
	}
	
	// 비밀번호 초기화
	@Override
	public int passwordReset(String memId) throws SQLException {
		return client.update("member.passwordReset", memId);
	}



}
