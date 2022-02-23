package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.compass.command.ConfirmationVO;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SmplResultVO;
import com.spring.compass.vo.TestResultCheckVO;

public interface PstiDAO {
	
	public PstiVO selectPstiByPstiNo(String pstiNo) throws SQLException;
	
	public PstiVO selectPstiByManageNo(String manageNo) throws SQLException;
	
	public List<PstiVO> selectPstiListByInspNo(String inspNo) throws SQLException;
	
	public int registPsti(PstiVO psti) throws SQLException;
	
	public String selectPstiNextVal()throws SQLException;
	
	public String selectPstiCityNo(String city)throws SQLException;
	
	public List<InspVO> selectInspList(SearchCriteria cri)throws SQLException;
	
	public int selectSearchInspListCount(SearchCriteria cri)throws SQLException;
	
	public VPstiCommand selectVPstiByPstiNo(String pstiNo) throws SQLException;
	
	public VPstiCommand selectVPstiByManageNo(String manageNo) throws SQLException;
	
	public SmplResultVO selectVSmplResultBySmplNo(String smplNo) throws SQLException;
	
	public SmplResultVO selectVSmplResultByManageNo(String manageNo) throws SQLException;
	
	public DgnssResultVO selectVDgnssResultByManageNo(String manageNo) throws SQLException;
	
	public DgnssResultVO selectVDgnssResultByDgnssNo(String dgnssNo) throws SQLException;
	
	public SckbdreqVO selectSckbdreqBySckbdreqNo(String sckbdreqNo) throws SQLException;
	
	public SckbdreqVO selectSckbdreqByManageNo(String manageNo) throws SQLException;
	
	public TestResultCheckVO selectTestResultCheck(TestResultCheckVO testResultCheckVO) throws SQLException;
	
	public InptntVO selectInptntByManageNo(String manageNo) throws SQLException;

	public InptntVO selectInptntByInptntNo(String inptntNo) throws SQLException;
	
	public IsoptntVO selectIsoptntByIsoptntNo(String isoptntNo) throws SQLException;
	
	public IsoptntVO selectIsoptntByManageNo(String manageNo) throws SQLException;
	
	// get Sequences
	public String selectInptntNextVal() throws SQLException;
	public String selectDgnssNextVal() throws SQLException;
	public String selectSckbdreqNextVal() throws SQLException;
	public String selectSlfptntNextVal() throws SQLException;
	public String selectSmplNextVal() throws SQLException;
	public String selectManageNextVal() throws SQLException;
	public String selectHtscNextVal() throws SQLException;
	public String selectCnfmNextVal() throws SQLException;
	public String selectIsoptntNextVal() throws SQLException;
	
	public ManageVO selectManageByManageNo(String manageNo) throws SQLException;
	public CnfmVO selectCnfmByCnfmNo(String cnfmNo) throws SQLException;
	public CnfmVO selectCnfmByManageNo(String manageNo) throws SQLException;
	
	public ConfirmationVO selectConfirmation(PstiVO psti) throws SQLException;
	
	public int selectConfirmationCheck(PstiVO psti)throws SQLException;
	
	public int selectQuestCheck(PstiVO psti)throws SQLException;
	
	public int registPstiCheck(PstiVO psti)throws SQLException;
	
	public int registPstiUpdate(PstiVO psti)throws SQLException;
	
	
}
