package com.spring.compass.service;

import java.sql.SQLException;

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.dao.PstiDAO;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SmplResultVO;

public class PstiServiceImplLKH extends PstiServiceImpl implements PstiServiceLKH{

	private PstiDAO pstiDAO;
	public void setPstiDAO(PstiDAO pstiDAO) {
		this.pstiDAO = pstiDAO;
	}
	
	@Override
	public VPstiCommand getVPstiByPstiNo(String pstiNo) throws Exception {
		VPstiCommand vPsti = pstiDAO.selectVPstiByPstiNo(pstiNo);
		return vPsti;
	}

	@Override
	public VPstiCommand getVPstiByManageNo(String manageNo) throws Exception {
		VPstiCommand vPsti = pstiDAO.selectVPstiByManageNo(manageNo);
		return vPsti;
	}

	@Override
	public SmplResultVO getVSmplResultByManageNo(String manageNo) throws Exception {
		SmplResultVO smplRes = pstiDAO.selectVSmplResultByManageNo(manageNo);
		return smplRes;
	}

	@Override
	public SmplResultVO getVSmplResultBySmplNo(String smplNo) throws Exception {
		SmplResultVO smplRes = pstiDAO.selectVSmplResultBySmplNo(smplNo);
		return smplRes;
	}

	@Override
	public DgnssResultVO getVDgnssResultByDgnssNo(String dgnssNo) throws Exception {
		DgnssResultVO dgnssRes = pstiDAO.selectVDgnssResultByDgnssNo(dgnssNo);
		return dgnssRes;
	}

	@Override
	public DgnssResultVO getVDgnssResultByManageNo(String manageNo) throws Exception {
		DgnssResultVO dgnssRes = pstiDAO.selectVDgnssResultByManageNo(manageNo);
		return dgnssRes;
	}

	@Override
	public SckbdreqVO getSckbdreqBySckbdreqNo(String sckbdreqNo) throws Exception {
		SckbdreqVO sckbdreq = pstiDAO.selectSckbdreqBySckbdreqNo(sckbdreqNo); 
		return sckbdreq;
	}

	@Override
	public SckbdreqVO getSckbdreqByManageNo(String manageNo) throws Exception {
		SckbdreqVO sckbdreq = pstiDAO.selectSckbdreqByManageNo(manageNo);
		return sckbdreq;
	}

	@Override
	public InptntVO getInptntByManageNo(String manageNo) throws Exception {
		InptntVO inptnt = pstiDAO.selectInptntByManageNo(manageNo);
		return inptnt;
	}

	@Override
	public InptntVO getInptntByInptntNo(String inptntNo) throws Exception {
		InptntVO inptnt = pstiDAO.selectInptntByInptntNo(inptntNo);
		return inptnt;
	}

	@Override
	public String getInptntNextVal() throws SQLException {
		String inptntNo = pstiDAO.selectInptntNextVal();
		return inptntNo;
	}

	@Override
	public String getDgnssNextVal() throws SQLException {
		String dgnssNo = pstiDAO.selectDgnssNextVal();
		return dgnssNo;
	}

	@Override
	public String getSckbdreqNextVal() throws SQLException {
		String sckbdreqNo = pstiDAO.selectSckbdreqNextVal();
		return sckbdreqNo;
	}

	@Override
	public String getSlfptntNextVal() throws SQLException {
		String slfptntNo = pstiDAO.selectSlfptntNextVal();
		return slfptntNo;
	}

	@Override
	public String getSmplNextVal() throws SQLException {
		String smplNo = pstiDAO.selectSmplNextVal();
		return smplNo;
	}

	@Override
	public String getManageNextVal() throws SQLException {
		String manageNo = pstiDAO.selectManageNextVal();
		return manageNo;
	}

	@Override
	public String getHtscNextVal() throws SQLException {
		String htscNo = pstiDAO.selectHtscNextVal();
		return htscNo;
	}

	@Override
	public String getCnfmNextVal() throws SQLException {
		String cnfmNo = pstiDAO.selectCnfmNextVal();
		return cnfmNo;
	}

	@Override
	public ManageVO getManageByManageNo(String manageNo) throws SQLException {
		ManageVO manage = pstiDAO.selectManageByManageNo(manageNo);
		return manage;
	}

	@Override
	public String getIsoptntNextVal() throws SQLException {
		String isoptntNo = pstiDAO.selectIsoptntNextVal();
		return isoptntNo;
	}

	@Override
	public IsoptntVO getIsoptntByIsoptntNo(String isoptntNo) throws Exception {
		IsoptntVO isoptnt = pstiDAO.selectIsoptntByIsoptntNo(isoptntNo);
		return isoptnt;
	}

	@Override
	public IsoptntVO getIsoptntByManageNo(String manageNo) throws Exception {
		IsoptntVO isoptnt = pstiDAO.selectIsoptntByManageNo(manageNo);
		return isoptnt;
	}

	@Override
	public CnfmVO getCnfmByManageNo(String manageNo) throws SQLException {
		CnfmVO cnfm = pstiDAO.selectCnfmByManageNo(manageNo);
		return cnfm;
	}

	@Override
	public CnfmVO getCnfmByCnfmNo(String cnfmNo) throws SQLException {
		CnfmVO cnfm = pstiDAO.selectCnfmByManageNo(cnfmNo);
		return cnfm;
	}

}
