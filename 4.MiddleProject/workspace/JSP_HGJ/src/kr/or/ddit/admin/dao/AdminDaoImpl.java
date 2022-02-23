package kr.or.ddit.admin.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.admin.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AdminDaoImpl implements IAdminDao {
	private SqlMapClient client;
	private static IAdminDao dao;
	
	public AdminDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IAdminDao getDao() {
		if(dao == null) dao = new AdminDaoImpl();
		return dao;
	}

	@Override
	public List<AdminVO> selectList(PagingVO pv) throws SQLException {
		return client.queryForList("admin.selectList", pv);
	}

	@Override
	public AdminVO selectDetail(String id) throws SQLException {
		return (AdminVO) client.queryForObject("admin.selectDetail", id);
	}

	@Override
	public List<AdminVO> selectName(String name) throws SQLException {
		return client.queryForList("admin.selectName", name);
	}

	@Override
	public List<AdminVO> selectId(String id) throws SQLException {
		return client.queryForList("admin.selectId", id);
	}

	@Override
	public List<AdminVO> selectPhone(String phone) throws SQLException {
		return client.queryForList("admin.selectPhone", phone);
	}

	@Override
	public List<AdminVO> selectEmail(String email) throws SQLException {
		return client.queryForList("admin.selectEmail", email);
	}

	@Override
	public int insertMember(AdminVO vo) throws SQLException {
		int cnt = 0;
		Object obj = client.insert("admin.insertMember", vo);
		if(obj == null) {
			cnt = 1;
			return cnt;
		}
		else
			return cnt;
	}

	@Override
	public int updateMember(AdminVO vo) throws SQLException {
		return client.update("admin.updateMember", vo);
	}

	@Override
	public int deleteMember(String id) throws SQLException {
		return client.delete("admin.deleteMember", id);
	}

	@Override
	public AdminVO idCheck(String id) throws SQLException {
		return (AdminVO) client.queryForObject("admin.idCheck", id);
	}

	@Override
	public int memSize() throws SQLException {
		return (int) client.queryForObject("admin.memSize");
	}
}
