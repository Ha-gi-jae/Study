package kr.or.ddit.adminClass.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.adminClass.vo.AdminClassVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.util.SqlMapClientFactory;

public class AdminClassDaoImpl implements IAdminClassDao {
	
	private SqlMapClient client;
	private static IAdminClassDao dao;
	
	public AdminClassDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	public static IAdminClassDao getDao() {
		if(dao == null) dao = new AdminClassDaoImpl();
		return dao;
	}
	@Override
	public List<AdminClassVO> groupByAllClass(PagingVO pv) throws SQLException {
		
		return client.queryForList("adminclass.groupByAllClass", pv);
		
	}
	@Override
	public int classSize() throws SQLException {
		return (Integer) client.queryForObject("adminclass.classSize");
	}
	@Override
	public int deleteClass(String class_id) throws SQLException {
		return client.delete("adminclass.deleteClass", class_id);
	}
	@Override
	public int classUpdateMember(String class_id) throws SQLException {
		return client.update("adminclass.classUpdateMember", class_id);
	}
	@Override
	public int insertClass(AdminClassVO vo) throws SQLException {
		Object obj = client.insert("adminclass.insertClass", vo);
		if(obj == null)
			return 1;
		else
			return 0;
	}
	@Override
	public int updateClass(AdminClassVO vo) throws SQLException {
		return client.update("adminclass.updateClass", vo);
	}
	@Override
	public int deleteMember(String memId) throws SQLException {
		return client.delete("adminclass.deleteMember", memId);
	}
	@Override
	public List<AdminClassVO> groupByClassMember(PagingVO pv) throws SQLException {
		return client.queryForList("adminclass.groupByClassMember", pv);
	}
	@Override
	public int ClassMemberSize(String class_id) throws SQLException {
		return (int) client.queryForObject("adminclass.ClassMemberSize", class_id);
	}
}
