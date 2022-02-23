package com.spring.compass.service;

import java.util.List;

import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;

public interface LtctServiceLKH extends LtctService{

	public LtctVO getLtctByLtctNo(String ltctNo) throws Exception;
	
	public String getLtctStatusNo(LtctStatsVO ltctStats) throws Exception;
	
	public String selectLtctStatusNoByQuery(String ltctNo) throws Exception;
	
	public int selectOutIsoptntCnt(String ltctNo) throws Exception;
	
	public void modifyOutIsoptntCnt(LtctStatsVO ltctStats) throws Exception;
	
	public List<String> getLtctNoList() throws Exception;
	
	public int getTotIsoptntCnt(String ltctNo) throws Exception;
	
	public void modifyTotIsoptntCnt(LtctStatsVO ltctStats) throws Exception;
	
	public int getRlsedCnt(String ltctNo) throws Exception;
	
	public void modifyRlsedCnt(LtctStatsVO ltctStats) throws Exception;
	
	public void modifyReqDgnssAndInIsoptnt(LtctStatsVO ltctStats) throws Exception;
	
	public void modifyReqDgnssCnt(LtctStatsVO ltctStats) throws Exception;

	public void modifyInIsoptntCnt(LtctStatsVO ltctStats) throws Exception;
}
