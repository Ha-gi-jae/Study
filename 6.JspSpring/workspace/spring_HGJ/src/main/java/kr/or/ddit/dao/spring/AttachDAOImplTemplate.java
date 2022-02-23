package kr.or.ddit.dao.spring;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jsp.dao.AttachDAO;
import com.jsp.dto.AttachVO;

public class AttachDAOImplTemplate implements AttachDAOBean {

	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	private AttachDAO attachDAO;
	
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public List<AttachVO> selectAttachesByPno(int pno) throws SQLException {
		return attachDAO.selectAttachesByPno(session, pno);
//		session.select("Attach-Mapper.selcest")
	}

	@Override
	public AttachVO selectAttachByAno(int ano) throws SQLException {
		return attachDAO.selectAttachByAno(session, ano);
	}

	@Override
	public void insertAttach(AttachVO attach) throws SQLException {
		attachDAO.insertAttach(session, attach);
	}

	@Override
	public void deleteAttach(int ano) throws SQLException {
		attachDAO.deleteAttach(session, ano);
	}

	@Override
	public void deleteAllAttach(int pno) throws SQLException {
		attachDAO.deleteAllAttach(session, pno);
	}

}
