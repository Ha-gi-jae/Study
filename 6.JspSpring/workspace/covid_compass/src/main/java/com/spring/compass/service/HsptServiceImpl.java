package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InptntListVO;
import com.spring.compass.command.PageMaker;
import com.spring.compass.dao.AdminDAO;
import com.spring.compass.dao.HsptDAO;
import com.spring.compass.dao.MberDAO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.MberVO;

public class HsptServiceImpl implements HsptService{

	private HsptDAO hsptDAO;
	public void setHsptDAO(HsptDAO hsptDAO) {
		this.hsptDAO = hsptDAO;
	}
	
	@Override
	public HsptVO getHsptByInstNo(String instNo) throws Exception {
		HsptVO hspt = hsptDAO.selectHsptByInstNo(instNo);
		double capacity = Math.floor((hspt.getRmndSckbdCnt()/(double)hspt.getSckbdCnt())*100);
		hspt.setCapacity(capacity);
		return hspt;
	}
	
	@Override
	public HsptVO getHsptByHsptNo(String hsptNo) throws Exception {
		HsptVO hspt = hsptDAO.selectHsptByHsptNo(hsptNo);
		return hspt;
	}
	
	@Override
	public Map<String, Object> getInptntListPage(InptntListSearchCommand cri) throws Exception {

		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);


		System.out.println(hsptDAO == null);


		int totalCount = hsptDAO.selectInptntListCount(cri);

		System.out.println(totalCount);

		pageMaker.setTotalCount(totalCount);

		List<InptntListVO> reqInptntList = hsptDAO.selectInptntList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("reqInptntList", reqInptntList);
		dataMap.put("pageMaker", pageMaker);

		System.out.println(pageMaker);

		for(InptntListVO inptnt : reqInptntList) {
			System.out.println(inptnt);
		}

		return dataMap;
	}
	@Override
	public String getHsptCityNo(String city) throws Exception {
		String cityNo = hsptDAO.selectHsptCityNo(city);
		return cityNo;
	}
	@Override
	public int getHsptSeqNo() throws Exception {
		int hstpSeq = hsptDAO.selectHsptNextVal();
		return hstpSeq;
	}
	@Override
	public int getInstSeqNo() throws Exception {
		int instSeq = hsptDAO.selectInstNextval();
		return instSeq;
	}
	@Override
	public int registHspt(HsptVO hspt) throws Exception {
		int result = hsptDAO.insertHspt(hspt);
		return result;
	}
	@Override
	public int registInst(InstVO inst) throws Exception {
		int result = hsptDAO.insertInst(inst);
		return result;
	}

	@Override
	public int modifySckbdCnt(HsptVO hspt) throws Exception {
		int result = hsptDAO.updateSckbdModify(hspt);
		return result;
	}

	@Override
	public String getHsptStatsSeq() throws Exception {
		return hsptDAO.selectHsptStatsSeq();
	}

	@Override
	public List<String> getAllHsptNo() throws Exception {
		List<String> hsptNoList = hsptDAO.selectAllHsptNo();
		return hsptNoList;
	}

	@Override
	public void registHsptStats(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.insertHsptStats(hsptStats);
	}

	@Override
	public int getOutCnt(InptntstatsVO inptnt) throws Exception {
		return hsptDAO.selectOutCnt(inptnt);
	}

	@Override
	public int getDeathCnt(InptntstatsVO inptnt) throws Exception {
		return hsptDAO.selectDeathCnt(inptnt);
	}

	@Override
	public int getCurInptntCnt(InptntstatsVO inptnt) throws Exception {
		return hsptDAO.selectCurInptntCnt(inptnt);
	}

	@Override
	public int getAllInptntCnt(String hsptNo) throws Exception {
		return hsptDAO.selectAllInptntCnt(hsptNo);
	}

	@Override
	public int getRmndSckbdCnt(String hsptNo) throws Exception {
		return hsptDAO.selectRmndSckbdCnt(hsptNo);
	}

	@Override
	public int getSckbdCnt(String hsptNo) throws Exception {
		return hsptDAO.selectSckbdCnt(hsptNo);
	}

	@Override
	public String getHsptStatusNo(HsptStatsVO hsptstats) throws Exception {
		return hsptDAO.selectHsptStatusNo(hsptstats);
	}

	@Override
	public void modifyHsptStats(HsptStatsVO hsptStats) throws Exception {
		 hsptDAO.updateHsptStats(hsptStats);
	}

	@Override
	public List<HsptVO> getHsptBackupList() throws Exception {
		List<HsptVO> hsptBackupList = hsptDAO.selectHsptBackupList();
		return hsptBackupList;
	}

	@Override
	public int getRlsedCnt(InptntstatsVO inptnt) throws Exception {
		
		return hsptDAO.selectRlsedCnt(inptnt);
	}

	@Override
	public void modifyHsptStatsDgnssCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsDgnssCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsReqSckbdCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsReqSckbdCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsInptntCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsInptntCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsGoLtctCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsGoLtctCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsGoSlfCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsGoSlfCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsOutCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsOutCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsDeathCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsDeathCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsRlsedCnt(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsRlsedCnt(hsptStats);
	}

	@Override
	public void modifyHsptStatsByQuery(HsptStatsVO hsptStats) throws Exception {
		hsptDAO.updateHsptStatsByQuery(hsptStats);
	}



}
