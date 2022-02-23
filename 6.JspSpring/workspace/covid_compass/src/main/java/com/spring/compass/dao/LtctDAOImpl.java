package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.IsoptntListVO;
import com.spring.compass.command.LtctBookmarkVO;
import com.spring.compass.command.LtctIsoptntHighTempCardListVO;
import com.spring.compass.command.LtctRequestSmplVO;
import com.spring.compass.command.LtctResListVO;
import com.spring.compass.command.LtctSckbdCountAndStats;
import com.spring.compass.command.LtctSckbdListVO;
import com.spring.compass.command.LtctSckbdreqOkCommand;
import com.spring.compass.command.LtctSearchCommand;
import com.spring.compass.command.LtctUpdateSckbdCntCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.LtctBasicDetailVO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.PbhtVO;

public class LtctDAOImpl implements LtctDAO{
	
	private String nameSpace = "Ltct-Mapper.";
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession; 
	}
	
	@Override
	public LtctVO selectLtctByInstNo(String instNo) throws SQLException {
		LtctVO ltct = sqlSession.selectOne(nameSpace + "selectLtctByInstNo", instNo);
		return ltct;
	}

	@Override
	public String selectLtctCityNo(String city) throws SQLException {
		String cityNo = sqlSession.selectOne(nameSpace+"selectLtctCityNo",city);
		return cityNo;
	}

	@Override
	public int selectLtctNextVal() throws SQLException {
		int ltctSeq = sqlSession.selectOne(nameSpace+"selectLtctNextVal");
		return ltctSeq;
	}

	@Override
	public int selectInstNextval() throws SQLException {
		int instSeq = sqlSession.selectOne(nameSpace+"selectInstNextval");
		return instSeq;
	}

	@Override
	public int insertLtct(LtctVO hspt) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertLtct", hspt);
		
		return result;
	}

	@Override
	public int insertInst(InstVO inst) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertInst",inst);
		
		return result;
	}

	@Override
	public LtctVO selectLtctByLtctNo(String ltctNo) throws SQLException {
		LtctVO ltct = sqlSession.selectOne(nameSpace + "selectLtctByLtctNo", ltctNo);
		return ltct;
	}

	@Override
	public List<IsoptntListVO> selectIsoptntList(LtctSearchCommand cri) throws SQLException {
		List<IsoptntListVO> isoptntList = sqlSession.selectList(nameSpace+"selectIsoptntList",cri);
		return isoptntList;
	}

	@Override
	public int selectIsoptntListCount(LtctSearchCommand cri) throws SQLException {
		int isoptntListCount = sqlSession.selectOne(nameSpace+"selectIsoptntListCount", cri);
		return isoptntListCount;
	}

	@Override
	public LtctBasicDetailVO selectBasicDetail(String manageNo) throws SQLException {
		LtctBasicDetailVO isoptnt = sqlSession.selectOne(nameSpace+"selectBasicDetail", manageNo);
		return isoptnt;
	}

	@Override
	public List<LtctResListVO> selectResList(LtctSearchCommand cri) throws SQLException {
		List<LtctResListVO> resList = sqlSession.selectList(nameSpace+"selectResList", cri);
		return resList;
	}

	@Override
	public int selectResListCount(LtctSearchCommand cri) throws SQLException {
		int resListCount = sqlSession.selectOne(nameSpace+"selectResListCount", cri);
		return resListCount;
	}

	@Override
	public List<LtctSckbdListVO> selectSckbdList(LtctSearchCommand cri) throws SQLException {
		List<LtctSckbdListVO> sckbdList = sqlSession.selectList(nameSpace+"selectSckbdList", cri);
		return sckbdList;
	}

	@Override
	public int selectSckbdListCount(LtctSearchCommand cri) throws SQLException {
		int sckbdListCount = sqlSession.selectOne(nameSpace+"selectSckbdListCount", cri);
		return sckbdListCount;
	}

	@Override
	public List<LtctBasicDetailVO> selectIsoptntDgnssNote(String manageNo) throws SQLException {
		List<LtctBasicDetailVO> dgnssNote = sqlSession.selectList(nameSpace+"selectIsoptntDgnssNote", manageNo);
		return dgnssNote;
	}

	@Override
	public LtctBasicDetailVO selectLastReq(String manageNo) throws SQLException {
		LtctBasicDetailVO lastReq = sqlSession.selectOne(nameSpace+"selectLastReq", manageNo);
		return lastReq;
	}

	@Override
	public LtctBasicDetailVO selectSckbdreqYmd(String manageNo) throws SQLException {
		LtctBasicDetailVO sckbdreqYmd = sqlSession.selectOne(nameSpace+"selectSckbdreqYmd", manageNo); 
		return sckbdreqYmd;
	}

	@Override
	public LtctSckbdCountAndStats selectSckbdCount(String ltctNo) throws SQLException {
		LtctSckbdCountAndStats sckbdCount = sqlSession.selectOne(nameSpace+"selectSckbdCount", ltctNo);
		return sckbdCount;
	}

	@Override
	public LtctSckbdCountAndStats selectSckbdStats(String ltctNo) throws SQLException {
		LtctSckbdCountAndStats sckbdStats = sqlSession.selectOne(nameSpace+"selectSckbdStats", ltctNo);
		return sckbdStats;
	}

	@Override
	public List<LtctIsoptntHighTempCardListVO> selectIsoptntHighTempCardList(String ltctNo) throws SQLException {
		List<LtctIsoptntHighTempCardListVO> highTempCardList = sqlSession.selectList(nameSpace+"selectIsoptntHighTempCardList", ltctNo);
		return highTempCardList;
	}

	@Override
	public void updateSckbdCnt(LtctUpdateSckbdCntCommand sckbd) throws SQLException {
		sqlSession.update(nameSpace+"updateSckbdCnt", sckbd);
		
	}

	@Override
	public List<LtctBookmarkVO> selectBookmarkList(LtctSearchCommand cri) throws SQLException {
		List<LtctBookmarkVO> bookmarkList = sqlSession.selectList(nameSpace+"selectBookmarkInstNoByLtctNo", cri);
		return bookmarkList;
	}

	@Override
	public int selectBookmarkListCount(LtctSearchCommand cri) throws SQLException {
		int bookmarkListCount = sqlSession.selectOne(nameSpace+"selectBookmarkListCount", cri);
		return bookmarkListCount;
	}

	@Override
	public List<LtctBookmarkVO> selectPbhtList(LtctSearchCommand cri) throws SQLException {
		List<LtctBookmarkVO> pbhtList = sqlSession.selectList(nameSpace+"selectPbhtList", cri);
		return pbhtList;
	}

	@Override
	public int selectPbhtListCount(LtctSearchCommand cri) throws SQLException {
		int pbhtListCount = sqlSession.selectOne(nameSpace+"selectPbhtListCount", cri);
		return pbhtListCount;
	}

	@Override
	public void updateSckbdreqReturn(String sckbdreqNo) throws SQLException {
		sqlSession.update(nameSpace+"updateSckbdreqReturn", sckbdreqNo);
	}

	@Override
	public void updateRmndSckbdCntReturn(String ltctNo) throws SQLException {
		sqlSession.update(nameSpace+"updateRmndSckbdCntReturn", ltctNo);
	}

	@Override
	public void updateSckbdreqOk(String sckbdreqNo) throws SQLException {
		sqlSession.update(nameSpace+"updateSckbdreqOk", sckbdreqNo);
	}

	@Override
	public void updateHsptSckbdCntOk(String hsptNo) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptSckbdCntOk", hsptNo);
	}

	@Override
	public void updateManageSttusCodeOk(LtctSckbdreqOkCommand sckbdreq) throws SQLException {
		sqlSession.update(nameSpace+"updateManageSttusCodeOk", sckbdreq);
	}

	@Override
	public void insertIsoptntOk(LtctSckbdreqOkCommand sckbdreq) throws SQLException {
		sqlSession.update(nameSpace+"insertIsoptntOk", sckbdreq);
	}

	@Override
	public String selectIsoptntSeq() throws SQLException {
		String isoptntNo = sqlSession.selectOne(nameSpace+"selectIsoptntSeq");
		return isoptntNo;
	}

	@Override
	public List<PbhtVO> selectPbhtListByAreaNo(String areaNo) throws SQLException {
		List<PbhtVO> pbhtList = sqlSession.selectList(nameSpace+"selectPbhtListByAreaNo", areaNo); 
		return pbhtList;
	}

	@Override
	public String selectSmplSeq() throws SQLException {
		String smplNo = sqlSession.selectOne(nameSpace+"selectSmplSeq");
		return smplNo;
	}

	@Override
	public void insertSmplByLtct(LtctRequestSmplVO smpl) throws SQLException {
		sqlSession.update(nameSpace+"insertSmplByLtct", smpl);
	}

	@Override
	public List<LtctVO> selectLtctBackupList() throws SQLException {
		List<LtctVO> ltctBackupList = sqlSession.selectList(nameSpace+"selectLtctBackupList");
		return ltctBackupList;
	}

	@Override
	public int selectHsptBookmarkListCount(LtctSearchCommand cri) throws SQLException {
		int hsptBookmarkListCount = sqlSession.selectOne(nameSpace+"selectHsptBookmarkListCount", cri);
		return hsptBookmarkListCount;
	}

	@Override
	public List<DgnssHsptVO> selectHsptBookmarkList(LtctSearchCommand cri) throws SQLException {
		List<DgnssHsptVO> hsptBookmarkList = sqlSession.selectList(nameSpace+"selectHsptBookmarkList", cri);
		return hsptBookmarkList;
	}

	@Override
	public List<DgnssHsptVO> selectHsptAllList(LtctSearchCommand cri) throws SQLException {
		List<DgnssHsptVO> hsptAllList = sqlSession.selectList(nameSpace+"selectHsptAllList", cri);
		return hsptAllList;
	}

	@Override
	public int selectHsptAllListCount(LtctSearchCommand cri) throws SQLException {
		int hsptAllListCount = sqlSession.selectOne(nameSpace+"selectHsptAllListCount", cri);
		return hsptAllListCount;
	}

	@Override
	public String selectMyArea(String ltctNo) throws SQLException {
		String myArea = sqlSession.selectOne(nameSpace+"selectMyArea", ltctNo);
		return myArea;
	}

	@Override
	public DgnssHsptVO selectHsptDetail(String hsptNo) throws SQLException {
		DgnssHsptVO hsptDetail = sqlSession.selectOne(nameSpace+"selectHsptDetail", hsptNo);
		return hsptDetail;
	}

	@Override
	public int hsptRmndSckbdCntMinus(Map<String, Object> reqData) throws SQLException {
		int hsptRmndSckbdCnt = sqlSession.update(nameSpace+"hsptRmndSckbdCntMinus", reqData);
		return hsptRmndSckbdCnt;
	}

	@Override
	public int hsptDgnssRegist(Map<String, Object> reqData) throws SQLException {
		int cnt = sqlSession.update(nameSpace+"hsptDgnssRegist", reqData);
		return cnt;
	}

	@Override
	public String selectDgnssSeq() throws SQLException {
		String dgnssNo = sqlSession.selectOne(nameSpace+"selectDgnssSeq");
		return dgnssNo;
	}

	@Override
	public int manageSttusCodeUpdate(Map<String, Object> checkData) throws SQLException {
		int cnt = sqlSession.update(nameSpace+"manageSttusCodeUpdate", checkData);
		return cnt;
	}

	@Override
	public List<String> selectIsoptntNoList() throws SQLException {
		List<String> isoptntNoList = sqlSession.selectList(nameSpace+"selectIsoptntNoList");
		return isoptntNoList;
	}

	@Override
	public void modifyIsoptntBdtempByIsoptntNo(IsoptntVO isoptnt) throws SQLException {
		sqlSession.update(nameSpace+"modifyIsoptntBdtempByIsoptntNo", isoptnt);
		
	}

	@Override
	public Date selectSmplResult(String smplNo) throws SQLException {
		Date smplResult = sqlSession.selectOne(nameSpace+"selectSmplResult", smplNo);
		return smplResult;
	}

	@Override
	public LtctBasicDetailVO selectPbhtByPbhtNo(String pbhtNo) throws SQLException {
		LtctBasicDetailVO pbht = sqlSession.selectOne(nameSpace+"selectPbhtByPbhtNo", pbhtNo);
		return pbht;
	}

	@Override
	public String selectLtctStatsSeq() throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectLtctStatsSeq");
	}

	@Override
	public List<String> selectAllLtctNo() throws SQLException {
		return sqlSession.selectList(nameSpace+"selectAllLtctNo");
	}

	@Override
	public void insertLtctStats(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"insertLtctStats", ltctStats);
	}

	@Override
	public String selectLtctStatusNo(LtctStatsVO ltctStats) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectLtctStatusNo", ltctStats);
	}

	@Override
	public String selectLtctStatusNoByQuery(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectLtctStatusNoByQuery", ltctNo);
	}

	@Override
	public int selectOutIsoptntCnt(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectOutIsoptntCnt", ltctNo);
	}

	@Override
	public void updateOutIsoptntCnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateOutIsoptntCnt", ltctStats);
	}

	@Override
	public int selectTotIsoptntCnt(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectTotIsoptntCnt", ltctNo);
	}

	@Override
	public void updateTotIsoptntCnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateTotIsoptntCnt", ltctStats);
	}

	@Override
	public int selectRlsedCnt(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectRlsedCnt", ltctNo);
	}

	@Override
	public void updateRlsedCnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateRlsedCnt", ltctStats);
	}

	@Override
	public void updateReqDgnssAndInIsoptnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateReqDgnssAndInIsoptnt", ltctStats);
	}

	@Override
	public void updateReqDgnssCnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateReqDgnssCnt",ltctStats);
	}

	@Override
	public void updateInIsoptntCnt(LtctStatsVO ltctStats) throws SQLException {
		sqlSession.update(nameSpace+"updateInIsoptntCnt",ltctStats);
	}

	@Override
	public Date selectLtctInYmdByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectLtctInYmdByManageNo", manageNo);
	}

	@Override
	public void updatePstiInfo(InspPstiVO psti) throws SQLException {
		sqlSession.update(nameSpace+"updatePstiInfo", psti);
	}

	@Override
	public InspPstiVO selectModifyCancel(String pstiNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectModifyCancel", pstiNo);
	}

	@Override
	public PstiAdresVO selectPstiAdres(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectPstiAdres", manageNo);
	}

	@Override
	public int insertBookMarkRegist(Map<String, Object> data) throws SQLException {
		return sqlSession.update(nameSpace+"insertBookMarkRegist", data);
	}

	@Override
	public int selectBookMark(Map<String, Object> data) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectBookMark", data);
	}

	@Override
	public int deleteBookMark(Map<String, Object> data) throws SQLException {
		return sqlSession.update(nameSpace+"deleteBookMark", data);
	}

	@Override
	public int selectDgnssTodayByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectDgnssTodayByManageNo", manageNo);
	}

	@Override
	public String selectLastSckbdreqNoByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectLastSckbdreqNoByManageNo", manageNo);
	}

	@Override
	public int selectSmplTodayByManageNo(Map<String, Object> data) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectSmplTodayByManageNo", data);
	}

	@Override
	public String selectRmndSckbdCntByHsptNo(String hsptNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectRmndSckbdCntByHsptNo", hsptNo);
	}

	@Override
	public int selectIsoptntCountByLtctNo(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectIsoptntCountByLtctNo", ltctNo);
	}

	@Override
	public int selectSckbdreqCountByLtctNo(String ltctNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectSckbdreqCountByLtctNo", ltctNo);
	}

	@Override
	public String selectNgtvCntByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectNgtvCntByManageNo", manageNo);
	}

	@Override
	public int selectDgnssResultByDgnssNo(String dgnssNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectDgnssResultByDgnssNo", dgnssNo);
	}

	@Override
	public int selectDgnssResultCntByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectDgnssResultCntByManageNo",manageNo);
	}

}
