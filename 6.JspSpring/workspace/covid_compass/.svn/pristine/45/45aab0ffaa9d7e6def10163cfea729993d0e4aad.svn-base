package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

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

public class PstiDAOImpl implements PstiDAO{
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private String nameSpace = "Psti-Mapper.";
	@Override
	public PstiVO selectPstiByPstiNo(String pstiNo) throws SQLException {
		PstiVO psti = sqlSession.selectOne(nameSpace + "selectPstiByPstiNo", pstiNo);
		return psti;
	}
	
	@Override
	public PstiVO selectPstiByManageNo(String manageNo) throws SQLException {
		PstiVO psti = sqlSession.selectOne(nameSpace + "selectPstiByManageNo", manageNo);
		return psti;
	}
	
	@Override
	public List<PstiVO> selectPstiListByInspNo(String inspNo) throws SQLException {
		
		RowBounds rowBound = new RowBounds(0, 15);
		
		List<PstiVO> pstiList = sqlSession.selectList(nameSpace + "selectPstiListByInspNo", inspNo, rowBound);
		return pstiList;
	}

	@Override
	public int registPsti(PstiVO psti) throws SQLException {
		
		int cnt = sqlSession.update(nameSpace + "registPsti", psti);

		return cnt;
	}

	@Override
	public String selectPstiNextVal() throws SQLException {
		
		String instNo = sqlSession.selectOne(nameSpace + "selectPstiNextVal"); 
		
		return instNo;
	}
	

	@Override
	public List<InspVO> selectInspList(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);		
		
		List<InspVO> inspList =
				sqlSession.selectList(nameSpace + "selectInspList",cri,rowBounds);
		return inspList;
	}

	@Override
	public int selectSearchInspListCount(SearchCriteria cri) throws SQLException {
		int count=sqlSession.selectOne(nameSpace + "selectSearchInspListCount",cri);
		return count;
	}
	
	@Override
	public VPstiCommand selectVPstiByPstiNo(String pstiNo) throws SQLException {
		VPstiCommand vPsti = sqlSession.selectOne(nameSpace + "selectVPstiByPstiNo", pstiNo);
		return vPsti;
	}

	@Override
	public VPstiCommand selectVPstiByManageNo(String manageNo) throws SQLException {
		VPstiCommand vPsti = sqlSession.selectOne(nameSpace + "selectVPstiByManageNo", manageNo);
		return vPsti;
	}

	@Override
	public SmplResultVO selectVSmplResultBySmplNo(String smplNo) throws SQLException {
		SmplResultVO smplRes = sqlSession.selectOne(nameSpace + "selectVSmplResultBySmplNo", smplNo);
		return smplRes;
	}

	@Override
	public SmplResultVO selectVSmplResultByManageNo(String manageNo) throws SQLException {
		SmplResultVO smplRes = sqlSession.selectOne(nameSpace + "selectVSmplResultByManageNo", manageNo);
		return smplRes;
	}

	@Override
	public DgnssResultVO selectVDgnssResultByManageNo(String manageNo) throws SQLException {
		DgnssResultVO dgnssRes = sqlSession.selectOne(nameSpace + "selectVDgnssResultByManageNo", manageNo);
		return dgnssRes;
	}

	@Override
	public DgnssResultVO selectVDgnssResultByDgnssNo(String dgnssNo) throws SQLException {
		DgnssResultVO dgnssRes = sqlSession.selectOne(nameSpace + "selectVDgnssResultByDgnssNo", dgnssNo);
		return dgnssRes;
	}
	@Override
	public String selectPstiCityNo(String city) throws SQLException {
		String cityNo = sqlSession.selectOne(nameSpace + "selectPstiCityNo", city);
		
		return cityNo;
	}


	@Override
	public SckbdreqVO selectSckbdreqBySckbdreqNo(String sckbdreqNo) throws SQLException {
		SckbdreqVO sckbdreq = sqlSession.selectOne(nameSpace + "selectSckbdreqBySckbdreqNo", sckbdreqNo);
		return sckbdreq;
	}

	@Override
	public SckbdreqVO selectSckbdreqByManageNo(String manageNo) throws SQLException {
		SckbdreqVO sckbdreq = sqlSession.selectOne(nameSpace + "selectSckbdreqByManageNo", manageNo);
		return sckbdreq;
	}
	@Override
	public TestResultCheckVO selectTestResultCheck(TestResultCheckVO testResultCheckVO) throws SQLException {
		TestResultCheckVO trcRes = sqlSession.selectOne(nameSpace + "selectTestResultCheck", testResultCheckVO );
		return trcRes;
	}

	@Override
	public InptntVO selectInptntByManageNo(String manageNo) throws SQLException {
		InptntVO inptnt = sqlSession.selectOne(nameSpace + "selectInptntByManageNo", manageNo);
		return inptnt;
	}

	@Override
	public InptntVO selectInptntByInptntNo(String inptntNo) throws SQLException {
		InptntVO inptnt = sqlSession.selectOne(nameSpace + "selectInptntByInptntNo", inptntNo);
		return inptnt;
	}

	@Override
	public String selectInptntNextVal() throws SQLException {
		String inptntNo = sqlSession.selectOne(nameSpace + "selectInptntNextVal");
		return inptntNo;
	}

	@Override
	public String selectDgnssNextVal() throws SQLException {
		String dgnssNo = sqlSession.selectOne(nameSpace + "selectDgnssNextVal");
		return dgnssNo;
	}

	@Override
	public String selectSckbdreqNextVal() throws SQLException {
		String sckbdreqNo = sqlSession.selectOne(nameSpace + "selectSckbdreqNextVal");
		return sckbdreqNo;
	}

	@Override
	public String selectSlfptntNextVal() throws SQLException {
		String slfptntNo = sqlSession.selectOne(nameSpace + "selectSlfptntNextVal");
		return slfptntNo;
	}

	@Override
	public String selectSmplNextVal() throws SQLException {
		String smplNo = sqlSession.selectOne(nameSpace + "selectSmplNextVal");
		return smplNo;
	}

	@Override
	public String selectManageNextVal() throws SQLException {
		String manageNo = sqlSession.selectOne(nameSpace + "selectManageNextVal");
		return manageNo;
	}

	@Override
	public String selectHtscNextVal() throws SQLException {
		String htscNo = sqlSession.selectOne(nameSpace + "selectHtscNextVal");
		return htscNo;
	}

	@Override
	public String selectCnfmNextVal() throws SQLException {
		String cnfmNo = sqlSession.selectOne(nameSpace + "selectCnfmNextVal");
		return cnfmNo;
	}

	@Override
	public ManageVO selectManageByManageNo(String manageNo) throws SQLException {
		ManageVO manage = sqlSession.selectOne(nameSpace + "selectManageByManageNo", manageNo);
		return manage;
	}

	@Override
	public String selectIsoptntNextVal() throws SQLException {
		String isoptntNo = sqlSession.selectOne(nameSpace + "selectIsoptntNextVal");
		return isoptntNo;		
	}

	@Override
	public IsoptntVO selectIsoptntByIsoptntNo(String isoptntNo) throws SQLException {
		IsoptntVO isoptnt = sqlSession.selectOne(nameSpace + "selectIsoptntByIsoptntNo", isoptntNo);
		return isoptnt;
	}

	@Override
	public IsoptntVO selectIsoptntByManageNo(String manageNo) throws SQLException {
		IsoptntVO isoptnt = sqlSession.selectOne(nameSpace + "selectIsoptntByManageNo", manageNo);
		return isoptnt;
	}

	@Override
	public CnfmVO selectCnfmByCnfmNo(String cnfmNo) throws SQLException {
		CnfmVO cnfm = sqlSession.selectOne(nameSpace + "selectCnfmByCnfmNo", cnfmNo);
		return cnfm;
	}

	@Override
	public CnfmVO selectCnfmByManageNo(String manageNo) throws SQLException {
		CnfmVO cnfm = sqlSession.selectOne(nameSpace + "selectCnfmByManageNo", manageNo);
		return cnfm;
	}

	@Override
	public ConfirmationVO selectConfirmation(PstiVO psti) throws SQLException {
		ConfirmationVO confirmation = sqlSession.selectOne(nameSpace + "selectConfirmation", psti);
		return confirmation;
	}

	@Override
	public int selectConfirmationCheck(PstiVO psti) throws SQLException {
		int result = sqlSession.selectOne(nameSpace + "selectConfirmationCheck", psti);
		return result;
	}

	@Override
	public int selectQuestCheck(PstiVO psti) throws SQLException {
		int result = sqlSession.selectOne(nameSpace + "selectQuestCheck", psti);
		return result;
	}

	@Override
	public int registPstiCheck(PstiVO psti) throws SQLException {
		int result = sqlSession.selectOne(nameSpace + "registPstiCheck", psti);
		return result;
	}

	@Override
	public int registPstiUpdate(PstiVO psti) throws SQLException {
		int result = sqlSession.update(nameSpace + "registPstiUpdate", psti);
		return result;
	}

}
