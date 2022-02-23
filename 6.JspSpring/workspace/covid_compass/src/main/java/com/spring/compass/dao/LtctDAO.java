package com.spring.compass.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

public interface LtctDAO {
	
	/**
	 * 인풋 : 기관번호
	 * 아웃풋 : 해당기관번호를 가지는 생활치료센터 vo
	 * @param instNo
	 * @return
	 * @throws SQLException
	 */
	public LtctVO selectLtctByInstNo(String instNo) throws SQLException;
	
	public String selectLtctCityNo(String city) throws SQLException;
	
	public int selectLtctNextVal() throws SQLException;
	
	public int selectInstNextval() throws SQLException;
	
	public int insertLtct(LtctVO hspt) throws SQLException;
	
	public int insertInst(InstVO inst) throws SQLException;
	
	public LtctVO selectLtctByLtctNo(String ltctNo) throws SQLException;

	public List<IsoptntListVO> selectIsoptntList(LtctSearchCommand cri) throws SQLException;
	
	public int selectIsoptntListCount(LtctSearchCommand cri) throws SQLException;
	
	public LtctBasicDetailVO selectBasicDetail(String manageNo) throws SQLException;
	
	public List<LtctResListVO>selectResList(LtctSearchCommand cri) throws SQLException;
	public int selectResListCount(LtctSearchCommand cri) throws SQLException;
	
	public List<LtctSckbdListVO> selectSckbdList(LtctSearchCommand cri) throws SQLException;
	public int selectSckbdListCount(LtctSearchCommand cri) throws SQLException;
	
	public List<LtctBasicDetailVO> selectIsoptntDgnssNote(String manageNo) throws SQLException;
	
	public LtctBasicDetailVO selectLastReq(String manageNo) throws SQLException;
	
	public LtctBasicDetailVO selectSckbdreqYmd(String manageNo) throws SQLException;
	
	public LtctSckbdCountAndStats selectSckbdCount(String ltctNo) throws SQLException;
	public LtctSckbdCountAndStats selectSckbdStats(String ltctNo) throws SQLException;
	
	public List<LtctIsoptntHighTempCardListVO> selectIsoptntHighTempCardList(String ltctNo) throws SQLException;
	
	void updateSckbdCnt(LtctUpdateSckbdCntCommand sckbd) throws SQLException;  
	
	List<LtctBookmarkVO> selectBookmarkList(LtctSearchCommand cri) throws SQLException;
	public int selectBookmarkListCount(LtctSearchCommand cri) throws SQLException;
	
	List<LtctBookmarkVO> selectPbhtList(LtctSearchCommand cri) throws SQLException;
	public int selectPbhtListCount(LtctSearchCommand cri) throws SQLException;
	
	void updateSckbdreqReturn(String sckbdreqNo) throws SQLException;
	void updateRmndSckbdCntReturn(String ltctNo) throws SQLException;
	
	void updateSckbdreqOk(String sckbdreqNo) throws SQLException;
	void updateHsptSckbdCntOk(String hsptNo) throws SQLException;
	void updateManageSttusCodeOk(LtctSckbdreqOkCommand sckbdreq) throws SQLException;
	void insertIsoptntOk(LtctSckbdreqOkCommand sckbdreq) throws SQLException;
	String selectIsoptntSeq() throws SQLException;
	
	List<PbhtVO> selectPbhtListByAreaNo(String areaNo) throws SQLException;
	String selectSmplSeq() throws SQLException;
	void insertSmplByLtct(LtctRequestSmplVO smpl) throws SQLException;
	
	public List<LtctVO> selectLtctBackupList() throws SQLException;
	
	
	
	int selectHsptBookmarkListCount(LtctSearchCommand cri) throws SQLException;
	List<DgnssHsptVO> selectHsptBookmarkList(LtctSearchCommand cri) throws SQLException;
	List<DgnssHsptVO> selectHsptAllList(LtctSearchCommand cri) throws SQLException;
	int selectHsptAllListCount(LtctSearchCommand cri) throws SQLException;
	
	String selectMyArea(String ltctNo) throws SQLException;
	
	DgnssHsptVO selectHsptDetail(String hsptNo) throws SQLException;
	int hsptRmndSckbdCntMinus(Map<String, Object> reqData) throws SQLException;
	int hsptDgnssRegist(Map<String, Object> reqData) throws SQLException;
	
	String selectDgnssSeq()throws SQLException;
	public int manageSttusCodeUpdate(Map<String, Object> checkData)throws SQLException;
	
	public List<String> selectIsoptntNoList() throws SQLException;
	
	public void modifyIsoptntBdtempByIsoptntNo(IsoptntVO isoptnt) throws SQLException; 
	
	Date selectSmplResult(String smplNo) throws SQLException;
	
	LtctBasicDetailVO selectPbhtByPbhtNo(String pbhtNo) throws SQLException;
	
	public String selectLtctStatsSeq() throws SQLException;
	
	public List<String> selectAllLtctNo() throws SQLException;
	
	public void insertLtctStats(LtctStatsVO ltctStats) throws SQLException;
	
	public String selectLtctStatusNo(LtctStatsVO ltctStats) throws SQLException;
	
	public String selectLtctStatusNoByQuery(String ltctNo) throws SQLException;
	
	public int selectOutIsoptntCnt(String ltctNo) throws SQLException;
	
	public void updateOutIsoptntCnt(LtctStatsVO ltctStats) throws SQLException;
	
	public int selectTotIsoptntCnt(String ltctNo) throws SQLException;
	
	public void updateTotIsoptntCnt(LtctStatsVO ltctStats) throws SQLException;
	
	public int selectRlsedCnt(String ltctNo) throws SQLException;
	
	public void updateRlsedCnt(LtctStatsVO ltctStats) throws SQLException;
	
	public void updateReqDgnssAndInIsoptnt(LtctStatsVO ltctStats) throws SQLException;
	
	public void updateReqDgnssCnt(LtctStatsVO ltctStats) throws SQLException;
	
	public void updateInIsoptntCnt(LtctStatsVO ltctStats) throws SQLException; 
	
	Date selectLtctInYmdByManageNo(String manageNo) throws SQLException;
	
	void updatePstiInfo(InspPstiVO psti) throws SQLException;
	
	InspPstiVO selectModifyCancel(String pstiNo) throws SQLException;
	
	public PstiAdresVO selectPstiAdres(String manageNo)throws SQLException;
	
	public int insertBookMarkRegist(Map<String, Object> data)throws SQLException;

	public int selectBookMark(Map<String, Object> data)throws SQLException;

	public int deleteBookMark(Map<String, Object> data)throws SQLException;
	
	int selectDgnssTodayByManageNo(String manageNo) throws SQLException;
	
	String selectLastSckbdreqNoByManageNo(String manageNo) throws SQLException;
	
	int selectSmplTodayByManageNo(Map<String, Object> data) throws SQLException;
	
	String selectRmndSckbdCntByHsptNo(String hsptNo) throws SQLException;
	
	int selectIsoptntCountByLtctNo(String ltctNo) throws SQLException;
	
	int selectSckbdreqCountByLtctNo(String ltctNo) throws SQLException;
	
	String selectNgtvCntByManageNo(String manageNo) throws SQLException;
	
	int selectDgnssResultByDgnssNo(String dgnssNo) throws SQLException;
	
	int selectDgnssResultCntByManageNo(String manageNo) throws SQLException;
}

