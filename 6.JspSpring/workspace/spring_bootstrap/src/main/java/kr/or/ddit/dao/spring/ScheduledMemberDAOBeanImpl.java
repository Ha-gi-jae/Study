package kr.or.ddit.dao.spring;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dto.MemberVO;

public class ScheduledMemberDAOBeanImpl extends MemberDAOImplTemplate implements ScheduledMemberDAOBean {
	
	// 세션 선언
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public MemberVO selectMemberByPicture(String picture) throws SQLException {
		MemberVO member = null;
		
		member = session.selectOne("Member-Mapper.selectMemberByPicture", picture);
		
		return member;
	}

}
