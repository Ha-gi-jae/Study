package kr.or.ddit.lprod.dao;

import java.util.List;

import kr.or.ddit.lprod.vo.LprodVO;

public interface ILprodDao {
	
	public List<LprodVO> selectAllItem();
}
