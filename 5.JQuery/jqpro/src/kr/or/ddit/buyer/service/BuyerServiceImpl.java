package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

/**
 * Dao클래스의 메소드를 호출 - dao클래스 객체가 필요하다.
 * 싱글톤 처리 - controller에서 사용 될 service 클래스 객체를 생성하여 리턴 
 * @author PC-06
 */
public class BuyerServiceImpl implements IBuyerService {
	
	private IBuyerDao dao;
	private static IBuyerService service;
	
	//생성자
	private BuyerServiceImpl() {
		dao = BuyerDaoImpl.getDao(); // 다오 가져오기. (다오 에 있는 getDao 메서드)
	}
	
	public static IBuyerService GetService() { //GetInstance로 쓰기도함.
		if(service == null) service = new BuyerServiceImpl();
		
		return service;
	}
	
	@Override
	public List<BuyerVO> selectByName() {
//		List<BuyerVO> list = null;
//		list = dao.selectByName(); // 메서드 이름 틀리게주면 그걸로 맞춰서 해야함. 틀리게하면 헷갈리니까 똑같게하자 제발.
//		return list;
		return dao.selectByName(); // 위를 이렇게 한줄로 생략 가능하다.
	}

	@Override
	public BuyerVO selectDetail(String buyer_id) {
//		BuyerVO vo = null;
//		vo = dao.selectDetail(buyer_id);
//		return vo;
		return dao.selectDetail(buyer_id); // 마찬가지로 한줄로 생략.
	}
// sql 맵에서 dao로 간게 service로 오고 이게 controller로 감.
}
