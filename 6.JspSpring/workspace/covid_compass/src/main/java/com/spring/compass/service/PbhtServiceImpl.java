package com.spring.compass.service;


import java.util.List;

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.dao.PbhtDAO;
import com.spring.compass.vo.PbhtStatsVO;
import com.spring.compass.vo.PbhtVO;

public class PbhtServiceImpl implements PbhtService{
	
	private PbhtDAO pbhtDAO;
	public void setPbhtDAO(PbhtDAO pbhtDAO) {
		this.pbhtDAO = pbhtDAO;
	}
	@Override
	public PbhtVO getPbhtByInstNo(String instNo) throws Exception {
		PbhtVO pbht = pbhtDAO.selectPbhtByInstNo(instNo);
		return pbht;
	}
	@Override
	public String getPbhtCityNo(String city) throws Exception {
		String cityNo = pbhtDAO.selectPbhtCityNo(city);
		return cityNo;
	}
	@Override
	public int getPbhtSeqNo() throws Exception {
		int pbhtSeq = pbhtDAO.selectPbhtNextVal();
		return pbhtSeq;
	}
	@Override
	public int getInstSeqNo() throws Exception {
		int instSeq = pbhtDAO.selectInstNextval();
		return instSeq;
	}
	@Override
	public int registPbht(PbhtVO pbht) throws Exception {
		int result = pbhtDAO.insertPbht(pbht);
		return result;
	}
	@Override
	public int registInst(PbhtVO pbht) throws Exception {
		int result = pbhtDAO.insertInst(pbht);
		return result;
	}
	@Override
	public String getPbhtStatsSeq() throws Exception {
		String pbhtStatsNo = pbhtDAO.selectPbhtStatsSeq();
		return pbhtStatsNo;
	}
	@Override
	public List<String> getPbhtNoList() throws Exception {
		List<String> pbhtNoList = pbhtDAO.selectAllPbhtNo();
		return pbhtNoList;
	}
	@Override
	public void registPbhtStats(PbhtStatsVO pbhtStats) throws Exception {
		pbhtDAO.insertPbhtStats(pbhtStats);
	}
	@Override
	public String getPbhtStatsNo(PbhtStatsVO pbhtStats) throws Exception {
		String pbhtStatsNo = pbhtDAO.selectPbhtStatsNo(pbhtStats);
		return pbhtStatsNo;
	}
	@Override
	public void modifyPbhtStats(PbhtStatsVO pbhtStats) throws Exception {
		pbhtDAO.updatePbhtStats(pbhtStats);
	}
	@Override
	public List<PbhtVO> getPbhtBackList() throws Exception {
		List<PbhtVO> pbhtBackupList = pbhtDAO.selectPbhtBackup();
		return pbhtBackupList;
	}
	@Override
	public VPstiCommand getPstiByManageNo(String manageNo) throws Exception {
		return pbhtDAO.selectPstiByManageNo(manageNo);
	}

}
