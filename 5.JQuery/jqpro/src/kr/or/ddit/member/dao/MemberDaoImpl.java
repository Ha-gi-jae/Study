package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/*
 * SqlMapClient
 * dao class 객체 
 */
public class MemberDaoImpl implements IMemberDao {
	
	private SqlMapClient client;
	private static IMemberDao dao;
	
	
	public MemberDaoImpl() {
		super();
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
		
	}


	@Override
	public String selectById(String inputId) throws SQLException {
		
		return (String) client.queryForObject("member.selectById", inputId);
	}

	@Override
	public List<ZipVO> selectZipCode(String dong) throws SQLException {
		
		return client.queryForList("member.selectZipCode", dong);
	}

	@Override
	public String insertMember(MemberVO vo) throws SQLException {
		
		return (String) client.insert("member.insertMember", vo);
	}

}
