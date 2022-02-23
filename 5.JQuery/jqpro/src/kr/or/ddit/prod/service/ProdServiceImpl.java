package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {
	
	private IProdDao dao;
	private static IProdService service;
	
	// 생성자
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getDao();
	}
	
	public static IProdService getService() {
		if(service ==null) service = new ProdServiceImpl();
		
		return service;
	}
	
	@Override
	public List<ProdVO> selectProdByLgu(String lprod_gu) {
		return dao.selectProdByLgu(lprod_gu);
	}

	@Override
	public ProdVO selectByIddetail(String prod_id) {
		return dao.selectByIddetail(prod_id);
	}


}
