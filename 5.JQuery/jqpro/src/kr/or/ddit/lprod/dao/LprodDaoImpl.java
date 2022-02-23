package kr.or.ddit.lprod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.lprod.vo.LprodVO;

/**
 * mapper의 sql문을 실행 - SqlMapClient 객체가 필요.
 * service에서 사용할 dao객체를 생성하고 리턴하는 메소드
 * @author PC-06
 */
public class LprodDaoImpl implements ILprodDao{
	
	private SqlMapClient client;
	private static ILprodDao dao;
	
	// 생성자
	private LprodDaoImpl() {
		client = SqlMapClientFactory.getInstance();
		
	}
	
	public static ILprodDao getDao() {
		if(dao == null) dao = new LprodDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<LprodVO> selectAllItem() {

		List<LprodVO> list = null;
		
		try {							//namespace.id
			list = client.queryForList("lprod.selectAllItem");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
