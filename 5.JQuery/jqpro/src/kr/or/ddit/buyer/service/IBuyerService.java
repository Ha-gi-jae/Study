package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVO;

public interface IBuyerService {
	
	// 설계도 - 메소드 선언 - 구현하지 않는다.
	
	public List<BuyerVO> selectByName();
	
	public BuyerVO selectDetail(String buyer_id);
}
