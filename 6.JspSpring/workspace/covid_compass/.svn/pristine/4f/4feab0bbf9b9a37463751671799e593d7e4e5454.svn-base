package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.compass.command.DgnssListSearchCommand;
import com.spring.compass.command.DgnssListVO;
import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InptntListVO;
import com.spring.compass.command.InstSearchCommand;
import com.spring.compass.command.LtctListToSckbdreqCommand;
import com.spring.compass.command.ReqInptntListCommand;
import com.spring.compass.command.SckbdreqHsptListCommand;
import com.spring.compass.command.SckbdreqLtctListCommand;
import com.spring.compass.vo.BookmarkVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.InptntstatsVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.ManageVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SlfptntVO;
import com.spring.compass.vo.SmplVO;

public class HsptDAOImpl implements HsptDAO{

	private String nameSpace = "Hspt-Mapper.";

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public HsptVO selectHsptByInstNo(String instNo) throws SQLException {
		HsptVO hspt = sqlSession.selectOne(nameSpace + "selectHsptByInstNo", instNo);
		return hspt;
	}

	@Override
	public int selectInptntListCount(InptntListSearchCommand cri) throws SQLException {
		int inptntCnt = sqlSession.selectOne(nameSpace + "selectInptntListCount", cri);
		return inptntCnt;
	}

	@Override
	public List<InptntListVO> selectInptntList(InptntListSearchCommand cri) throws SQLException {
		
		List<InptntListVO> inptntList = sqlSession.selectList(nameSpace + "selectInptntList", cri);
		return inptntList;
	}

	@Override
	public String selectHsptCityNo(String city) throws SQLException {
		String cityNo = sqlSession.selectOne(nameSpace+"selectHsptCityNo",city);
		return cityNo;
	}

	@Override
	public int selectHsptNextVal() throws SQLException {
		int hsptSeq = sqlSession.selectOne(nameSpace+"selectHsptNextVal");
		return hsptSeq;
	}

	@Override
	public int selectInstNextval() throws SQLException {
		int instSeq = sqlSession.selectOne(nameSpace+"selectInstNextval");
		return instSeq;
	}

	@Override
	public int insertHspt(HsptVO hspt) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertHspt", hspt);

		return result;
	}

	@Override
	public int insertInst(InstVO inst) throws SQLException {
		int result = sqlSession.update(nameSpace+"insertInst",inst);

		return result;
	}
	@Override
	public List<DgnssListVO> selectDgnssList(DgnssListSearchCommand cri) throws SQLException {
		List<DgnssListVO> dgnssReqList = sqlSession.selectList(nameSpace + "selectDgnssList", cri);
		return dgnssReqList;
	}

	@Override
	public int selectDgnssListCount(DgnssListSearchCommand cri) throws SQLException {
		int dgnssReqCnt = sqlSession.selectOne(nameSpace + "selectDgnssListCount", cri);
		return dgnssReqCnt;
	}

	@Override
	public int selectReqInptntListCount(InptntListSearchCommand cri) throws SQLException {
		int reqInptntCnt = sqlSession.selectOne(nameSpace + "selectReqInptntListCount", cri);
		return reqInptntCnt;
	}

	@Override
	public List<ReqInptntListCommand> selectReqInptntList(InptntListSearchCommand cri)
			throws SQLException {
		List<ReqInptntListCommand> reqInptntList = sqlSession.selectList(nameSpace + "selectReqInptntList", cri);
		return reqInptntList;
	}

	@Override
	public List<ReqInptntListCommand> selectSckbdReqHsptList(InptntListSearchCommand cri) throws SQLException {
		List<ReqInptntListCommand> reqInptntList = sqlSession.selectList(nameSpace + "selectSckbdReqHsptList", cri);
		return reqInptntList;
	}

	@Override
	public int selectSckbdReqHsptListCount(InptntListSearchCommand cri) throws SQLException {
		int sckbdreqHsptCount = sqlSession.selectOne(nameSpace + "selectSckbdReqHsptListCount", cri);
		return sckbdreqHsptCount;
	}

	@Override
	public List<SckbdreqLtctListCommand> selectSckbdReqLtctList(InptntListSearchCommand cri) throws SQLException {
		List<SckbdreqLtctListCommand> sckbdreqLtctList = sqlSession.selectList(nameSpace + "selectSckbdReqLtctList", cri);
		return sckbdreqLtctList;
	}

	@Override
	public int selectSckbdReqLtctListCount(InptntListSearchCommand cri) throws SQLException {
		int sckbdreqLtctCount = sqlSession.selectOne(nameSpace + "selectSckbdReqLtctListCount", cri);
		return sckbdreqLtctCount;
	}

	@Override
	public HsptVO selectHsptByHsptNo(String hsptNo) throws SQLException {
		HsptVO hspt = sqlSession.selectOne(nameSpace + "selectHsptByHsptNo", hsptNo);
		return hspt;
	}

	@Override
	public int updateManageChangeAll(ManageVO manage) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateManageChangeAll", manage);
		return cnt;
	}

	@Override
	public int updateManageChangeStatus(ManageVO manage) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateManageChangeStatus", manage);
		return cnt;
	}

	@Override
	public int updateManageChangeInst(ManageVO manage) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateManageChangeInst", manage);
		return cnt;
	}

	@Override
	public int insertDgnssResult(DgnssResultVO dgnssResult) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertDgnssResult", dgnssResult);
		return cnt;
	}

	@Override
	public int insertInptnt(InptntVO inptnt) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertInptnt", inptnt);
		return cnt;
	}

	@Override
	public int updateDgnssCodeChkd(String dgnssNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateDgnssCodeChkd", dgnssNo);
		return cnt;
	}

	@Override
	public int insertSckbdreq(SckbdreqVO sckbdreq) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertSckbdreq", sckbdreq);
		return cnt;
	}

	@Override
	public int updateIncreaseRmndSckbdCntByHsptNo(String hsptNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateIncreaseRmndSckbdCntByHsptNo", hsptNo);
		return cnt;
	}

	@Override
	public int updateDecreaseRmndSckbdCntByHsptNo(String hsptNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateDecreaseRmndSckbdCntByHsptNo", hsptNo);
		return cnt;
	}

	@Override
	public int insertSlfptnt(SlfptntVO slfptnt) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertSlfptnt", slfptnt);
		return cnt;
	}

	@Override
	public int updateIsoptntExit(IsoptntVO inptnt) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateIsoptntExit", inptnt);
		return cnt;
	}

	@Override
	public int updateIncreaseRmndSckbdCntByLtctNo(String ltctNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateIncreaseRmndSckbdCntByLtctNo", ltctNo);
		return cnt;
	}

	@Override
	public int updateDecreaseRmndSckbdCntByLtctNo(String ltctNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateDecreaseRmndSckbdCntByLtctNo", ltctNo);
		return cnt;
	}

	@Override
	public int insertSmpl(SmplVO smpl) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertSmpl", smpl);
		return cnt;
	}

	@Override
	public int updateInptntInfo(PstiVO psti) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateInptntInfo", psti);
		return cnt;
	}

	@Override
	public int updateSckbdreqCodeOnly(SckbdreqVO sckbdreq) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateSckbdreqCodeOnly", sckbdreq);
		return cnt;
	}

	@Override
	public int updateSckbdreqAccept(SckbdreqVO sckbdreq) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateSckbdreqAccept", sckbdreq);
		return cnt;
	}

	@Override
	public int updateInptntExit(InptntVO inptnt) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateInptntExit", inptnt);
		return cnt;
	}

	@Override
	public int updateSckbdModify(HsptVO hspt) throws SQLException {
		int cnt = sqlSession.update(nameSpace+"updateMainSckbdCnt",hspt);
		return cnt;
		
	}

	@Override
	public List<SckbdreqHsptListCommand> selectBookmarkHsptList(String hsptNo, InstSearchCommand cri)
			throws SQLException {
		
		int offset = cri.getStartRowNum() - 1;
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SckbdreqHsptListCommand> sckbdreqHsptListCommand = sqlSession.selectList(nameSpace + "selectBookmarkHsptList", hsptNo, rowBounds);
		return sckbdreqHsptListCommand;
	}

	@Override
	public int selectBookmarkHsptListCount(String hsptNo) throws SQLException {
		
		int cnt = sqlSession.selectOne(nameSpace + "selectBookmarkHsptListCount", hsptNo);
		return cnt;
	}

	@Override
	public List<SckbdreqHsptListCommand> selectHsptListWithRmndSckbd(InstSearchCommand cri) throws SQLException {
		
		int offset = cri.getStartRowNum() - 1;
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<SckbdreqHsptListCommand> sckbdreqHsptListCommand = sqlSession.selectList(nameSpace + "selectHsptListWithRmndSckbd", cri, rowBounds); 
		
		return sckbdreqHsptListCommand;
	}

	@Override
	public int selectHsptListWithRmndSckbdCount(InstSearchCommand cri) throws SQLException {
		
		int cnt = sqlSession.selectOne(nameSpace + "selectHsptListWithRmndSckbdCount", cri); 
		return cnt;
		
	}

	@Override
	public List<LtctListToSckbdreqCommand> selectBookmarkLtctList(String hsptNo, InstSearchCommand cri)
			throws SQLException {
		int offset = cri.getStartRowNum() - 1;
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<LtctListToSckbdreqCommand> ltctListToSckbdreqCommand = sqlSession.selectList(nameSpace + "selectBookmarkLtctList", hsptNo, rowBounds); 
		
		return ltctListToSckbdreqCommand;
	}

	@Override
	public int selectBookmarkLtctListCount(String hsptNo) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectBookmarkLtctListCount", hsptNo); 
		return cnt;
	}

	@Override
	public List<LtctListToSckbdreqCommand> selectLtctListWithRmndSckbd(InstSearchCommand cri) throws SQLException {
		int offset = cri.getStartRowNum() - 1;
		int limit = cri.getPerPageNum();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<LtctListToSckbdreqCommand> ltctListToSckbdreqCommand = sqlSession.selectList(nameSpace + "selectLtctListWithRmndSckbd", cri, rowBounds); 
		
		return ltctListToSckbdreqCommand;
	}

	@Override
	public int selectLtctListWithRmndSckbdCount(InstSearchCommand cri) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectLtctListWithRmndSckbdCount", cri); 
		return cnt;
	}

	@Override
	public String selectHsptStatsSeq() throws SQLException {
		String hsptStatsNo = sqlSession.selectOne(nameSpace+"selectHsptStatsSeq");
		return hsptStatsNo;
	}

	@Override
	public List<String> selectAllHsptNo() throws SQLException {
		List<String> hsptNoList = sqlSession.selectList(nameSpace+"selectAllHsptNo");
		return hsptNoList;
	}

	@Override
	public void insertHsptStats(HsptStatsVO hsptStats) throws SQLException {
		sqlSession.update(nameSpace+"insertHsptStats", hsptStats);
	}

	@Override
	public int insertBookmark(BookmarkVO bookmark) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "insertBookmark", bookmark);
		return cnt;
	}

	@Override
	public List<String> selectToInstNoListByFromInstNo(String fromInstNo) throws SQLException {
		List<String> toInstNoList = sqlSession.selectList(nameSpace+"selectToInstNoListByFromInstNo", fromInstNo);
		return toInstNoList;
	}

	@Override
	public int selectOutCnt(InptntstatsVO inptnt) throws SQLException {
		int outCnt = sqlSession.selectOne(nameSpace+"selectOutCnt", inptnt);
		return outCnt;
	}

	@Override
	public int selectDeathCnt(InptntstatsVO inptnt) throws SQLException {
		int deathCnt = sqlSession.selectOne(nameSpace+"selectDeathCnt", inptnt);
		return deathCnt;
	}

	@Override
	public int selectCurInptntCnt(InptntstatsVO inptnt) throws SQLException {
		int curInptntCnt = sqlSession.selectOne(nameSpace+"selectCurInptntCnt", inptnt);
		return curInptntCnt;
	}

	@Override
	public int selectAllInptntCnt(String hsptNo) throws SQLException {
		int allInptntCnt = sqlSession.selectOne(nameSpace+"selectAllInptntCnt", hsptNo);
		return allInptntCnt;
	}

	@Override
	public int selectRmndSckbdCnt(String hsptNo) throws SQLException {
		int rmndSckbdCnt = sqlSession.selectOne(nameSpace+"selectRmndSckbdCnt", hsptNo);
		return rmndSckbdCnt;
	}

	@Override
	public int selectSckbdCnt(String hsptNo) throws SQLException {
		int sckbdCnt = sqlSession.selectOne(nameSpace+"selectSckbdCnt", hsptNo);
		return sckbdCnt;
	}

	@Override
	public String selectHsptStatusNo(HsptStatsVO hsptstats) throws SQLException {
		String hsptStatsNo = sqlSession.selectOne(nameSpace+"selectHsptStatusNo", hsptstats);
		return hsptStatsNo;
	}

	@Override
	public void updateHsptStats(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStats", hsptstats);
	}

	@Override
	public int updateExpireExit(String inptntNo) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateExpireExit", inptntNo);
		return cnt;
	}

	@Override
	public int updateDgnss(DgnssVO dgnss) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateDgnss", dgnss);
		return cnt;
	}

	@Override
	public List<PbhtVO> selectPbhtListByAreaNo(String areaNo) throws SQLException {
		List<PbhtVO> pbhtList = sqlSession.selectList(nameSpace+"selectPbhtListByAreaNo", areaNo);
		return pbhtList;
	}

	@Override
	public List<HsptVO> selectHsptBackupList() throws SQLException {
		List<HsptVO> hsptBackupList = sqlSession.selectList(nameSpace+"selectHsptBackupList");
		return hsptBackupList;
	}

	@Override
	public int updateSckbdCnt(HsptVO hspt) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "updateSckbdCnt", hspt);
		return cnt;
	}

	@Override
	public HsptStatsVO selectHsptMainStatisticsByHsptNo(String hsptNo) throws SQLException {
		HsptStatsVO hsptStats = sqlSession.selectOne(nameSpace + "selectHsptMainStatisticsByHsptNo", hsptNo);
		return hsptStats;
	}

	@Override
	public List<HsptStatsVO> selectHsptMainChartDataByHsptNo(String hsptNo) throws SQLException {
		List<HsptStatsVO> hsptStatsList = sqlSession.selectList(nameSpace + "selectHsptMainChartDataByHsptNo", hsptNo);
		return hsptStatsList;
	}

	@Override
	public int selectRlsedCnt(InptntstatsVO inptnt) throws SQLException {
		int cnt = sqlSession.selectOne(nameSpace + "selectRlsedCnt", inptnt);
		return cnt;
	}

	@Override
	public void updateHsptStatsDgnssCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsDgnssCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsReqSckbdCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsReqSckbdCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsInptntCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsInptntCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsGoLtctCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsGoLtctCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsGoSlfCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsGoSlfCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsOutCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsOutCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsDeathCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsDeathCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsRlsedCnt(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsRlsedCnt", hsptstats);
	}

	@Override
	public void updateHsptStatsByQuery(HsptStatsVO hsptstats) throws SQLException {
		sqlSession.update(nameSpace+"updateHsptStatsByQuery", hsptstats);
	}

	@Override
	public int selectBookmarkCount(BookmarkVO bookmark) throws SQLException{
		int cnt = sqlSession.selectOne(nameSpace + "selectBookmarkCount", bookmark);
		return cnt;
	}

	@Override
	public int deleteBookMark(BookmarkVO bookmark) throws SQLException {
		int cnt = sqlSession.update(nameSpace + "deleteBookMark", bookmark);
		return cnt;
	}

	@Override
	public int selectSmplTodayByManageNo(Map<String, Object> data) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectSmplTodayByManageNo", data);
	}

	@Override
	public int selectSckbdreqTodayByManageNo(String manageNo) throws SQLException {
		return sqlSession.selectOne(nameSpace+"selectSckbdreqTodayByManageNo", manageNo);
	}

	
}
