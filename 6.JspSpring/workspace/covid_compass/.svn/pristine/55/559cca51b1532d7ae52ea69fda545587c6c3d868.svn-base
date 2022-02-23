package com.spring.compass.service;

import java.util.List;
import java.util.Map;

import com.spring.compass.command.InspPstiRegistCommand;
import com.spring.compass.command.InspPstiSearchCommand;
import com.spring.compass.command.InspSmplRequestCommand;
import com.spring.compass.command.VInspPstiVO;
import com.spring.compass.vo.InspChckdVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspResultVO;
import com.spring.compass.vo.InspStatsVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.KitHistVO;
import com.spring.compass.vo.PcrKitVO;

public interface InspService {
	
	public InspVO getInspByInstNo(String instNo) throws Exception;
	
	public InspVO getInspByInspNo(String inspNo) throws Exception;
	
	public String getInspCityNo(String city) throws Exception;
	
	public String getInspSeqNo() throws Exception;
	
	public String getInstSeqNo() throws Exception;
	
	public int registInsp(InspVO insp) throws Exception;
	
	public int registInst(InspVO insp) throws Exception;
	
	public String getResponsibleAgency(String responsi) throws Exception;
	
	public Map<String, Object> getPstiListPage(InspPstiSearchCommand cri) throws Exception;
	
	public Map<String, Object> getChckdListPage(InspPstiSearchCommand cri) throws Exception;
	
	public Map<String, Object> getResultListPage(InspPstiSearchCommand cri) throws Exception;

	public InspPstiVO getPstiDetail(String pstiNo) throws Exception;
	
	public InspChckdVO getChckdDetail(String pstiNo) throws Exception;
	
	public InspResultVO getResultDetail(String pstiNo) throws Exception;
	
	public Map<String, Object> getPcrKitList(InspPstiSearchCommand cri) throws Exception;
	
	public int getPcrKitCount(String inspNo) throws Exception;
	
	public int getTotalKitCount(String inspNo) throws Exception;
	
	void modifyPstiInfo(InspPstiVO psti) throws Exception;
	
	void registQuestion(InspPstiRegistCommand questionInfo) throws Exception;
	
	void registRequestSmpl(InspSmplRequestCommand smplRequestInfo) throws Exception;
	
	String getManageNoByPstiNo(String pstiNo) throws Exception;
	
	void registKitHist(KitHistVO kitHist) throws Exception;
	
	public List<String> inspNoList() throws Exception;
	
	public String getInspStatsSeq() throws Exception;
	
	public void registInspStats(InspStatsVO inspstats) throws Exception;
	
	public String getInspStatsNo(InspStatsVO inspstats) throws Exception;
	
	public void modifyInspStats(InspStatsVO inspstats) throws Exception;
	
	public List<InspVO> getInspListBackup() throws Exception;
	
	public InspResultVO getPbhtInfoByPbhtNo(String pbhtNo) throws Exception;
	
	public List<InspStatsVO> getInspStatsByInspNo(String inspNo) throws Exception;
	
	InspPstiVO getModifyCancel(String pstiNo) throws Exception;
	
	InspPstiVO getResultByManageNo(String manageNo) throws Exception;
	
	public String getSelectInspNm(String inspNo) throws Exception;
	
	void removePsti() throws Exception;
}

