package kr.or.ddit.dao.spring;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.jsp.command.SearchCriteria;
import com.jsp.dao.MemberDAO;
import com.jsp.dto.MemberVO;

public class MemberDAOImplTemplate implements MemberDAOBean {

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public List<MemberVO> selectMemberList() throws Exception {
		return memberDAO.selectMemberList(session);
	}

	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws Exception {
		return memberDAO.selectMemberList(session, cri);
	}

	@Override
	public List<MemberVO> selectSearchMemberList(SearchCriteria cri) throws Exception {
		return memberDAO.selectSearchMemberList(session, cri);
	}

	@Override
	public int selectMemberListCount() throws Exception {
		return memberDAO.selectMemberListCount(session);
	}

	@Override
	public int selectSearchMemberListCount(SearchCriteria cri) throws SQLException {
		return memberDAO.selectSearchMemberListCount(session, cri);
	}

	@Override
	public void insertMember(MemberVO member) throws SQLException {
		memberDAO.insertMember(session, member);
	}

	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		return memberDAO.selectMemberById(session, id);
	}

	@Override
	public void updateMember(MemberVO member) throws SQLException {
		memberDAO.updateMember(session, member);
	}

	@Override
	public void deleteMember(String id) throws SQLException {
		memberDAO.deleteMember(session, id);
	}

	@Override
	public void enabledMember(MemberVO member) throws SQLException {
		memberDAO.enabledMember(session, member);
	}

	@Override
	public void enabledMember(String id, int enabled) throws SQLException {
		memberDAO.enabledMember(session, id, enabled);
	}

}
