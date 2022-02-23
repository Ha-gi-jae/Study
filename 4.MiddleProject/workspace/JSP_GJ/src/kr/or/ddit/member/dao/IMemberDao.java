package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

public interface IMemberDao {
	
	public MemberVO idCheck(String id) throws SQLException;
	
	public List<MemberVO> listMember(PagingVO pv) throws SQLException;
	
	public int memSize(PagingVO pv) throws SQLException;
	
	public MemberVO detailMember(String id) throws SQLException;
	
	public List<MemberVO> selectName(String name) throws SQLException;
	
	public List<MemberVO> selectId(String id) throws SQLException;
	
	public List<MemberVO> selectPhone(String phone) throws SQLException;
	
	public List<MemberVO> selectEmail(String email) throws SQLException;
	
	public int insertMember(MemberVO vo) throws SQLException;
	
	public int updateMember(MemberVO vo) throws SQLException;
	
	public int deleteMember(String id) throws SQLException;
}
