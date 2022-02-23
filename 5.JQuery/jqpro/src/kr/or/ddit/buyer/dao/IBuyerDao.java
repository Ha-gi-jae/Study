package kr.or.ddit.buyer.dao;

import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVO;

public interface IBuyerDao {

	// 설계도 - 메소드 선언 - 구현하지 않는다.
	
	public List<BuyerVO> selectByName();
	
	public BuyerVO selectDetail(String buyer_id);
}
