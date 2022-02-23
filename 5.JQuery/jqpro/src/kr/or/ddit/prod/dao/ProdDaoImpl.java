package kr.or.ddit.prod.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.SqlMapClientFactory;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {

	private SqlMapClient client;
	private static IProdDao dao;
	
	// 생성자
	private ProdDaoImpl() {
		client = SqlMapClientFactory.getInstance();
	}
	
	public static IProdDao getDao() {
		if(dao == null) dao = new ProdDaoImpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectProdByLgu(String lprod_gu) {
		List<ProdVO> list = null;
		
		try {
			list = client.queryForList("prod.selectProdByLgu", lprod_gu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ProdVO selectByIddetail(String prod_id) {
		ProdVO vo = null;
		
		try {
			vo= (ProdVO) client.queryForObject("prod.selectByIddetail", prod_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

}
