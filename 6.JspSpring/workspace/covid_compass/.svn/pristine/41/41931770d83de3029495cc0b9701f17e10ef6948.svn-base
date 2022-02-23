package com.spring.compass.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.MberVO;

public interface HsptService {

	public HsptVO getHsptByInstNo(String instNo) throws Exception;

	public Map<String, Object> getInptntListPage(InptntListSearchCommand cri) throws Exception;

	public String getHsptCityNo(String city) throws Exception;

	public int getHsptSeqNo() throws Exception;

	public int getInstSeqNo() throws Exception;

	public int registHspt(HsptVO hspt) throws Exception;

	public int registInst(InstVO inst) throws Exception;

	public int modifySckbdCnt(HsptVO hspt)throws Exception;
	
	public String getHsptStatsSeq() throws Exception;
	
	public List<String> getAllHsptNo() throws Exception;
	
	public void registHsptStats(HsptStatsVO hsptStats) throws Exception;
	
	public int getOutCnt(InptntstatsVO inptnt) throws Exception;
	
	public int getDeathCnt(InptntstatsVO inptnt) throws Exception;
	
	public int getCurInptntCnt(InptntstatsVO inptnt) throws Exception;
	
	public int getAllInptntCnt(String hsptNo) throws Exception;
	
	public int getRmndSckbdCnt(String hsptNo) throws Exception;
	
	public int getSckbdCnt(String hsptNo) throws Exception;
	
	public String getHsptStatusNo(HsptStatsVO hsptstats) throws Exception;
	
	public void modifyHsptStats(HsptStatsVO hsptStats) throws Exception;
	
	public List<HsptVO> getHsptBackupList() throws Exception;
	
	public HsptVO getHsptByHsptNo(String hsptNo) throws Exception;
	
	public int getRlsedCnt(InptntstatsVO inptnt) throws Exception;
	
	public void modifyHsptStatsDgnssCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsReqSckbdCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsInptntCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsGoLtctCnt(HsptStatsVO hsptStats) throws Exception;

	public void modifyHsptStatsGoSlfCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsOutCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsDeathCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsRlsedCnt(HsptStatsVO hsptStats) throws Exception;
	
	public void modifyHsptStatsByQuery(HsptStatsVO hsptStats) throws Exception;
	
}
