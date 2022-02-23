package com.spring.compass.service;

import java.util.List;

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.vo.PbhtStatsVO;
import com.spring.compass.vo.PbhtVO;

public interface PbhtService {

	public PbhtVO getPbhtByInstNo(String instNo) throws Exception;
	
	public String getPbhtCityNo(String city) throws Exception;
	
	public int getPbhtSeqNo() throws Exception;
	
	public int getInstSeqNo() throws Exception;
	
	public int registPbht(PbhtVO pbht) throws Exception;
	
	public int registInst(PbhtVO pbht) throws Exception;
	
	public String getPbhtStatsSeq() throws Exception;
	
	public List<String> getPbhtNoList() throws Exception;
	
	public void registPbhtStats(PbhtStatsVO pbhtStats) throws Exception;
	
	public String getPbhtStatsNo(PbhtStatsVO pbhtStats) throws Exception;
	
	public void modifyPbhtStats(PbhtStatsVO pbhtStats) throws Exception;
	
	public List<PbhtVO> getPbhtBackList() throws Exception;
	
	VPstiCommand getPstiByManageNo(String manageNo) throws Exception;
}
