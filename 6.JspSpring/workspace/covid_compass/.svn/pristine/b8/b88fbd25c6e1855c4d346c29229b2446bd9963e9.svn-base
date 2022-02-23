package com.spring.compass.service;

import java.util.List;

import com.spring.compass.dao.LtctDAO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;

public class LtctServiceImplLKH extends LtctServiceImpl implements LtctServiceLKH{
	
	private LtctDAO ltctDAO;
	public void setLtctDAO(LtctDAO ltctDAO) {
		this.ltctDAO = ltctDAO;
	}
	
	@Override
	public LtctVO getLtctByLtctNo(String ltctNo) throws Exception {

		LtctVO ltct = ltctDAO.selectLtctByLtctNo(ltctNo);
		return ltct;
	}

	@Override
	public String getLtctStatusNo(LtctStatsVO ltctStats) throws Exception {
		return ltctDAO.selectLtctStatusNo(ltctStats);
	}

	@Override
	public String selectLtctStatusNoByQuery(String ltctNo) throws Exception {
		return ltctDAO.selectLtctStatusNoByQuery(ltctNo);
	}

	@Override
	public int selectOutIsoptntCnt(String ltctNo) throws Exception {
		
		return ltctDAO.selectOutIsoptntCnt(ltctNo);
	}

	@Override
	public void modifyOutIsoptntCnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateOutIsoptntCnt(ltctStats);
	}

	@Override
	public List<String> getLtctNoList() throws Exception {
		return ltctDAO.selectAllLtctNo();
	}

	@Override
	public int getTotIsoptntCnt(String ltctNo) throws Exception {
		return ltctDAO.selectTotIsoptntCnt(ltctNo);
	}

	@Override
	public void modifyTotIsoptntCnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateTotIsoptntCnt(ltctStats);
	}
	

	@Override
	public int getRlsedCnt(String ltctNo) throws Exception {
		return ltctDAO.selectRlsedCnt(ltctNo);
	}

	@Override
	public void modifyRlsedCnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateRlsedCnt(ltctStats);
	}

	@Override
	public void modifyReqDgnssAndInIsoptnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateReqDgnssAndInIsoptnt(ltctStats);
	}

	@Override
	public void modifyReqDgnssCnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateReqDgnssCnt(ltctStats);
	}

	@Override
	public void modifyInIsoptntCnt(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.updateInIsoptntCnt(ltctStats);
	}
	
	

}
