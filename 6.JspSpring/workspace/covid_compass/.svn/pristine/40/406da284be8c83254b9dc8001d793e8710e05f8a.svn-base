package com.spring.compass.service;

import java.util.List;
import java.util.Map;

import com.spring.compass.command.ConfirmationVO;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.TestResultCheckVO;

public interface PstiService {

	public PstiVO getPstiByPstiNo(String pstiNo) throws Exception;
	
	public PstiVO getPstiByManageNo(String manageNo) throws Exception;
	
	public List<PstiVO> getPstiListByInspNo(String inspNo) throws Exception;
	
	public int registPsti(PstiVO psti) throws Exception;
	
	public String getPstiNextVal() throws Exception;
	
	public String getPstiCityNo(String city)throws Exception;
	
	public Map<String, Object> getinspList(SearchCriteria cri)throws Exception;
	
	public TestResultCheckVO getTestResultCheck(TestResultCheckVO testResultCheckVO)throws Exception;
	
	public ConfirmationVO getConfirmation(PstiVO psti)throws Exception;
	
	public int getConfirmationCheck(PstiVO psti)throws Exception;
	
	public int getQuestCheck(PstiVO psti)throws Exception;
	
	public int getregistPstiCheck(PstiVO psti)throws Exception;
	
	public int registPstiUpdate(PstiVO psti)throws Exception;
	
}
