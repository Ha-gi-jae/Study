package com.spring.compass.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.compass.command.CnfrmDgnssListVO;
import com.spring.compass.command.CnfrmDgnssReqDetailVO;
import com.spring.compass.command.CnfrmDgnssWaitDetailVO;
import com.spring.compass.command.CnfrmListDetailManageInstVO;
import com.spring.compass.command.CnfrmListDetailVO;
import com.spring.compass.command.CnfrmManageListVO;
import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.PageMaker;
import com.spring.compass.command.PbhtStatsCommand;
import com.spring.compass.command.PbhtStatsDateCommand;
import com.spring.compass.command.PbhtStatsWeekCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.command.ResSmplDetailNegativeSmplInstVO;
import com.spring.compass.command.ResSmplDetailPstiHtscVO;
import com.spring.compass.command.ResSmplDetailSmplCnfmInstVO;
import com.spring.compass.command.ResSmplDetailVO;
import com.spring.compass.command.SlfptntDetailDgnssHsptVO;
import com.spring.compass.command.SlfptntDetailSmplCnfmVO;
import com.spring.compass.command.SlfptntDetailVO;
import com.spring.compass.command.SmplListDetailVO;
import com.spring.compass.command.SmplResultCheckVO;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.dao.PbhtDAO;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SmplResultVO;
import com.spring.compass.vo.SmplVO;

public class PbhtServiceImplLMY extends PbhtServiceImpl implements PbhtServiceLMY {

	private static final Logger LOGGER = LoggerFactory.getLogger(PbhtServiceImplLMY.class);

	private PbhtDAO pbhtDAO;

	public void setPbhtDAO(PbhtDAO pbhtDAO) {
		this.pbhtDAO = pbhtDAO;
	}

	@Override
	public Map<String, Object> getSmplList(SmplSearchCommand cri) throws Exception {

		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = pbhtDAO.selectSearchSemplListCount(cri);

		pageMaker.setTotalCount(totalCount);

		List<SmplVO> smplList = pbhtDAO.selectSmplList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("smplList", smplList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSmplResultList(SmplSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = pbhtDAO.selectSearchSemplResultListCount(cri);

		pageMaker.setTotalCount(totalCount);

		List<SmplResultCheckVO> smplResultList = pbhtDAO.selectSearchSmplResultList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("smplResultList", smplResultList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getCnfrmDgnssList(SmplSearchCommand cri, int displayPageNum) throws Exception {
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = null;
		
		pageMaker = new PageMaker();
		pageMaker.custumSetDisplayPageNum(displayPageNum);
		pageMaker.setCri(cri);

		if (cri.getTypeCode().equals("A102")) {
			int totalCount = pbhtDAO.selectCnfrmDgnssListCount(cri);
			pageMaker.setTotalCount(totalCount);
			List<CnfrmDgnssListVO> cfdList = pbhtDAO.selectCnfrmDgnssList(cri);
			dataMap.put("cfdList", cfdList);
		} else {
			int totalCount = pbhtDAO.dgnssReqListCount(cri);
			pageMaker.setTotalCount(totalCount);
			List<CnfrmDgnssListVO> cfdList = pbhtDAO.dgnssReqList(cri);
			dataMap.put("cfdList", cfdList);
		}

		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getCnfrmManageList(SmplSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = null;

		int totalCount;
		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		if (cri.getTypeCode().equals("A107")) {

			totalCount = pbhtDAO.selectSlfManageListCount(cri);
		} else {
			totalCount = pbhtDAO.selectCnfrmManageListCount(cri);
		}

		pageMaker.setTotalCount(totalCount);

		List<CnfrmManageListVO> cfmList = pbhtDAO.selectCnfrmManageList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("cfmList", cfmList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public SmplListDetailVO getSmplDetail(Map<String, Object> sldData) throws Exception {

		SmplListDetailVO sldVO = pbhtDAO.selectSmplDetail(sldData);

		return sldVO;
	}

	@Override
	public CnfrmDgnssWaitDetailVO getCnfrmDgnssWaitDetail(Map<String, Object> cdwdData) throws Exception {
		CnfrmDgnssWaitDetailVO cdwdVO = pbhtDAO.selectCnfrmDgnssWaitDetail(cdwdData);
		return cdwdVO;
	}

	@Override
	public CnfrmDgnssReqDetailVO getCnfrmDgnssReqDetail(Map<String, Object> cdrdData) throws Exception {
		CnfrmDgnssReqDetailVO cdrdVO = pbhtDAO.selectCnfrmDgnssReqDetail(cdrdData);
		
		boolean result = cdrdVO.toCancleYmd();
		
		cdrdVO.setResult(result);
		
		return cdrdVO;
	}

	@Override
	public CnfrmListDetailVO getCnfrmListDetail(String manageNo) throws Exception {

		CnfrmListDetailVO cldVO = new CnfrmListDetailVO();

		VPstiCommand pstiVO = pbhtDAO.selectCnfrmListDetailPsti(manageNo);
		CnfmVO cnfmVO = pbhtDAO.selectCnfrmListDetailCnfm(manageNo);
		CnfrmListDetailManageInstVO manageVO = pbhtDAO.selectCnfrmListDetailManage(manageNo);
		SmplResultVO smplVO = pbhtDAO.selectCnfrmListDetailSmpl(manageNo);
		DgnssVO dgnssVO = pbhtDAO.selectCnfrmListDetailDgnss(manageNo);

		cldVO.setData(pstiVO);
		cldVO.setData(cnfmVO);
		cldVO.setData(manageVO);
		cldVO.setData(smplVO);
		cldVO.setData(dgnssVO);

		return cldVO;
	}

	@Override
	public SlfptntDetailVO getSlfptntDetail(String manageNo) throws Exception {

		SlfptntDetailVO sdVO = new SlfptntDetailVO();

		VPstiCommand psti = pbhtDAO.selectSlfptntDetailPsti(manageNo);
		SlfptntDetailSmplCnfmVO sdscVO = pbhtDAO.selectSlfptntDetailSmplCnfm(manageNo);
		SlfptntDetailDgnssHsptVO sddhVO = pbhtDAO.selectSlfptntDetailDgnssHspt(manageNo);

		sdVO.setData(psti);
		sdVO.setData(sdscVO);
		sdVO.setData(sddhVO);

		return sdVO;
	}

	@Override
	public ResSmplDetailVO getResSmplDetail(String manageNo, String typeCode, String smplNo) throws Exception {
		Map<String, Object> checkData = null;

		ResSmplDetailVO rsdVO = new ResSmplDetailVO();

		checkData = new HashMap<String, Object>();
		checkData.put("manageNo", manageNo);
		checkData.put("smplNo", smplNo);
		ResSmplDetailPstiHtscVO rsdphVO = pbhtDAO.selectResSmplDetailPstiHtsc(manageNo);
		if (typeCode.equals("K103")) {
			ResSmplDetailNegativeSmplInstVO rsdnsiVO = pbhtDAO.selectResSmplDetailNegativeSmplInst(checkData);
			rsdVO.setDate(rsdnsiVO);
		} else {
			ResSmplDetailSmplCnfmInstVO rsdscVO = pbhtDAO.selectResSmplDetailSmplCnfmInst(checkData);
			rsdVO.setDate(rsdscVO);
		}

		rsdVO.setDate(rsdphVO);

		System.out.println(rsdVO);

		return rsdVO;
	}

	@Override
	public int setCheckSmplRegist(Map<String, Object> checkData) throws Exception {

		int result = 0;

		String check = "success";

		int cnt = 0;
		
		String pbhtNo = (String)checkData.get("pbhtNo");
		
		InstVO inst = pbhtDAO.selectInstData(pbhtNo);
		
		cnt = pbhtDAO.selectCheckNewSmpl(checkData);
		if (cnt > 0) {
			if (checkData.get("sttusCode").equals("A102")) {
				checkData.put("pstvYn", "Y");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K102");
				if (pbhtDAO.newSmplResultRegist(checkData) == 0)
					check = "fail";
				if (pbhtDAO.smplUpdate(checkData) == 0)
					check = "fail";
				if (pbhtDAO.cnfmUpdateY(checkData) == 0)
					check = "fail";
			} else {
				checkData.put("pstvYn", "N");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K103");
				if (pbhtDAO.newSmplResultRegist(checkData) == 0)
					check = "fail";
				if (pbhtDAO.smplUpdate(checkData) == 0)
					check = "fail";

				if (pbhtDAO.selectCnfmNgtv(checkData) < 2) {
					if (pbhtDAO.cnfmUpdateN(checkData) == 0)
						check = "fail";
				} else {
					checkData.put("sttusCode", "A108");
					if (pbhtDAO.cnfmCureUpdate(checkData) == 0)
						check = "fail";
					if (pbhtDAO.manageSttusCodeUpdate(checkData) == 0)
						check = "fail";

					String instCode = pbhtDAO.selectInstCode(checkData);
					if (instCode.equals("C101")) {
						if (pbhtDAO.slfptntCureUpdate(checkData) == 0)
							check = "fail";
					} else if (instCode.equals("C103")) {
						String instNo = pbhtDAO.selectInstNo(checkData);
						checkData.put("hsptlzCode", "E102");
						checkData.put("instNo", instNo);
						if (pbhtDAO.inptntCureUpdate(checkData) == 0)
							check = "fail";
						if (pbhtDAO.hsptRmndSckbdCntCheck(checkData) == 0)
							check = "fail";
					} else {
						// isoptnt {hsptlz_code : E102}
						String instNo = pbhtDAO.selectInstNo(checkData);
						checkData.put("hsptlzCode", "E102");
						checkData.put("instNo", instNo);
						if (pbhtDAO.isoptntCureUpdate(checkData) == 0)
							check = "fail";
						if (pbhtDAO.ltctRmndSckbdCntCheck(checkData) == 0)
							check = "fail";
					}
				}
			}
		} else { // A102 = 양성, A103 = 음성
			if (checkData.get("sttusCode").equals("A102")) {
				int cnfmNo = pbhtDAO.selectCnfmNextVal();
				checkData.put("pstvYn", "Y");
				checkData.put("chkdYn", "Y");
				checkData.put("cnfmNo", cnfmNo);
				checkData.put("smplResCode", "K102");
				checkData.put("instNo", inst.getInstNo());
				checkData.put("instNm", inst.getInstNm());
				if (pbhtDAO.newSmplResultRegist(checkData) == 0)
					check = "fail";
				if (pbhtDAO.newCnfmResultRegist(checkData) == 0)
					check = "fail";
				if (pbhtDAO.smplUpdate(checkData) == 0)
					check = "fail";
				if (pbhtDAO.manageSttusCodeUpdate(checkData) == 0)
					check = "fail";
				if (pbhtDAO.updateManageInst(checkData) == 0)
					check = "fail";
			} else {
				checkData.put("pstvYn", "N");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K103");
				if (pbhtDAO.newSmplResultRegist(checkData) == 0)
					check = "fail";
				if (pbhtDAO.smplUpdate(checkData) == 0)
					check = "fail";
				if (pbhtDAO.manageSttusCodeUpdate(checkData) == 0)
					check = "fail";
			}

		}

		if (check.equals("success")) {
			result = 1;
		}

		return result;
	}

	@Override
	public Map<String, Object> getDgnssHsptBookmarkList(SmplSearchCommand cri) throws Exception {
		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = pbhtDAO.selectSerchDgnssHsptBookmarkListCount(cri);

		pageMaker.setTotalCount(totalCount);

		List<DgnssHsptVO> dhbList = pbhtDAO.selectDgnssHsptBookmarkList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public DgnssHsptVO getHsptDetail(String hsptNo) throws Exception {
		DgnssHsptVO dhVO = pbhtDAO.selectHsptDetail(hsptNo);
		return dhVO;
	}

	@Override
	public Map<String, Object> getDgnssHsptAllList(SmplSearchCommand cri, PstiAdresVO psti) throws Exception {
		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = pbhtDAO.selectDgnssHsptAllListCount(cri);

		cri.setMyArea(psti.getAreaNo());
		pageMaker.setTotalCount(totalCount);

		List<DgnssHsptVO> dhbList = pbhtDAO.selectDgnssHsptAllList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getHsptAllList(SmplSearchCommand cri, String areaNo) throws Exception {
		Map<String, Object> dataMap = null;

		PageMaker pageMaker = null;

		pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int totalCount = pbhtDAO.selectDgnssHsptAllListCount(cri);

		if (areaNo.equals("")) {
			String pbhtNo = cri.getPbhtNo();
			String myArea = pbhtDAO.selectMyArea(pbhtNo);
			cri.setMyArea(myArea);
		} else {
			cri.setMyArea(areaNo);
		}

		pageMaker.setTotalCount(totalCount);

		List<DgnssHsptVO> dhbList = pbhtDAO.selectDgnssHsptAllList(cri);

		dataMap = new HashMap<String, Object>();

		dataMap.put("dhbList", dhbList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public int setHsptDgnssRegist(Map<String, Object> reqData) throws Exception {

		int result = 0;

		String check = "success";

		String dgnssNo = pbhtDAO.selectDgnssStatsSeq();
		reqData.put("dgnssNo", dgnssNo);
		reqData.put("sttusCode", "A104");

		if (pbhtDAO.hsptDgnssRegist(reqData) == 0)
			check = "fail";
		if (pbhtDAO.manageSttusCodeUpdate(reqData) == 0)
			check = "fail";
		if (pbhtDAO.hsptRmndSckbdCntMinus(reqData) == 0)
			check = "fail";

		if (check.equals("success")) {
			result = 1;
		}

		return result;
	}

	@Override
	public String setDgnssReqDelete(String dgnssNo, String manageNo, String hsptNo) throws Exception {

		String result = "success";
		Boolean check = true;

		System.out.println(dgnssNo + "*----------*" + manageNo + "********----------*" + hsptNo + "---------------");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("manageNo", manageNo);
		dataMap.put("sttusCode", "A102");
		if (pbhtDAO.deleteDgnssReq(dgnssNo) == 0)
			check = false;
		if (pbhtDAO.manageSttusCodeUpdate(dataMap) == 0)
			check = false;
		if (pbhtDAO.hsptRmndSckbdCntPlus(hsptNo) == 0)
			check = false;

		if (!check) {
			result = "fail";
		}
		return result;
	}

	@Override
	public int setSelfModifyRegist(PstiVO pstiVo) throws Exception {

		int cnt = pbhtDAO.selfModifyRegist(pstiVo);

		return cnt;
	}

	@Override
	public PstiAdresVO getPstiDatile(String manageNo) throws Exception {

		PstiAdresVO psti = pbhtDAO.selectPstiAdres(manageNo);

		return psti;
	}

	@Override
	public int setBookMark(Map<String, Object> data) throws Exception {

		int cnt = pbhtDAO.insertBookMarkRegist(data);
		return cnt;
	}

	@Override
	public int getBookMark(Map<String, Object> data) throws Exception {
		int cnt = pbhtDAO.selectBookMark(data);
		return cnt;
	}

	@Override
	public int deleteBookMark(Map<String, Object> data) throws Exception {
		int cnt = pbhtDAO.deleteBookMark(data);
		return cnt;
	}

	@Override
	public Map<String, Object> getPbhtStats(String pbhtNo) throws Exception {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		PbhtStatsCommand pbhtOneWeekStats = pbhtDAO.selectOneWeekPbhtStats(pbhtNo);
		PbhtStatsCommand pbhtAllStats = pbhtDAO.selectAllPbhtStats(pbhtNo);

		PbhtStatsDateCommand pbhtStatsDate = pbhtDAO.selectStatsDate(pbhtNo);

		Map<String, Object> weekMap = pbhtStatsDate.getMap();
		weekMap.put("statsDate", pbhtStatsDate);
		List<PbhtStatsWeekCommand> weekData = pbhtDAO.selectStatsWeek(pbhtNo);
		List<String> weekList = pbhtStatsDate.toList();

		LOGGER.debug("weekData : {}", weekData);
		LOGGER.debug("weekList : {}", weekList);
		List<PbhtStatsWeekCommand> NegativeData = pbhtDAO.selectStatsNegativeWeek(pbhtNo);

		for (int j = 0; j < weekList.size(); j++) {
			Map<String, Object> statsData = new HashMap<String, Object>();
			for (int i = 0; i < weekData.size(); i++) {
				if (weekList.get(j).equals(weekData.get(i).getResYmd())) {
					statsData.put(weekData.get(i).getDgnssResultCode(), weekData.get(i));
				}

			}
			for (int z = 0; z < NegativeData.size(); z++) {

				if (weekList.get(j).equals(NegativeData.get(z).getResYmd())) {
					statsData.put("negativeData", NegativeData.get(z));
				}
			}

			weekMap.put(weekList.get(j), statsData);

		}
		LOGGER.debug("weekMap : {}", weekMap);
		LOGGER.debug("{}", pbhtOneWeekStats);
		LOGGER.debug("{}", pbhtAllStats);

		// weekMap.put(weekData.get(i).getResYmd(), statsData);
		dataMap.put("weekList", weekList);
		LOGGER.debug("weekList : {}", weekList);
		dataMap.put("weekMap", weekMap);
		dataMap.put("pbhtOneWeekStats", pbhtOneWeekStats);
		dataMap.put("pbhtAllStats", pbhtAllStats);

		return dataMap;
	}

	@Override
	public int getRmndSckbdCntCheck(String hsptNo) throws Exception {
		int result = pbhtDAO.selectRmndSckbdCntCheck(hsptNo);
		return result;
	}

}
