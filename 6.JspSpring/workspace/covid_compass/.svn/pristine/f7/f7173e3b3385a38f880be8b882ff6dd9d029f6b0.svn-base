package com.spring.compass.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
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
import com.spring.compass.command.PageMaker;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.dao.LtctDAO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.IsoptntVO;
import com.spring.compass.vo.LtctBasicDetailVO;
import com.spring.compass.vo.LtctStatsVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.PbhtVO;

public class LtctServiceImpl implements LtctService{
	
	private LtctDAO ltctDAO;
	public void setLtctDAO(LtctDAO ltctDAO) {
		this.ltctDAO = ltctDAO;
	}
	@Override
	public LtctVO getLtctByInstNo(String instNo) throws Exception {
		LtctVO ltct = ltctDAO.selectLtctByInstNo(instNo);
		return ltct;
	}
	@Override
	public String getLtctCityNo(String city) throws Exception {
		String cityNo = ltctDAO.selectLtctCityNo(city);
		return cityNo;
	}
	@Override
	public int getLtctSeqNo() throws Exception {
		int hstpSeq = ltctDAO.selectLtctNextVal();
		return hstpSeq;
	}
	@Override
	public int getInstSeqNo() throws Exception {
		int instSeq = ltctDAO.selectInstNextval();
		return instSeq;
	}
	@Override
	public void registLtct(LtctVO ltct) throws Exception {
		ltctDAO.insertLtct(ltct);
		
	}
	@Override
	public void registInst(InstVO inst) throws SQLException {
		 ltctDAO.insertInst(inst);
		
	}
	@Override
	public Map<String, Object> getIsoptntListPage(LtctSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int totalCount = ltctDAO.selectIsoptntListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		List<IsoptntListVO> isoptntList = ltctDAO.selectIsoptntList(cri);
		for(int i = 0; i < isoptntList.size(); i++) {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("instNo", cri.getInstNo());
			data.put("manageNo", isoptntList.get(i).getManageNo());
			int today = ltctDAO.selectSmplTodayByManageNo(data);
			String ngtvCnt = ltctDAO.selectNgtvCntByManageNo(isoptntList.get(i).getManageNo());
			isoptntList.get(i).setToday(today);
			isoptntList.get(i).setNgtvCnt(ngtvCnt);
			
		}
		dataMap.put("isoptntList", isoptntList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public LtctBasicDetailVO getBasicDetail(String manageNo) throws Exception {
		LtctBasicDetailVO isoptnt = ltctDAO.selectBasicDetail(manageNo);
		List<LtctBasicDetailVO> dgnssNotes = ltctDAO.selectIsoptntDgnssNote(manageNo);
		
		LtctBasicDetailVO dgnssNote = dgnssNotes.get(0);
		int dgnssResultCnt = ltctDAO.selectDgnssResultByDgnssNo(dgnssNote.getDgnssNo());
		LtctBasicDetailVO lastReq = ltctDAO.selectLastReq(manageNo);

		int today = ltctDAO.selectDgnssTodayByManageNo(manageNo);
		
		isoptnt.setToday(today);
		
		if(!lastReq.getSmplNo().isEmpty() || lastReq.getSmplNo() != null || lastReq.getSmplNo() != "") {
			String smplNo = lastReq.getSmplNo();
			Date SmplResult = ltctDAO.selectSmplResult(smplNo);
			isoptnt.setResYmd(SmplResult);
		}
		if(!lastReq.getPbhtNo().isEmpty() || lastReq.getPbhtNo() != null || lastReq.getPbhtNo() != "") {
			LtctBasicDetailVO pbht = ltctDAO.selectPbhtByPbhtNo(lastReq.getPbhtNo());
			isoptnt.setInstNm(pbht.getInstNm());
			isoptnt.setInstAdres(pbht.getInstAdres());
			isoptnt.setInstTelno(pbht.getInstTelno());
		}
		isoptnt.setReqYmd(lastReq.getReqYmd());
		isoptnt.setSmplResCode(lastReq.getSmplResCode());
		if(dgnssResultCnt > 0) {
			isoptnt.setDgnssNote(dgnssNote.getDgnssNote());
			isoptnt.setDgnssResultCode(dgnssNote.getDgnssResultCode());
		}
		
		return isoptnt;
	}
	
	@Override
	public Map<String, Object> getResListPage(LtctSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectResListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		List<LtctResListVO> resList = ltctDAO.selectResList(cri);
		
		dataMap.put("resList", resList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getSckbdListPage(LtctSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectSckbdListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		List<LtctSckbdListVO> sckbdList = ltctDAO.selectSckbdList(cri);
		
		dataMap.put("sckbdList", sckbdList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	@Override
	public LtctBasicDetailVO getSckbdreqYmd(String manageNo) throws Exception {
		LtctBasicDetailVO sckbdreqYmd = ltctDAO.selectSckbdreqYmd(manageNo);
		return sckbdreqYmd;
	}
	@Override
	public LtctSckbdCountAndStats getSckbdCountAndStats(String ltctNo) throws Exception {
		// 나눈이유는 통계가 없을경우에 병상까지 안나오기때문에 나눠서 뽑고 합침.
		LtctSckbdCountAndStats sckbdCount = ltctDAO.selectSckbdCount(ltctNo);
		LtctSckbdCountAndStats sckbdCountAndStats = ltctDAO.selectSckbdStats(ltctNo);

		int isoptntCount = ltctDAO.selectIsoptntCountByLtctNo(ltctNo);
		int sckbdreqCount = ltctDAO.selectSckbdreqCountByLtctNo(ltctNo);

		if(sckbdCountAndStats == null) {
			sckbdCount.setIsoptntCount(isoptntCount);
			sckbdCount.setSckbdreqCount(sckbdreqCount);
			
			return sckbdCount;
		}
		sckbdCountAndStats.setIsoptntCount(isoptntCount);
		sckbdCountAndStats.setSckbdreqCount(sckbdreqCount);
		
		
		sckbdCountAndStats.setRmndSckbdCnt(sckbdCount.getRmndSckbdCnt());
		sckbdCountAndStats.setSckbdCnt(sckbdCount.getSckbdCnt());
		return sckbdCountAndStats;
	}
	@Override
	public List<LtctIsoptntHighTempCardListVO> getIsoptntHighTempCardList(String ltctNo) throws Exception {
		
		List<LtctIsoptntHighTempCardListVO> highTempCardList = ltctDAO.selectIsoptntHighTempCardList(ltctNo);
		for(int i = 0; i < highTempCardList.size(); i++) {
			String manageNo = highTempCardList.get(i).getManageNo();
			int today = ltctDAO.selectDgnssResultCntByManageNo(manageNo);
			highTempCardList.get(i).setToday(today);
			highTempCardList.get(i).setToday(ltctDAO.selectDgnssTodayByManageNo(highTempCardList.get(i).getManageNo()));
		}
		return highTempCardList;
	}
	@Override
	public void modifySckbdCnt(LtctUpdateSckbdCntCommand sckbd) throws Exception {
		// 로직 => 등록하면 기존꺼에다가 + 해주기.
		LtctSckbdCountAndStats sckbdCount =ltctDAO.selectSckbdCount(sckbd.getLtctNo());
		int beforeSckbdCount = sckbdCount.getSckbdCnt(); //기존 총 병상수
		int newSckbdCount = sckbd.getSckbdCnt();
		int afterSckbdCount = beforeSckbdCount + newSckbdCount;
		
		int beforeRmndSckbdCount = sckbdCount.getRmndSckbdCnt(); // 기존 잔여병상수
		int afterRmndSckbdCount = beforeRmndSckbdCount + newSckbdCount;
		if(afterRmndSckbdCount >= 0 || afterSckbdCount >= 0) {
			sckbd.setRmndSckbdCnt(afterRmndSckbdCount);
			sckbd.setSckbdCnt(afterSckbdCount);
			ltctDAO.updateSckbdCnt(sckbd);
		}else {
			throw new Exception();
		}
	}
	@Override
	public Map<String,Object> getBookmarkListPage(LtctSearchCommand cri) throws Exception {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectBookmarkListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<LtctBookmarkVO> dhbList = ltctDAO.selectBookmarkList(cri);
		
		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public Map<String, Object> getPbhtListPage(LtctSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectPbhtListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<LtctBookmarkVO> pbhtList = ltctDAO.selectPbhtList(cri);
		
		dataMap.put("pbhtList", pbhtList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	@Override
	public void modifySckbdreqReturn(String manageNo, String ltctNo) throws Exception {
		String sckbdreqNo = ltctDAO.selectLastSckbdreqNoByManageNo(manageNo);
		ltctDAO.updateSckbdreqReturn(sckbdreqNo);
		ltctDAO.updateRmndSckbdCntReturn(ltctNo);
	}
	@Override
	public void registSckbdreqOk(LtctSckbdreqOkCommand sckbdreq) throws Exception {
		String sckbdreqNo = ltctDAO.selectLastSckbdreqNoByManageNo(sckbdreq.getManageNo());
		ltctDAO.updateSckbdreqOk(sckbdreqNo); // 코드 반영
		ltctDAO.updateHsptSckbdCntOk(sckbdreq.getHsptNo()); // 병원 병상 + 1
		String isoptntNo = ltctDAO.selectIsoptntSeq(); // 시퀀스
		sckbdreq.setIsoptntNo(isoptntNo);
		ltctDAO.updateManageSttusCodeOk(sckbdreq); // 매니저테이블 상태코드 변경
		ltctDAO.insertIsoptntOk(sckbdreq); // 입소자 등록.
		

	}
	@Override
	public List<PbhtVO> getPbhtListByAreaNo(String areaNo) throws Exception {
		List<PbhtVO> pbhtList = ltctDAO.selectPbhtListByAreaNo(areaNo);
		return pbhtList;
	}
	@Override
	public void registSmplByLtct(LtctRequestSmplVO smpl) throws Exception {
		String smplNo = ltctDAO.selectSmplSeq();
		smpl.setSmplNo(smplNo);
		ltctDAO.insertSmplByLtct(smpl);
	}
	@Override
	public Map<String, Object> getHsptBookmarkList(LtctSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectHsptBookmarkListCount(cri);
		
		pageMaker.setTotalCount(totalCount);
		
		List<DgnssHsptVO> dhbList = ltctDAO.selectHsptBookmarkList(cri);
		
		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	@Override
	public Map<String, Object> getHsptAllList(LtctSearchCommand cri, PstiAdresVO psti) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		int totalCount = ltctDAO.selectHsptAllListCount(cri);
		
		cri.setMyArea(psti.getAreaNo());
		pageMaker.setTotalCount(totalCount);
		
		List<DgnssHsptVO> dhbList = ltctDAO.selectHsptAllList(cri);
		
		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public int setHsptDgnssRegist(Map<String, Object> reqData) throws Exception {
		int result = 0;
		
		String check = "success";
		
		String dgnssNo = ltctDAO.selectDgnssSeq();
		reqData.put("dgnssNo", dgnssNo);
		
		if(ltctDAO.hsptDgnssRegist(reqData) == 0) check = "fail";
		if(ltctDAO.hsptRmndSckbdCntMinus(reqData) <= 0) check = "fail";
		
		if(check.equals("success")) {
			result = 1;
		}
		
		return result;
	}
	@Override
	public DgnssHsptVO getHsptDetail(String hsptNo) throws Exception {
		DgnssHsptVO hspt = ltctDAO.selectHsptDetail(hsptNo);
		return hspt;
	}
	@Override
	public List<LtctVO> getLtctBackupList() throws Exception {
		List<LtctVO> ltctBackupList = ltctDAO.selectLtctBackupList();
		return ltctBackupList;
	}
	@Override
	public List<String> getIsoptntNoList() throws Exception {
		List<String> isoptntNoList = ltctDAO.selectIsoptntNoList();
		return isoptntNoList;
	}
	@Override
	public void modifyIsoptntBdtempByIsoptntNo(IsoptntVO isoptnt) throws Exception {
		ltctDAO.modifyIsoptntBdtempByIsoptntNo(isoptnt);
	}
	@Override
	public String getLtctStatsSeq() throws Exception {
		return ltctDAO.selectLtctStatsSeq();
	}
	@Override
	public List<String> getAllLtctNo() throws Exception {
		return ltctDAO.selectAllLtctNo();
	}
	@Override
	public void registLtctStats(LtctStatsVO ltctStats) throws Exception {
		ltctDAO.insertLtctStats(ltctStats);
	}
	@Override
	public Date getLtctInYmdByManageNo(String manageNo) throws Exception {
		return ltctDAO.selectLtctInYmdByManageNo(manageNo);
	}
	@Override
	public InspPstiVO getModifyCancel(String pstiNo) throws Exception {
		return ltctDAO.selectModifyCancel(pstiNo);
	}
	@Override
	public void modifyPstiInfo(InspPstiVO psti) throws Exception {
		ltctDAO.updatePstiInfo(psti);
	}
	@Override
	public PstiAdresVO getPstiDetail(String manageNo) throws Exception {
		return ltctDAO.selectPstiAdres(manageNo);
	}
	@Override
	public int setBookMark(Map<String, Object> data) throws Exception {
		return ltctDAO.insertBookMarkRegist(data);
	}
	@Override
	public int getBookMark(Map<String, Object> data) throws Exception {
		return ltctDAO.selectBookMark(data);
	}
	@Override
	public int removeBookMark(Map<String, Object> data) throws Exception {
		return ltctDAO.deleteBookMark(data);
	}
	@Override
	public String getRmndSckbdCntByHsptNo(String hsptNo) throws Exception {
		return ltctDAO.selectRmndSckbdCntByHsptNo(hsptNo);
	}
	@Override
	public int getDgnssTodayByManageNo(String manageNo) throws Exception {
		return ltctDAO.selectDgnssTodayByManageNo(manageNo);
	}
	@Override
	public String getNgtvCntByManageNo(String manageNo) throws Exception {
		return ltctDAO.selectNgtvCntByManageNo(manageNo);
	}
}
