package com.spring.compass.service;

import java.sql.SQLException;

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SmplResultVO;

public interface PstiServiceLKH extends PstiService{
	
	public VPstiCommand getVPstiByPstiNo(String pstiNo) throws Exception;

	public VPstiCommand getVPstiByManageNo(String manageNo) throws Exception;

	public SmplResultVO getVSmplResultByManageNo(String manageNo) throws Exception;

	public SmplResultVO getVSmplResultBySmplNo(String smplNo) throws Exception;
	
	public DgnssResultVO getVDgnssResultByDgnssNo(String dgnssNo) throws Exception;
	
	public DgnssResultVO getVDgnssResultByManageNo(String manageNo) throws Exception;
	
	public SckbdreqVO getSckbdreqBySckbdreqNo(String sckbdreqNo) throws Exception;
	
	public SckbdreqVO getSckbdreqByManageNo(String manageNo) throws Exception;
	
	public InptntVO getInptntByManageNo(String manageNo) throws Exception;
	
	public InptntVO getInptntByInptntNo(String inptntNo) throws Exception;
	
	public IsoptntVO getIsoptntByIsoptntNo(String isoptntNo) throws Exception;
	
	public IsoptntVO getIsoptntByManageNo(String manageNo) throws Exception;
	
	// get Sequences
	public String getInptntNextVal() throws SQLException;
	public String getDgnssNextVal() throws SQLException;
	public String getSckbdreqNextVal() throws SQLException;
	public String getSlfptntNextVal() throws SQLException;
	public String getSmplNextVal() throws SQLException;
	public String getManageNextVal() throws SQLException;
	public String getHtscNextVal() throws SQLException;
	public String getCnfmNextVal() throws SQLException;	
	public String getIsoptntNextVal() throws SQLException;	
	
	public ManageVO getManageByManageNo(String manageNo) throws SQLException;
	public CnfmVO getCnfmByManageNo(String manageNo) throws SQLException;
	public CnfmVO getCnfmByCnfmNo(String cnfmNo) throws SQLException;
}
