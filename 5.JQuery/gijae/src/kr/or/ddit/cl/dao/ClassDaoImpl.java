package kr.or.ddit.cl.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.cl.vo.ClassVO;
import kr.or.ddit.ibatis.config.SqlMapClientFactory;

public class ClassDaoImpl implements IClassDao {

	private SqlMapClient client;
	private static IClassDao dao;
	
	public ClassDaoImpl() {
		this.client = SqlMapClientFactory.getInstance();
	}
	
	public static IClassDao getDao() {
		if(dao == null) dao = new ClassDaoImpl();
		return dao;
	}
	
	// 반 등록
	@Override
	public int insertClass(ClassVO vo) throws SQLException {
		return (Integer) client.insert("class.insertClass", vo);
	}
	// 반 수정
	@Override
	public int updateClass(ClassVO vo) throws SQLException {
		return client.update("class.updateClass", vo);
	}
	// 반 삭제
	@Override
	public int deleteClass(String classId) throws SQLException {
		return client.delete("class.deleteClass", classId);
	}

}
