package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.apache.struts.chain.commands.CreateActionForm;

import com.spring.compass.command.CnfrmDgnssHsptVO;
import com.spring.compass.command.CnfrmDgnssListVO;
import com.spring.compass.command.CnfrmDgnssReqDetailVO;
import com.spring.compass.command.CnfrmDgnssWaitDetailVO;
import com.spring.compass.command.CnfrmListDetailManageInstVO;
import com.spring.compass.command.CnfrmManageListVO;
import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.PbhtStatsCommand;
import com.spring.compass.command.PbhtStatsDateCommand;
import com.spring.compass.command.PbhtStatsWeekCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.command.ResSmplDetailNegativeSmplInstVO;
import com.spring.compass.command.ResSmplDetailPstiHtscVO;
import com.spring.compass.command.ResSmplDetailSmplCnfmInstVO;
import com.spring.compass.command.SlfptntDetailDgnssHsptVO;
import com.spring.compass.command.SlfptntDetailSmplCnfmVO;
import com.spring.compass.command.SmplListDetailVO;
import com.spring.compass.command.SmplResultCheckVO;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.PbhtStatsVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SmplResultVO;
import com.spring.compass.vo.SmplVO;

public class PbhtDAOImpl implements PbhtDAO{
	
	private String nameSpace = "Pbht-Mapper.";
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession; 
	}
	
	@Override
	public PbhtVO selectPbhtByInstNo(String instNo) throws SQLException {
		PbhtVO pbht = sqlSession.selectOne(nameSpace + "selectPbhtByInstNo", instNo);
		return pbht;
	}

	@Override
	public String selectPbhtCityNo(String city) throws SQLException {
		String cityNo = sqlSession.selectOne(nameSpace+"selectPbhtCityNo",city);
		return cityNo;
	}

	@Override
	public int selectPbhtNextVal() throws SQLException {
		int pbhtSeq = sqlSession.selectOne(nameSpace+"selectPbhtNextVal");
		return pbhtSeq;
	}

	@Override
	public int selectInstNextval() throws SQLException {
		int instSeq = sqlSession.selectOne(nameSpace+"selectInstNextval");
		return instSeq;
	}

	@Override
	public int insertPbht(PbhtVO pbht) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertPbht", pbht);
		return result;
	}

	@Override
	public int insertInst(PbhtVO pbht) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertInst",pbht);
		return result;
	}

	@Override
	public PbhtVO selectPbhtByPbhtNo(String pbhtNo) throws SQLException {
		PbhtVO pbht = sqlSession.selectOne(nameSpace + "selectPbhtByPbhtNo", pbhtNo);
		return pbht;
	}

	@Override
	public List<SmplVO> selectSmplList(SmplSearchCommand cri) throws SQLException {
		
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<SmplVO> smplList = sqlSession.selectList(nameSpace + "selectSmplList", cri, rowBounds);
		return smplList;
	}

	@Override
	public int selectSearchSemplListCount(SmplSearchCommand cri) throws SQLException {
		int count = sqlSession.selectOne(nameSpace + "selectSearchSemplListCount", cri);
		return count;
	}

	@Override
	public List<SmplResultCheckVO> selectSearchSmplResultList(SmplSearchCommand cri) throws SQLException {
		
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<SmplResultCheckVO> smplResultList = sqlSession.selectList(nameSpace + "selectSearchSmplResultList", cri,rowBounds);
		return smplResultList;
	}

	@Override
	public int selectSearchSemplResultListCount(SmplSearchCommand cri) throws SQLException {
		int count = sqlSession.selectOne(nameSpace + "selectSearchSemplResultListCount", cri);
		return count;
	}

	@Override
	public List<CnfrmDgnssListVO> selectCnfrmDgnssList(SmplSearchCommand cri) throws SQLException {
		
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<CnfrmDgnssListVO> cfdList = sqlSession.selectList(nameSpace + "selectCnfrmDgnssList", cri, rowBounds);
		
		return cfdList;
	}

	@Override
	public int selectCnfrmDgnssListCount(SmplSearchCommand cri) throws SQLException {
		
		int cnt = sqlSession.selectOne(nameSpace + "selectCnfrmDgnssListCount", cri);
		
		return cnt;
	}

	@Override
	public List<CnfrmManageListVO> selectCnfrmManageList(SmplSearchCommand cri) throws SQLException {

		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<CnfrmManageListVO> cfmList = sqlSession.selectList(nameSpace + "selectCnfrmManageList", cri, rowBounds);
		return cfmList;
	}

	@Override
	public int selectCnfrmManageListCount(SmplSearchCommand cri) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectCnfrmManageListCount", cri);
		return cnt;
	}

	@Override
	public int selectSlfManageListCount(SmplSearchCommand cri) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectSlfManageListCount", cri);
		return cnt;
	}

	@Override
	public SmplListDetailVO selectSmplDetail(Map<String, Object> sldData) throws SQLException {
		SmplListDetailVO sldVO = sqlSession.selectOne(nameSpace + "selectSmplDetail", sldData);
		
		return sldVO;
	}

	@Override
	public CnfrmDgnssWaitDetailVO selectCnfrmDgnssWaitDetail(Map<String, Object> cdwdData) throws SQLException {
		
		CnfrmDgnssWaitDetailVO cdwdVO = sqlSession.selectOne(nameSpace + "selectCnfrmDgnssWaitDetail", cdwdData);
		return cdwdVO;
	}

	@Override
	public CnfrmDgnssReqDetailVO selectCnfrmDgnssReqDetail(Map<String, Object> cdrdData) throws SQLException {
		CnfrmDgnssReqDetailVO cdrdVO = sqlSession.selectOne(nameSpace + "selectCnfrmDgnssReqDetail", cdrdData);
		return cdrdVO;
	}

	@Override
	public VPstiCommand selectCnfrmListDetailPsti(String manageNo) throws SQLException {
		VPstiCommand pstiVO = sqlSession.selectOne(nameSpace + "selectCnfrmListDetailPsti", manageNo);
		return pstiVO;
	}

	@Override
	public CnfmVO selectCnfrmListDetailCnfm(String manageNo) throws SQLException {
		CnfmVO cnfmVO = sqlSession.selectOne(nameSpace + "selectCnfrmListDetailCnfm", manageNo);
		return cnfmVO;
	}

	@Override
	public CnfrmListDetailManageInstVO selectCnfrmListDetailManage(String manageNo) throws SQLException {
		CnfrmListDetailManageInstVO manageVO = sqlSession.selectOne(nameSpace + "selectCnfrmListDetailManage", manageNo);
		return manageVO;
	}

	@Override
	public SmplResultVO selectCnfrmListDetailSmpl(String manageNo) throws SQLException {
		SmplResultVO smplVO = sqlSession.selectOne(nameSpace + "selectCnfrmListDetailSmpl", manageNo);
		return smplVO;
	}

	@Override
	public DgnssVO selectCnfrmListDetailDgnss(String manageNo) throws SQLException {
		DgnssVO DgnssVO = sqlSession.selectOne(nameSpace + "selectCnfrmListDetailDgnss", manageNo);
		return DgnssVO;
	}

	@Override
	public VPstiCommand selectSlfptntDetailPsti(String manageNo) throws SQLException {
		VPstiCommand psti = sqlSession.selectOne(nameSpace + "selectSlfptntDetailPsti", manageNo);
		return psti;
	}

	@Override
	public SlfptntDetailSmplCnfmVO selectSlfptntDetailSmplCnfm(String manageNo) throws SQLException {
		SlfptntDetailSmplCnfmVO sdscVO = sqlSession.selectOne(nameSpace + "selectSlfptntDetailSmplCnfm", manageNo);
		return sdscVO;
	}

	@Override
	public SlfptntDetailDgnssHsptVO selectSlfptntDetailDgnssHspt(String manageNo) throws SQLException {
		SlfptntDetailDgnssHsptVO sddhVO = sqlSession.selectOne(nameSpace + "selectSlfptntDetailDgnssHspt", manageNo);
		return sddhVO;
	}

	@Override
	public ResSmplDetailPstiHtscVO selectResSmplDetailPstiHtsc(String manageNo) throws SQLException {
		ResSmplDetailPstiHtscVO sddhVO = sqlSession.selectOne(nameSpace + "selectResSmplDetailPstiHtsc", manageNo);
		return sddhVO;
	}

	@Override
	public ResSmplDetailSmplCnfmInstVO selectResSmplDetailSmplCnfmInst(Map<String, Object> checkData) throws SQLException {
		ResSmplDetailSmplCnfmInstVO sddhVO = sqlSession.selectOne(nameSpace + "selectResSmplDetailSmplCnfmInst", checkData);
		return sddhVO;
	}
	
	@Override
	public ResSmplDetailNegativeSmplInstVO selectResSmplDetailNegativeSmplInst(Map<String, Object> checkData) throws SQLException {
		ResSmplDetailNegativeSmplInstVO sddhVO = sqlSession.selectOne(nameSpace + "selectResSmplDetailNegativeSmplInst", checkData);
		return sddhVO;
	}
	
	
	
	@Override
	public int selectCheckNewSmpl(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectCheckNewSmpl",checkData);
		return cnt;
	}

	@Override
	public int newSmplResultRegist(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "newSmplResultRegist", checkData);
		return cnt;
	}

	@Override
	public int selectCnfmNextVal() throws SQLException {
		int cnfmNo = sqlSession.selectOne(nameSpace+"selectCnfmNextVal");
		return cnfmNo;
	}

	@Override
	public int newCnfmResultRegist(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "newCnfmResultRegist", checkData);
		return cnt;
	}

	@Override
	public int smplUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "smplUpdate", checkData);
		return cnt;
	}

	@Override
	public int cnfmUpdateY(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "cnfmUpdateY", checkData);
		return cnt;
	}

	@Override
	public int selectCnfmNgtv(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectCnfmNgtv", checkData);
		return cnt;
	}

	@Override
	public int cnfmUpdateN(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "cnfmUpdateN", checkData);
		return cnt;
	}

	@Override
	public int cnfmCureUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "cnfmCureUpdate", checkData);
		return cnt;
	}
	
	@Override
	public int manageSttusCodeUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "manageSttusCodeUpdate", checkData);
		return cnt;
	}
	
	@Override
	public int slfptntCureUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "slfptntCureUpdate", checkData);
		return cnt;
	}
	
	@Override
	public int inptntCureUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "inptntCureUpdate", checkData);
		return cnt;
	}
	@Override
	public int isoptntCureUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "isoptntCureUpdate", checkData);
		return cnt;
	}
	
	@Override
	public String selectInstCode(Map<String, Object> checkData) throws SQLException {
		String instCode = sqlSession.selectOne(nameSpace + "selectInstCode", checkData);
		return instCode;
	}

	@Override
	public List<DgnssHsptVO> selectDgnssHsptBookmarkList(SmplSearchCommand cri) throws SQLException {
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<DgnssHsptVO> dhbList = sqlSession.selectList(nameSpace + "selectDgnssHsptBookmarkList", cri, rowBounds);
		return dhbList;
	}

	@Override
	public int selectSerchDgnssHsptBookmarkListCount(SmplSearchCommand cri) throws SQLException {
		int count = sqlSession.selectOne(nameSpace + "selectSerchDgnssHsptBookmarkListCount", cri);
		return count;
	}

	@Override
	public DgnssHsptVO selectHsptDetail(String hsptNo) throws SQLException {
		DgnssHsptVO dhVO = sqlSession.selectOne(nameSpace +"selectHsptDetail", hsptNo);
		return dhVO;
	}

	@Override
	public String selectMyArea(String pbhtNo) throws SQLException {
		String myArea = sqlSession.selectOne(nameSpace + "selectMyArea",pbhtNo);
		return myArea;
	}

	@Override
	public List<DgnssHsptVO> selectDgnssHsptAllList(SmplSearchCommand cri) throws SQLException {
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<DgnssHsptVO> dhbList = sqlSession.selectList(nameSpace + "selectDgnssHsptAllList", cri, rowBounds);
		return dhbList;
	}

	@Override
	public int selectDgnssHsptAllListCount(SmplSearchCommand cri) throws SQLException {
		int count = sqlSession.selectOne(nameSpace + "selectDgnssHsptAllListCount", cri);
		return count;
	}

	@Override
	public String selectPbhtStatsSeq() throws SQLException {
		String pbhtStatsNo = sqlSession.selectOne(nameSpace+"selectPbhtStatsSeq");
		return pbhtStatsNo;
	}

	@Override
	public List<String> selectAllPbhtNo() throws SQLException {
		List<String> pbhtNoList = sqlSession.selectList(nameSpace+"selectAllPbhtNo");
		return pbhtNoList;
	}

	@Override
	public void insertPbhtStats(PbhtStatsVO pbhtStats) throws SQLException {
		sqlSession.update(nameSpace+"insertPbhtStats", pbhtStats);
	}

	@Override
	public String selectPbhtStatsNo(PbhtStatsVO pbhtStats) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectPbhtStatsNo", pbhtStats);
	}

	@Override
	public void updatePbhtStats(PbhtStatsVO pbhtStats) throws SQLException {
		sqlSession.update(nameSpace+"updatePbhtStats", pbhtStats);
	}

	@Override
	public String selectDgnssStatsSeq() throws SQLException {
		String dgnssNo = sqlSession.selectOne(nameSpace+"selectDgnssStatsSeq");
		return dgnssNo;
	}

	@Override
	public int hsptDgnssRegist(Map<String, Object> reqData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "hsptDgnssRegist", reqData);
		return cnt;
	}

	@Override
	public int hsptRmndSckbdCntMinus(Map<String, Object> reqData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "hsptRmndSckbdCntMinus", reqData);
		return cnt;
	}

	@Override
	public int dgnssReqListCount(SmplSearchCommand cri) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "dgnssReqListCount", cri);
		return cnt;
	}

	@Override
	public List<CnfrmDgnssListVO> dgnssReqList(SmplSearchCommand cri) throws SQLException {
		int offset=cri.getStartRowNum() - 1;
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<CnfrmDgnssListVO> drList = sqlSession.selectList(nameSpace + "dgnssReqList", cri, rowBounds);
		return drList;
	}

	@Override
	public CnfrmDgnssHsptVO selectCnfrmDgnssHspt(String manageNo) throws SQLException {
		CnfrmDgnssHsptVO cdhVO = sqlSession.selectOne(nameSpace + "selectCnfrmDgnssHspt", manageNo);
		return cdhVO;
	}

	@Override
	public int deleteDgnssReq(String dgnssNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "deleteDgnssReq", dgnssNo);
		return cnt;
	}

	@Override
	public int manageSttusCodeUpdate(String manageNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "manageSttusCodeUpdate", manageNo);
		return cnt;
	}

	@Override
	public int hsptRmndSckbdCntPlus(String hsptNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "hsptRmndSckbdCntPlus", hsptNo);
		return cnt;
	}

	@Override
	public List<PbhtVO> selectPbhtBackup() throws SQLException {
		List<PbhtVO> pbhtBackupList = sqlSession.selectList(nameSpace+"selectPbhtBackup");
		return pbhtBackupList;
	}

	@Override
	public String selectInstNo(Map<String, Object> checkData) throws SQLException {
		String instNo = sqlSession.selectOne(nameSpace+"selectInstNo", checkData);
		return instNo;
	}

	@Override
	public int hsptRmndSckbdCntCheck(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "hsptRmndSckbdCntCheck", checkData);
		return cnt;
	}

	@Override
	public int ltctRmndSckbdCntCheck(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "ltctRmndSckbdCntCheck", checkData);
		return cnt;
	}

	@Override
	public int selfModifyRegist(PstiVO pstiVo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "selfModifyRegist", pstiVo);
		return cnt;
	}

	@Override
	public PstiAdresVO selectPstiAdres(String manageNo) throws SQLException {
		PstiAdresVO psti = sqlSession.selectOne(nameSpace + "selectPstiAdres", manageNo);
		return psti;
	}

	@Override
	public int insertBookMarkRegist(Map<String, Object> data) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertBookMarkRegist", data);
		return cnt;
	}

	@Override
	public int selectBookMark(Map<String, Object> data) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectBookMark", data);
		return cnt;
	}

	@Override
	public int deleteBookMark(Map<String, Object> data) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "deleteBookMark", data);
		return cnt;
	}

	@Override
	public VPstiCommand selectPstiByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectPstiByManageNo", manageNo);
	}

	@Override
	public PbhtStatsCommand selectOneWeekPbhtStats(String pbhtNo) throws SQLException {
		PbhtStatsCommand pbhtOneWeekStats = sqlSession.selectOne(nameSpace + "selectOneWeekPbhtStats", pbhtNo);
		return pbhtOneWeekStats;
	}

	@Override
	public PbhtStatsCommand selectAllPbhtStats(String pbhtNo) throws SQLException {
		PbhtStatsCommand pbhtAllStats = sqlSession.selectOne(nameSpace + "selectAllPbhtStats", pbhtNo);
		return pbhtAllStats;
	}

	@Override
	public PbhtStatsDateCommand selectStatsDate(String pbhtNo) throws SQLException {
		PbhtStatsDateCommand pbhtStatsDate = sqlSession.selectOne(nameSpace + "selectStatsDate", pbhtNo);
		return pbhtStatsDate;
	}

	@Override
	public List<PbhtStatsWeekCommand> selectStatsWeek(String pbhtNo) throws SQLException {
		List<PbhtStatsWeekCommand> pbhtStatsWeekData = sqlSession.selectList(nameSpace + "selectStatsWeek", pbhtNo);
		return pbhtStatsWeekData;
	}

	@Override
	public List<PbhtStatsWeekCommand> selectStatsNegativeWeek(String pbhtNo) throws SQLException {
		List<PbhtStatsWeekCommand> pbhtStatsNegativeWeekData = sqlSession.selectList(nameSpace + "selectStatsNegativeWeek", pbhtNo);
		return pbhtStatsNegativeWeekData;
	}

	@Override
	public int selectRmndSckbdCntCheck(String hsptNo) throws SQLException {
		int result = sqlSession.selectOne(nameSpace + "selectRmndSckbdCntCheck", hsptNo);
		return result;
	}

	@Override
	public InstVO selectInstData(String pbhtNo) throws SQLException {
		InstVO inst = sqlSession.selectOne(nameSpace + "selectInstData", pbhtNo);
		return inst;
	}

	@Override
	public int updateManageInst(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateManageInst",checkData);
		return cnt;
	}

}
