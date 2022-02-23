package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.ConfirmationVO;
import com.spring.compass.command.PageMaker;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.dao.PstiDAO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.TestResultCheckVO;

public class PstiServiceImpl implements PstiService{

	private PstiDAO pstiDAO;
	public void setPstiDAO(PstiDAO pstiDAO) {
		this.pstiDAO = pstiDAO;
	}
	
	@Override
	public PstiVO getPstiByPstiNo(String pstiNo) throws Exception {
		PstiVO psti = pstiDAO.selectPstiByPstiNo(pstiNo);
		return psti;
	}

	@Override
	public PstiVO getPstiByManageNo(String manageNo) throws Exception {
		PstiVO psti = pstiDAO.selectPstiByManageNo(manageNo);
		return psti;
	}

	@Override
	public List<PstiVO> getPstiListByInspNo(String inspNo) throws Exception {
		
		List<PstiVO> pstiList = pstiDAO.selectPstiListByInspNo(inspNo);
		
		return pstiList;
	}
	
	@Override
	public int registPsti(PstiVO psti) throws Exception {
		int cnt = pstiDAO.registPsti(psti);
		return cnt;
	}

	@Override
	public String getPstiNextVal() throws Exception {
		
		String instNo = pstiDAO.selectPstiNextVal();
		
		return instNo;
	}

	@Override
	public String getPstiCityNo(String city) throws Exception {
		
		String cityNo = pstiDAO.selectPstiCityNo(city);
		
		return cityNo;
	}

	@Override
	public Map<String, Object> getinspList(SearchCriteria cri) throws Exception {
		Map<String, Object> dataMap = null;
		
		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = pstiDAO.selectSearchInspListCount(cri);
		
		System.out.println(totalCount);
		
		pageMaker.setTotalCount(totalCount);
		
		List<InspVO> inspList = pstiDAO.selectInspList(cri);
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("inspList", inspList);
		dataMap.put("pageMaker", pageMaker);
		
		System.out.println(pageMaker);
		
		for(InspVO insp : inspList) {
			System.out.println(insp);
		}
		
		return dataMap;
	}

	@Override
	public TestResultCheckVO getTestResultCheck(TestResultCheckVO testResultCheckVO) throws Exception {
		
		TestResultCheckVO trcRes = pstiDAO.selectTestResultCheck(testResultCheckVO);
		
		
		return trcRes;
	}

	@Override
	public ConfirmationVO getConfirmation(PstiVO psti) throws Exception {
		
		ConfirmationVO confirmation = pstiDAO.selectConfirmation(psti);
		
		return confirmation;
	}

	@Override
	public int getConfirmationCheck(PstiVO psti) throws Exception {
		int result = pstiDAO.selectConfirmationCheck(psti);
		return result;
	}

	@Override
	public int getQuestCheck(PstiVO psti) throws Exception {
		int result = pstiDAO.selectQuestCheck(psti);
		return result;
	}

	@Override
	public int getregistPstiCheck(PstiVO psti) throws Exception {
		int result = pstiDAO.registPstiCheck(psti);
		return result;
	}

	@Override
	public int registPstiUpdate(PstiVO psti) throws Exception {
		int result = pstiDAO.registPstiUpdate(psti);
		return result;
	}



}
