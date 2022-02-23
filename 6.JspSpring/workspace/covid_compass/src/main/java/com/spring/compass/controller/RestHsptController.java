package com.spring.compass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.DgnssDetailCommand;
import com.spring.compass.command.DgnssListSearchCommand;
import com.spring.compass.command.DgnssListVO;
import com.spring.compass.command.DgnssProcessCommand;
import com.spring.compass.command.InptntDetailCommand;
import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InptntListVO;
import com.spring.compass.command.InstSearchCommand;
import com.spring.compass.command.MberManageCommand;
import com.spring.compass.command.ReqInptntDetailCommand;
import com.spring.compass.command.ReqInptntListCommand;
import com.spring.compass.command.SckbdreqDetailCommand;
import com.spring.compass.command.SckbdreqLtctListCommand;
import com.spring.compass.command.SckbdreqProcessCommand;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.scheduler.HsptStatisticsUpdateScheduler;
import com.spring.compass.service.HsptSerivceLKH;
import com.spring.compass.service.HsptService;
import com.spring.compass.service.LtctServiceLKH;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtServiceLKH;
import com.spring.compass.service.PstiServiceLKH;
import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.util.ErrorCodeUtil;
import com.spring.compass.util.MakeStatisticsLogByHspt;
import com.spring.compass.util.MakeStatisticsLogByLtct;
import com.spring.compass.util.XSSUtil;
import com.spring.compass.vo.BookmarkVO;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SmplResultVO;

@RestController
@RequestMapping("/rest-hspt")
public class RestHsptController {

	private static final Logger LOGGER = LoggerFactory.getLogger(RestHsptController.class);

	@Autowired
	@Qualifier("hsptServiceLKH")
	private HsptSerivceLKH hsptServiceLKH;

	@Autowired
	private PstiServiceLKH pstiServiceLKH;
	
	@Autowired
	private HsptSerivceLKH hsptSerivceLKH;
	
	@Autowired
	private LtctServiceLKH ltctServiceLKH;
	
	@Autowired
	private PbhtServiceLKH pbhtServiceLKH;
		
	@Autowired
	private MakeStatisticsLogByHspt makeStatisticsLogByHspt;
	
	@Autowired
	private MberService mberService;

	@Autowired
	private HsptService hsptService;
	
	// 입원환자 목록
	@RequestMapping("/inptnt-list")
	public ResponseEntity<Map<String, Object>> inptntList(
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum, 
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, 
			HttpSession session
	) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		LOGGER.debug(String.format("page is %d, searchType is %s, keyword is %s, perpageNum is %d", page,
				searchType, keyword, perPageNum));

		
		InptntListSearchCommand cri = new InptntListSearchCommand(page, perPageNum, searchType, keyword);

		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));

		LOGGER.debug("{}",hspt);

		cri.setHsptNo(hspt.getHsptNo());
		cri.setInstNo(hspt.getInstNo());
		LOGGER.debug("{}",cri);

		try {
			Map<String, Object> dataMap = hsptServiceLKH.getInptntList(cri);
			
			List<InptntListVO> inptntList = (List<InptntListVO>) dataMap.get("inptntList");
			
			if(inptntList != null && !inptntList.isEmpty()) {
				InptntListVO firstRecord = inptntList.get(0);
				
				dataMap.put("firstRecord", firstRecord);
			}

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	
	// 진료요청 목록 
	@RequestMapping("/dgnss-list")
	public ResponseEntity<Map<String, Object>> dgnssList(
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session)
					throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		LOGGER.debug(String.format("page is %d, searchType is %s, keyword is %s, perpageNum is %d", page,
				searchType, keyword, perPageNum));
		DgnssListSearchCommand cri = new DgnssListSearchCommand(page, perPageNum, searchType, keyword);

		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));

		LOGGER.debug("{}",hspt);

		cri.setHsptNo(hspt.getHsptNo());

		LOGGER.debug("{}",cri);

		try {
			Map<String, Object> dataMap = hsptServiceLKH.getDgnssList(cri);

			List<DgnssListVO> dgnssList = (List<DgnssListVO>)dataMap.get("dgnssList");
			
			if(dgnssList != null && !dgnssList.isEmpty()) {
				DgnssListVO firstRecord = dgnssList.get(0);
				dataMap.put("firstRecord", firstRecord);
			}
					
					
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}


	// 병상신청 승인대기 목록
	@RequestMapping("/req-inptnt-list")
	public ResponseEntity<Map<String, Object>> reqInptntList(
												@RequestParam(defaultValue = "1") int page,
												@RequestParam(defaultValue = "15") int perPageNum,
												@RequestParam(defaultValue = "") String searchType,
												@RequestParam(defaultValue = "") String keyword, 
												HttpSession session)
														throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		LOGGER.debug(String.format("page is %d, searchType is %s, keyword is %s, perpageNum is %d", page,
				searchType, keyword, perPageNum));
		InptntListSearchCommand cri = new InptntListSearchCommand(page, perPageNum, searchType, keyword);

		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));

		LOGGER.debug("{}",hspt);

		cri.setHsptNo(hspt.getHsptNo());

		LOGGER.debug("{}",cri);
		
		try {
			Map<String, Object> dataMap = hsptServiceLKH.getReqInptntList(cri);
			
			List<ReqInptntListCommand> reqInptntList = (List<ReqInptntListCommand>)dataMap.get("reqInptntList");
			
			if(reqInptntList != null && !reqInptntList.isEmpty()) {
				ReqInptntListCommand firstRecord = reqInptntList.get(0);
				dataMap.put("firstRecord", firstRecord);
			}

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	// 병상신청 목록(이원신청 목록, 입소신청 목록 모두 핸들링)
	@RequestMapping("/sckbdreq-list")
	public ResponseEntity<Map<String, Object>> sckbdreqList(
												@RequestParam(defaultValue = "1") int page,
												@RequestParam(defaultValue = "15") int perPageNum,
												@RequestParam(defaultValue = "") String searchType,
												@RequestParam(defaultValue = "") String keyword,
												@RequestParam(defaultValue="C103")String typeCode,
												@RequestParam(defaultValue="")String searchCode,
												HttpSession session)
														throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		LOGGER.debug(String.format("page is %d, searchType is %s, keyword is %s, perpageNum is %d, typeCode is %s, searchCode is %s", page,
				searchType, keyword, perPageNum, typeCode, searchCode));
		
		
		InptntListSearchCommand cri = new InptntListSearchCommand(page, perPageNum, searchType, keyword);

		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));

		LOGGER.debug("{}",hspt);

		cri.setHsptNo(hspt.getHsptNo());
		cri.setTypeCode(typeCode);
		cri.setSearchCode(searchCode);

		LOGGER.debug("{}",cri);
		
		Map<String, Object> dataMap = null;
		
		try {
			
			if(cri.getTypeCode().equals("C103")){
				dataMap = hsptServiceLKH.getSckbdreqHsptList(cri);
				
				List<ReqInptntListCommand> sckbdreqList =  (List<ReqInptntListCommand>)dataMap.get("sckbdreqList");
				
				if(sckbdreqList != null && !sckbdreqList.isEmpty()) {
					ReqInptntListCommand firstRecord = sckbdreqList.get(0);
					dataMap.put("firstRecord", firstRecord);
				}
				
			}
			if(cri.getTypeCode().equals("C104")) {
				dataMap = hsptServiceLKH.getSckbdreqLtctList(cri);
				List<SckbdreqLtctListCommand> sckbdreqList =  (List<SckbdreqLtctListCommand>)dataMap.get("sckbdreqList");
				
				if(sckbdreqList != null && !sckbdreqList.isEmpty()) {
					SckbdreqLtctListCommand firstRecord = sckbdreqList.get(0);
					dataMap.put("firstRecord", firstRecord);
				}				
			}

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	// 진료대기 상세
	@RequestMapping("/dgnss-detail")
	public ResponseEntity<DgnssDetailCommand> dgnssDetail(String manageNo) throws Exception {
		ResponseEntity<DgnssDetailCommand> entity = null;

		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);

		SmplResultVO smplResult = pstiServiceLKH.getVSmplResultByManageNo(manageNo);

		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);

		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",smplResult);
		LOGGER.debug("{}",dgnssResult);

		DgnssDetailCommand dgnssDetailCommand = new DgnssDetailCommand();

		dgnssDetailCommand.setData(dgnssResult);
		dgnssDetailCommand.setData(smplResult);
		dgnssDetailCommand.setData(psti);
		
		LOGGER.debug("{}",dgnssDetailCommand);

		entity = new ResponseEntity<DgnssDetailCommand>(dgnssDetailCommand, HttpStatus.OK);

		return entity;
	}
	
	// 입원환자 상세
	@RequestMapping("/inptnt-detail")
	public ResponseEntity<InptntDetailCommand> inptntDetail(String manageNo) throws Exception{
		ResponseEntity<InptntDetailCommand> entity = null;
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
		InptntVO inptnt = pstiServiceLKH.getInptntByManageNo(manageNo);
		CnfmVO cnfm = pstiServiceLKH.getCnfmByManageNo(manageNo);
		SmplResultVO smplResult = pstiServiceLKH.getVSmplResultByManageNo(manageNo);
		
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",dgnssResult);
		LOGGER.debug("{}",inptnt);
		LOGGER.debug("{}",cnfm);
		LOGGER.debug("{}",smplResult);
		
		InptntDetailCommand inptntDetailCommand = new InptntDetailCommand();
		
		inptntDetailCommand.setData(inptnt);
		inptntDetailCommand.setData(dgnssResult);
		inptntDetailCommand.setData(psti);
		inptntDetailCommand.setData(cnfm);
		inptntDetailCommand.setData(smplResult);
		
		LOGGER.debug("{}",inptntDetailCommand);

		HsptVO dgnssHspt = hsptSerivceLKH.getHsptByHsptNo(inptntDetailCommand.getDgnssHsptNo());
		String dgnssHsptNm = dgnssHspt.getInstNm();
		
		LOGGER.debug("{}", dgnssHspt);

		inptntDetailCommand.setDgnssHsptNm(dgnssHsptNm);
		
		
		int test = hsptSerivceLKH.getSckbdreqTodayByManageNo(manageNo);
		
		String disabled = test > 0 ? "disabled" : "enabled";
		
		inptntDetailCommand.setDisabled(disabled);
		
		LOGGER.debug("{}", "before");		
		LOGGER.debug("{}", inptntDetailCommand.getDisabled());		
		LOGGER.debug("{}", "after");		
		
		
		entity = new ResponseEntity<InptntDetailCommand>(inptntDetailCommand, HttpStatus.OK);
		
		return entity;
	}
	
	// 병상신청 승인대기 상세
	@RequestMapping("/req-inptnt-detail")
	public ResponseEntity<ReqInptntDetailCommand> reqInptntDetail(String manageNo) throws Exception{
		ResponseEntity<ReqInptntDetailCommand> entity = null;
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
		
		SckbdreqVO sckbdreq = pstiServiceLKH.getSckbdreqByManageNo(manageNo);
		
		String hsptNo = sckbdreq.getHsptNo();
		HsptVO hspt = hsptSerivceLKH.getHsptByHsptNo(hsptNo);
		SmplResultVO smplResult = pstiServiceLKH.getVSmplResultByManageNo(manageNo);
		
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",dgnssResult);
		LOGGER.debug("{}",sckbdreq);
		LOGGER.debug("{}",hspt);
		LOGGER.debug("{}",smplResult);
		
		ReqInptntDetailCommand reqInptntDetailCommand = new ReqInptntDetailCommand();
		
		reqInptntDetailCommand.setData(dgnssResult);
		reqInptntDetailCommand.setData(psti);
		reqInptntDetailCommand.setData(sckbdreq);
		reqInptntDetailCommand.setData(hspt);
		reqInptntDetailCommand.setData(smplResult);
		
		LOGGER.debug("{}", reqInptntDetailCommand);
		
		HsptVO dgnssHspt = hsptSerivceLKH.getHsptByHsptNo(reqInptntDetailCommand.getDgnssHsptNo());
		String dgnssHsptNm = dgnssHspt.getInstNm();
		
		LOGGER.debug("{}", dgnssHspt);

		reqInptntDetailCommand.setDgnssHsptNm(dgnssHsptNm);
		
		LOGGER.debug("{}", reqInptntDetailCommand);
		
		entity = new ResponseEntity<ReqInptntDetailCommand>(reqInptntDetailCommand, HttpStatus.OK);
		
		return entity;
	}
	
	// 병상신청 상세(이원신청, 입소신청 모두 핸들링)
	@RequestMapping("/sckbdreq-detail")
	public ResponseEntity<SckbdreqDetailCommand> sckbdreqLtctDetail(String manageNo, String sckbdreqNo) throws Exception{
		ResponseEntity<SckbdreqDetailCommand> entity = null;
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
		SmplResultVO smplResult = pstiServiceLKH.getVSmplResultByManageNo(manageNo);
		SckbdreqVO sckbdreq = pstiServiceLKH.getSckbdreqByManageNo(manageNo);
		InptntVO inptnt = pstiServiceLKH.getInptntByManageNo(manageNo);
		CnfmVO cnfm = pstiServiceLKH.getCnfmByManageNo(manageNo);
		
		String childNo = sckbdreq.getChildNo();
		LtctVO ltct = null;
		HsptVO hspt = null;
		
		LOGGER.debug(sckbdreq.getType());
		
		LOGGER.debug("sckbdreqNo param : {}", sckbdreqNo);
		LOGGER.debug("sckbdreqNo get : {}", sckbdreq.getSckbdreqNo());
		LOGGER.debug("test : {}", sckbdreq.getSckbdreqNo().equals(sckbdreqNo));
		
		boolean lastRecord = sckbdreq.getSckbdreqNo().equals(sckbdreqNo);
		LOGGER.debug("lastRecord : {}", lastRecord);
		
		if(sckbdreq.getType().equals("A")) {
			hspt = hsptSerivceLKH.getHsptByHsptNo(childNo);
		}
		if(sckbdreq.getType().equals("B")) {
			ltct = ltctServiceLKH.getLtctByLtctNo(childNo);
		}
		
		LOGGER.debug("{}","before");
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",dgnssResult);
		LOGGER.debug("{}",smplResult);
		LOGGER.debug("{}",sckbdreq);
		LOGGER.debug("{}",inptnt);
		LOGGER.debug("{}",cnfm);
		LOGGER.debug("{}",ltct);
		LOGGER.debug("{}",hspt);
		LOGGER.debug("{}","after");
		
		SckbdreqDetailCommand sckbdreqDetailCommand = new SckbdreqDetailCommand();
		
		sckbdreqDetailCommand.setData(dgnssResult);
		sckbdreqDetailCommand.setData(psti);
		sckbdreqDetailCommand.setData(sckbdreq);
		sckbdreqDetailCommand.setData(ltct);
		sckbdreqDetailCommand.setData(hspt);
		sckbdreqDetailCommand.setData(smplResult);
		sckbdreqDetailCommand.setData(inptnt);
		sckbdreqDetailCommand.setData(cnfm);
		
		sckbdreqDetailCommand.setLastRecord(lastRecord);
		
		HsptVO dgnssHspt = hsptSerivceLKH.getHsptByHsptNo(sckbdreqDetailCommand.getDgnssHsptNo());
		String dgnssHsptNm = dgnssHspt.getInstNm();
		
		LOGGER.debug("{}", dgnssHspt);

		sckbdreqDetailCommand.setDgnssHsptNm(dgnssHsptNm);
		
		LOGGER.debug("{}", sckbdreqDetailCommand);
		
		entity = new ResponseEntity<SckbdreqDetailCommand>(sckbdreqDetailCommand, HttpStatus.OK);
		
		return entity;
	}	
	
	// 생활치료센터에서 요청한 환자를 진료하고 별도의 사후처리를 하지 않는 메서드
	//-------------------------------------------------
	// insert	dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}
	// update	dgnss				|	#{dgnssNo}
	//			hspt				|	#{hsptNo}		
	//--------------------------------------------------
	@RequestMapping("/process-dgnss-result-isoptnt")
	public ResponseEntity<Map<String,Object>> processDgnssResultIsoptnt(DgnssProcessCommand dgnssProcessCommand, HttpSession session) throws Exception{

		ResponseEntity<Map<String,Object>> entity = null;
		
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();
		
		DgnssResultVO dgnssResult = null;
		
		HsptVO loginHspt = null;
		
		String msg = null;
		
		dgnssResult = new DgnssResultVO();
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		LOGGER.debug("{}", dgnssProcessCommand);
		
		dgnssResult.setDgnssNo(dgnssProcessCommand.getDgnssNo());
		dgnssResult.setDgnssNote(XSSUtil.xssProcess(dgnssProcessCommand.getDgnssNote()));
		dgnssResult.setDgnssResultCode(dgnssProcessCommand.getDgnssResultCode());
		dgnssResult.setManageNo(dgnssProcessCommand.getManageNo());		
		
		msg = hsptSerivceLKH.registDgnssResultByIsoptnt(dgnssResult, loginHspt);
		
		dataMap.put("colseWindow", dgnssProcessCommand.isCloseWindow());
		dataMap.put("msg", msg);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
		return entity;
		
	}
	
	// 진료후 입원처리하는 메서드
	@RequestMapping("/process-dgnss-inptnt")
	public ResponseEntity<Map<String,Object>> processDgnssInptnt(DgnssProcessCommand dgnssProcessCommand, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		LOGGER.debug("{}", dgnssProcessCommand);
		
		HsptVO loginHspt = null;
		DgnssResultVO dgnssResult = null;
		String fromLtctNo = null;
		String msg = null;
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dgnssResult = new DgnssResultVO();
		
		dgnssResult.setDgnssNo(dgnssProcessCommand.getDgnssNo());
		dgnssResult.setDgnssNote(XSSUtil.xssProcess(dgnssProcessCommand.getDgnssNote()));
		dgnssResult.setDgnssResultCode(dgnssProcessCommand.getDgnssResultCode());
		dgnssResult.setManageNo(dgnssProcessCommand.getManageNo());
		
		LOGGER.debug("{}",loginHspt);
		LOGGER.debug("{}",dgnssResult);
		if(dgnssProcessCommand.getType().equals("A")) {
			
			// 보건소에서 요청한 신규환자를 진료하고 바로 입원시키는 메서드
			msg = hsptSerivceLKH.registInptntByDgnss(dgnssResult, loginHspt);
			
			// 입원환자 등록 로그
			MakeStatisticsLogByHspt.getInstance().makeHsptStatisticsInptnt(loginHspt.getHsptNo());
			LOGGER.debug(msg);
			
		}
		if(dgnssProcessCommand.getType().equals("B")) {			
			
			// 생활치료센터에서 진료요청한 환자를 진료하고 입원처리하는 메서드
			fromLtctNo = dgnssProcessCommand.getChildNo();
			
			LOGGER.debug(fromLtctNo);
			
			// 입원환자 등록 로그
			MakeStatisticsLogByHspt.getInstance().makeHsptStatisticsInptnt(loginHspt.getHsptNo());
			// 입소환자 퇴원(이원)로그
			MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsOutptnt(fromLtctNo);
			
			msg = hsptSerivceLKH.registInptntByIsoptnt(dgnssResult, loginHspt, fromLtctNo);
			LOGGER.debug(msg);
			
		}
		dataMap.put("colseWindow", dgnssProcessCommand.isCloseWindow());
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		// 진료기록 로그
		makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
		
		return entity;
		
	}
	
	// 보건소에서 요청한 신규환자를 진료하고 자가격리처리하는 메서드
	//-------------------------------------------------
	// insert	slfptnt				|	#{slfptntNo} #{pbhtNo} #{manageNo}
	//			dgnss_result		|	#{dgnssNo} #{dgnssResultCode} #{dgnssNote}
	// update	manage				|	#{sttusCode} #{manageNo}
	//			dgnss				|	#{dgnssNo}
	//			hspt				|	#{hsptNo}		
	//--------------------------------------------------	
	@RequestMapping("/process-dgnss-slfptnt")
	public ResponseEntity<Map<String,Object>> processDgnssSlfptnt(DgnssProcessCommand dgnssProcessCommand, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		LOGGER.debug(dgnssProcessCommand.toString());
		HsptVO loginHspt = null;
		DgnssResultVO dgnssResult = null;
		String msg = null;
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dgnssResult = new DgnssResultVO();
		
		dgnssResult.setDgnssNo(dgnssProcessCommand.getDgnssNo());
		dgnssResult.setDgnssNote(XSSUtil.xssProcess(dgnssProcessCommand.getDgnssNote()));
		dgnssResult.setDgnssResultCode(dgnssProcessCommand.getDgnssResultCode());
		dgnssResult.setManageNo(dgnssProcessCommand.getManageNo());
		
		LOGGER.debug("{}",loginHspt);
		LOGGER.debug("{}",dgnssResult);

		msg = hsptSerivceLKH.registSlfptntByDgnss(dgnssResult, loginHspt);
		
		LOGGER.debug(msg);

		dataMap.put("colseWindow", dgnssProcessCommand.isCloseWindow());		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		// 진료기록 로그
		makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
		// 자가격리 처리 로그
		makeStatisticsLogByHspt.makeHsptStatisticsGoSelf(loginHspt.getHsptNo());
		
		return entity;
		
	}
	
	// 진료후 이원신청하는 메서드
	@RequestMapping("/process-dgnss-sckbdreq-inptnt")
	public ResponseEntity<Map<String,Object>> processDgnssSckbdreqInptnt(DgnssProcessCommand dgnssProcessCommand, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();
		
		LOGGER.debug("{}", "before");
		LOGGER.debug("{}", dgnssProcessCommand);
		LOGGER.debug("{}", "after");
		
		HsptVO loginHspt = null;
		DgnssResultVO dgnssResult = null;
		String fromLtctNo = null;
		String msg = null;
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dgnssResult = new DgnssResultVO();
		
		dgnssResult.setDgnssNo(dgnssProcessCommand.getDgnssNo());
		dgnssResult.setDgnssNote(XSSUtil.xssProcess(dgnssProcessCommand.getDgnssNote()));
		dgnssResult.setDgnssResultCode(dgnssProcessCommand.getDgnssResultCode());
		dgnssResult.setManageNo(dgnssProcessCommand.getManageNo());		
		
		String toHsptNo = dgnssProcessCommand.getToHsptNo();
		fromLtctNo = dgnssProcessCommand.getChildNo();
		
		if(dgnssProcessCommand.getType().equals("A")) {
			
			boolean flag = checkHsptHasRmndSckbd(toHsptNo);
			
			if(flag) {
				// 보건소에서 요청한 신규환자를 진료하고 이원신청하는 메서드
				msg = hsptSerivceLKH.registSckbdreqInptntByDgnss(dgnssResult, loginHspt, toHsptNo);
				LOGGER.debug(msg);
				// 진료기록 로그
				makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
				// 병상신청 등록 로그
				makeStatisticsLogByHspt.makeHsptStatisticsReqSckbd(loginHspt.getHsptNo());
			}else {
				msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
			}
			
		}
		if(dgnssProcessCommand.getType().equals("B")) {
			
			boolean flag = checkHsptHasRmndSckbd(toHsptNo);
			
			if(flag) {			
				// 생활치료센터에서 요청한 환자를 진료하고 이원신청하는 메서드
				msg = hsptSerivceLKH.registSckbdreqInptntByIsoptnt(dgnssResult, loginHspt, toHsptNo, fromLtctNo);
				// 입소환자 퇴원(이원)로그
				MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsOutptnt(fromLtctNo);
				
				LOGGER.debug(msg);
				// 진료기록 로그
				makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
				// 병상신청 등록 로그
				makeStatisticsLogByHspt.makeHsptStatisticsReqSckbd(loginHspt.getHsptNo());
			}else {
				msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
			}
		}
		
		LOGGER.debug("processDgnssSckbdreqInptnt msg : {}", msg);
		LOGGER.debug(msg);
		
		dataMap.put("colseWindow", dgnssProcessCommand.isCloseWindow());		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	private boolean checkHsptHasRmndSckbd(String toHsptNo) throws Exception{
		HsptVO toHspt = hsptSerivceLKH.getHsptByHsptNo(toHsptNo);
		
		LOGGER.debug("checkHsptHasRmndSckbd에서 구한 잔여병상수 : {}", toHspt.getRmndSckbdCnt());
		
		boolean flag = false;
		if(toHspt.getRmndSckbdCnt() > 0) {
			flag =true;
		}
		
		LOGGER.debug("checkHsptHasRmndSckbd의 리턴값 : {}", flag);
		
		return flag;
	}


	// 진료후 입소신청하는 메서드
	@RequestMapping("/process-dgnss-sckbdreq-isoptnt")
	public ResponseEntity<Map<String,Object>> processDgnssSckbdreqIsoptnt(DgnssProcessCommand dgnssProcessCommand, HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		
		LOGGER.debug("{}", dgnssProcessCommand);
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		HsptVO loginHspt = null;
		DgnssResultVO dgnssResult = null;
		String toLtctNo = null;
		
		String msg = null;
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dgnssResult = new DgnssResultVO();
		
		dgnssResult.setDgnssNo(dgnssProcessCommand.getDgnssNo());
		dgnssResult.setDgnssNote(XSSUtil.xssProcess(dgnssProcessCommand.getDgnssNote()));
		dgnssResult.setDgnssResultCode(dgnssProcessCommand.getDgnssResultCode());
		dgnssResult.setManageNo(dgnssProcessCommand.getManageNo());		

		toLtctNo = dgnssProcessCommand.getToLtctNo();
		
		boolean flag = checkLtctHasRmndSckbd(toLtctNo);
		
		if(flag) {
			msg = hsptSerivceLKH.registSckbdreqIsoptntByDgnss(dgnssResult, loginHspt, toLtctNo);
			
			// 진료기록 로그
			makeStatisticsLogByHspt.makeHsptStatisticsDgnss(loginHspt.getHsptNo());
			
			// 입소신청 로그
			makeStatisticsLogByHspt.makeHsptStatisticsGoLtct(loginHspt.getHsptNo());
			
		}else {
			msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
		}
		
		dataMap.put("colseWindow", dgnssProcessCommand.isCloseWindow());
		dataMap.put("msg", msg);
		
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	private boolean checkLtctHasRmndSckbd(String toLtctNo) throws Exception{
		LtctVO ltct = ltctServiceLKH.getLtctByLtctNo(toLtctNo);
		
		boolean flag = false;
		
		if(ltct == null ) return false;
		if(ltct.getRmndSckbdCnt() > 0 ) flag = true;
		
		return flag;
	}


	// 환자 개인정보 수정
	@RequestMapping("/process-inptnt-modify")
	public ResponseEntity<Map<String,Object>> processInptntModify(PstiVO psti, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		String msg = null;
		
		LOGGER.debug("{}","before");
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}","after");
		
		String pstiAdres = psti.getPstiAdres();
		String temp = pstiAdres.substring(0, pstiAdres.indexOf(" "));
		psti.setAreaNo(CommonCodeUtil.getCodeName(temp));
		
		psti.setSymptms(XSSUtil.xssProcess(psti.getSymptms()));
		psti.setPstiNm(XSSUtil.xssProcess(psti.getPstiNm()));
		psti.setPstiTelno(XSSUtil.xssProcess(psti.getPstiTelno()));
		psti.setPstiAdres(XSSUtil.xssProcess(psti.getPstiAdres()));
		
		LOGGER.debug("{}","before");
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}","after");
		
		msg = hsptSerivceLKH.modifyInptntInfo(psti);
		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	// 입원환자를 재검요청하는 메서드
	@RequestMapping("/process-regist-smpl")
	public ResponseEntity<Map<String,Object>> processRegistSmpl(String pbhtNo, String checkedManageNo, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();
		String msg = null;
		HsptVO loginHspt = null;
		
		String[] manageNoArray = checkedManageNo.split(",");
		
		LOGGER.debug("{}", "before");
		LOGGER.debug("{}", manageNoArray);
		LOGGER.debug("{}", "aftere");
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		//String hsptNo = loginHspt.getHsptNo();
		String instNo = loginHspt.getInstNo();
		
		msg = hsptSerivceLKH.registSmplByInptnt(instNo, pbhtNo, manageNoArray);
		
		PbhtVO pbht = pbhtServiceLKH.getPbhtByPbhtNo(pbhtNo);
		
		dataMap.put("pbht", pbht);
		
		dataMap.put("msg", msg);
		
		LOGGER.debug("{}", "before");
		LOGGER.debug("{}", dataMap);
		LOGGER.debug("{}", "aftere");
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	// 입원중 환자를 이원신청하는 메서드
	//-------------------------------------------------
	// insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}
	// update	hspt				|	#{hsptNo}
	//--------------------------------------------------		
	@RequestMapping("/process-inptnt-sckbdreq-inptnt")
	public ResponseEntity<Map<String,Object>> processInptntSckbdreqInptnt(String manageNo, String toHsptNo, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		String msg = null;
		HsptVO loginHspt = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		boolean flag = checkHsptHasRmndSckbd(toHsptNo);
		
		if(flag) {
			msg = hsptSerivceLKH.registSckbdreqInptntByInptnt(toHsptNo, loginHspt, manageNo);
			// 병상신청 로그
			makeStatisticsLogByHspt.makeHsptStatisticsReqSckbd(loginHspt.getHsptNo());
		}else {
			msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
		}
		
		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		
		return entity;
	}

	// 병상신청을 승인하는 메서드
	@RequestMapping("/process-sckbdreq-accept")
	public ResponseEntity<Map<String,Object>> processSckbdreqAccept(SckbdreqProcessCommand sckbdreqProcessCommand, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		String msg = null;
		HsptVO loginHspt = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		LOGGER.debug("{}", sckbdreqProcessCommand);
		
		String sckbdreqNo = sckbdreqProcessCommand.getSckbdreqNo();
		String manageNo = sckbdreqProcessCommand.getManageNo();
		String fromLtctNo = null;
		String fromHtctNo = null;
		String reqeustCode = sckbdreqProcessCommand.getRequestCode();
		
		if(reqeustCode.equals("M101")) {
			
			// 신규환자를 승인한다.
			msg = hsptSerivceLKH.registInptntAcceptedByDgnss(manageNo, sckbdreqNo, loginHspt);
			LOGGER.debug(msg);
			
		}
		if(reqeustCode.equals("M102")) {
			
			// 입원 환자의 이원신청을 승인한다.
			msg = hsptSerivceLKH.registInptntAcceptedByInptnt(manageNo, sckbdreqNo, loginHspt);
			LOGGER.debug(msg);
			
			SckbdreqVO sckbdreqTemp = pstiServiceLKH.getSckbdreqBySckbdreqNo(sckbdreqNo);
			fromHtctNo = sckbdreqTemp.getChildNo();
			// 이원신청 병원의 입원환자 퇴원처리 로그 퇴원(이원)
			MakeStatisticsLogByHspt.getInstance().makeHsptStatisticsOutptnt(fromHtctNo);
		}
		if(reqeustCode.equals("M103")) {

			// 입소환자의 이원신청을 승인한다.
			DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
			
			LOGGER.debug("{}", dgnssResult);
			
			fromLtctNo = dgnssResult.getChildNo();
			
			msg = hsptSerivceLKH.registInptntAccetedByIsoptnt(manageNo, sckbdreqNo, loginHspt, fromLtctNo);
			LOGGER.debug(msg);
			
			// 입소환자 퇴원처리 로그 퇴원(이원)
			MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsOutptnt(fromLtctNo);
		}
		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		// 입원환자 등록 로그
		MakeStatisticsLogByHspt.getInstance().makeHsptStatisticsInptnt(loginHspt.getHsptNo());
		
		return entity;
	}

	// 병상신청을 반려하는 메서드
	@RequestMapping("/process-sckbdreq-reject")
	public ResponseEntity<Map<String, Object>> processSckbdreqReject(String sckbdreqNo, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		String msg = null;
		HsptVO loginHspt = null;
		
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dataMap = new HashMap<String, Object>();
		
		LOGGER.debug("{}", sckbdreqNo);
		
		SckbdreqVO sckbdreq = pstiServiceLKH.getSckbdreqBySckbdreqNo(sckbdreqNo);
		
		LOGGER.debug("{}", sckbdreq);
		
		msg = hsptSerivceLKH.updateSckbdreqRejectByInptnt(sckbdreqNo, loginHspt);
		
		LOGGER.debug(msg);
		
		dataMap.put("msg", msg);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}

	// 병상신청을 취소하는 메서드 (이원신청, 입소신청 모드 핸들링)
	@RequestMapping("/process-sckbdreq-cancle")
	public ResponseEntity<Map<String,Object>> processSckbdreqCancle(String type, String childNo, String sckbdreqNo, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();		
		String msg = null;
		String toHsptNo = null;
		String toLtctNo = null;
		
		LOGGER.debug(type);
		LOGGER.debug(childNo);
		LOGGER.debug(sckbdreqNo);
		
		if(type.equals("A")) {
			toHsptNo = childNo;
			msg = hsptSerivceLKH.updateSckbdreqCancleToInptnt(sckbdreqNo, toHsptNo);
			LOGGER.debug("{}", msg);
		}
		
		if(type.equals("B")) {
			toLtctNo = childNo;
			msg = hsptSerivceLKH.updateSckbdreqCancleToIsoptnt(sckbdreqNo, toLtctNo);
			LOGGER.debug("{}", msg);
		}
		
		dataMap.put("msg", msg);
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}

	// 병상신청(이원) 오픈윈도우 목록을 가져오는 메서드, 북마크리스트와 전체 리스트 모두 핸들링
	@RequestMapping("/hspt-list-to-inptnt")
	public ResponseEntity<Map<String, Object>> hsptListToInptnt(
													@RequestParam(defaultValue="1")int page,
													@RequestParam(defaultValue="10")int perPageNum,
													@RequestParam(defaultValue="")String searchType,
													@RequestParam(defaultValue="")String keyword,
													@RequestParam(defaultValue="")String typeCode,
													@RequestParam(defaultValue="false") boolean rmndSckbdCntCheck,
													HttpSession session)
													throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		InstSearchCommand cri = new InstSearchCommand(page, perPageNum, searchType, keyword);
		
		HsptVO loginHspt = (HsptVO)(session.getAttribute("loginInst"));
		
		Map<String, Object> dataMap = null;
		String hsptNo = loginHspt.getHsptNo();
		
		cri.setHsptNo(hsptNo);
		cri.setMyArea(loginHspt.getInstAdres());
		cri.setRmndSckbdCntCheck(rmndSckbdCntCheck);
		
		LOGGER.debug("{}",cri);
		
		try {
			
			if(typeCode.equals("all")) {
				dataMap = hsptSerivceLKH.getAllHsptList(cri);
				dataMap.put("adres", loginHspt.getInstAdres());
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
				LOGGER.debug("{}",dataMap);
			}else {
				dataMap = hsptSerivceLKH.getBookmardHsptList(cri, hsptNo);
				dataMap.put("adres", loginHspt.getInstAdres());
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
				LOGGER.debug("{}",dataMap);
			}
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	// 북마크 플레그를 판단하는 메서드
	@RequestMapping("/get-bookmark-check")
	public ResponseEntity<Map<String, Object>> getBookmarkCheck(String toInstNo, HttpSession session) throws Exception{

		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		HsptVO loginHspt = (HsptVO)session.getAttribute("loginInst");
		String fromInstNo = loginHspt.getHsptNo();
		
		BookmarkVO bookmark = new BookmarkVO();
		
		bookmark.setFromInstNo(fromInstNo);
		bookmark.setToInstNo(toInstNo);
		
		int bookmarkFlag = hsptServiceLKH.getBookmarkCount(bookmark);
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("bookmarkFlag", bookmarkFlag);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
		
	}
	
	@RequestMapping("/bookmark-remove")
	public ResponseEntity<Map<String, Object>>bookmarkRemove(String toInstNo, HttpSession session){
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = null;
		
		String msg = "success";
		
		HsptVO loginHspt = (HsptVO)session.getAttribute("loginInst");
		String fromInstNo = loginHspt.getHsptNo();
		
		BookmarkVO bookmark = new BookmarkVO();
		
		bookmark.setFromInstNo(fromInstNo);
		bookmark.setToInstNo(toInstNo);
		
		dataMap = new HashMap<String, Object>();	
		
		try {
			
			
			int result = hsptSerivceLKH.removeBookMark(bookmark);
			
			dataMap.put("result", result);
			
			msg = result == 1 ? msg : "fail";
			
			dataMap.put("msg", msg);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	// 입소신청(입소) 오픈윈도우 목록을 가져오는 메서드, 북마크리스트와 전체 리스트 모두 핸들링
	@RequestMapping("/ltct-list-to-isoptnt")
	public ResponseEntity<Map<String, Object>> ltctListToIsoptnt(
													@RequestParam(defaultValue="1")int page,
													@RequestParam(defaultValue="10")int perPageNum,
													@RequestParam(defaultValue="")String searchType,
													@RequestParam(defaultValue="")String keyword,
													@RequestParam(defaultValue="")String typeCode,
													@RequestParam(defaultValue="false") boolean rmndSckbdCntCheck,
													HttpSession session)
													throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		InstSearchCommand cri = new InstSearchCommand(page, perPageNum, searchType, keyword);
		
		HsptVO loginHspt = (HsptVO)(session.getAttribute("loginInst"));
		
		Map<String, Object> dataMap = null;
		String hsptNo = loginHspt.getHsptNo();
		cri.setHsptNo(hsptNo);
		cri.setMyArea(loginHspt.getInstAdres());
		
		cri.setRmndSckbdCntCheck(rmndSckbdCntCheck);
		
		LOGGER.debug("{}",cri);
		
		try {
			
			if(typeCode.equals("all")) {
				dataMap = hsptSerivceLKH.getAllLtctList(cri);
				dataMap.put("adres", loginHspt.getInstAdres());
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
				LOGGER.debug("{}",dataMap);
			}else {
				dataMap = hsptSerivceLKH.getBookmardLtctList(cri, hsptNo);
				dataMap.put("adres", loginHspt.getInstAdres());
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
				LOGGER.debug("{}",dataMap);
			}
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return entity;
		
	}
	
	// 북마크를 등록하는 메서드
	@RequestMapping("/regist-bookmark")
	public ResponseEntity<Map<String, String>> bookmarkHspt(String toInstNo, String type, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, String>> entity = null;
		
		Map<String, String> dataMap = null;
		HsptVO loginHspt = null;
		String msg = "success";
		BookmarkVO bookmark = null;
		
		loginHspt = (HsptVO)session.getAttribute("loginInst");
		
		String fromInstNo = loginHspt.getHsptNo();
		
		List<String> toInstNoList = hsptSerivceLKH.getToInstNoListByFromInstNo(fromInstNo);
		
		LOGGER.debug("{}", toInstNoList);
		LOGGER.debug("{}", toInstNo);
		LOGGER.debug("{}", type);

		dataMap = new HashMap<String, String>();
		
		if(toInstNoList.contains(toInstNo)) {
			msg = ErrorCodeUtil.getCodeName("HSPT_ERROR_17");
			dataMap.put("msg", msg);
			
			entity = new ResponseEntity<Map<String, String>>(dataMap, HttpStatus.OK);
			
			return entity;
		}
		
		if(type.equals("A")) {
			bookmark = new BookmarkVO(fromInstNo, toInstNo, "C103", "C103");
		}
		if(type.equals("B")) {
			bookmark = new BookmarkVO(fromInstNo, toInstNo, "C103", "C104");
		}
		if(type.equals("C")) {
			bookmark = new BookmarkVO(fromInstNo, toInstNo, "C103", "C102");
		}
		
		msg = hsptSerivceLKH.registBookmark(bookmark);
		
		dataMap.put("msg", msg);
		
		entity = new ResponseEntity<Map<String, String>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	// 입원환자를 사망처리하는 메서드
	@RequestMapping("/expire-inptnt")
	public ResponseEntity<Map<String, Object>> expireInptnt(String manageNo) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap = null;
		
		String msg = null;
		msg = hsptSerivceLKH.modifyInptntExpired(manageNo);
		
		InptntVO inptnt = pstiServiceLKH.getInptntByManageNo(manageNo);
		String hsptNo = inptnt.getHsptNo();
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("msg", msg);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		// 퇴원(사망) 로그
		makeStatisticsLogByHspt.makeHsptStatisticsDeath(hsptNo);
		return entity;
	}
	
	// 이원신청이 반려된 환자 혹은 이원신청을 취소한 환자를 입원처리하는 메서드
	// 보건소 -> 병원(진료완료) -> 이원신청 -> 반려 -> 입원처리 flow
	// 생활치료센터 -> 병원(진료완료) -> 이원신청 -> 반려 -> 입원처리 flow
	//-------------------------------------------------
	// insert	inptnt				|	#{sckbdreqNo} #{sckbdreqCode}
	// update	manage				|	#{sttusCode} #{instNm} #{instNo} #{manageNo}
	// 			sckbdreq			|	#{sckbdreqNo} #{sckbdreqCode}
	//--------------------------------------------------	
	@RequestMapping("/process-rejected-or-cancled-sckbdreq-to-inptnt")
	public ResponseEntity<Map<String, Object>> processRejectedOrCancledSckbdreqToInptnt(String sckbdreqNo, String manageNo, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		String msg = null;
		
		HsptVO loginHspt = null;
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dataMap = new HashMap<String, Object>();
		
		msg = hsptSerivceLKH.registInptntByRejectedOrCancledDgnssOrIsoPtnt(sckbdreqNo, manageNo, loginHspt);
		dataMap.put("msg", msg);
		
		LOGGER.debug(msg);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		// 입원환자 등록 로그
		makeStatisticsLogByHspt.makeHsptStatisticsInptnt(loginHspt.getHsptNo());
		
		return entity;		
	}
	
	// 반려 혹은 취소된 이원신청을 다시 이원신청하는 메서드 
	// 보건소 -> 병원(진료완료) -> 이원신청 -> 반려 -> 이원신청 flow
	// 입원환자 -> 이원신청 -> 반려 -> 이원신청 flow
	// 생활치료센터 -> 병원(진료완료) -> 이원신청 -> 반려 -> 이원신청 flow
	// 보건소 -> 병원(진료완료) -> 이원신청 -> 취소 -> 이원신청 flow
	// 입원환자 -> 이원신청 -> 취소 -> 이원신청 flow
	// 생활치료센터 -> 병원(진료완료) -> 이원신청 -> 취소 -> 이원신청 flow
	//-------------------------------------------------
	// insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}
	// update	hspt				|	#{hsptNo}
	//--------------------------------------------------	
	@RequestMapping("/process-rejected-or-cancled-sckbdreq-to-sckbdreq-inptnt")
	public ResponseEntity<Map<String, Object>> processRejectedOrCancledSckbdreqToSckbdreqInptnt(String sckbdreqNo, String manageNo, String toHsptNo, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		String msg = null;
		
		HsptVO loginHspt = null;
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dataMap = new HashMap<String, Object>();
		
		boolean flag = checkHsptHasRmndSckbd(toHsptNo);
		
		if(flag) {
			msg = hsptSerivceLKH.registSckbdreqInptntByRejectedOrCancledAll(sckbdreqNo, manageNo, loginHspt, toHsptNo);
			
			// 병상신청 등록 로그
			makeStatisticsLogByHspt.makeHsptStatisticsReqSckbd(loginHspt.getHsptNo());
		}else {
			msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
		}
		
		dataMap.put("msg", msg);
		
		LOGGER.debug(msg);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;				
	}
	
	// 반려 혹은 취소된 입소신청을 다시 입소신청하는 메서드 
	// 보건소 -> 병원(진료완료) -> 입소신청 -> 반려 -> 입소신청 flow
	// 보건소 -> 병원(진료완료) -> 입소신청 -> 취소 -> 입소신청 flow
	//-------------------------------------------------
	// insert	sckbdreq			|	#{sckbdreqNo} #{type} #{childNo} #{hsptNo} #{manageNo} #{requestCode}
	// update	ltct				|	#{ltctNo}
	//--------------------------------------------------	
	@RequestMapping("/process-rejected-or-cancled-sckbdreq-to-sckbdreq-isoptnt")
	public ResponseEntity<Map<String, Object>> processRejectedOrCancledSckbdreqToSckbdreqIsoptnt(String sckbdreqNo, String manageNo, String toLtctNo, HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		String msg = null;
		
		HsptVO loginHspt = null;
		loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		dataMap = new HashMap<String, Object>();
		
		boolean flag = checkLtctHasRmndSckbd(toLtctNo);
		
		if(flag) {
			msg = hsptSerivceLKH.registSckbdreqIsoptntByRejectedOrCancledDgnss(sckbdreqNo, manageNo, loginHspt, toLtctNo);
			
			// 입소신청 등록 로그
			makeStatisticsLogByHspt.makeHsptStatisticsGoLtct(loginHspt.getHsptNo());
		}else {
			msg = "잔여병상이 부족하여 이원신청할 수 없습니다.";
		}
		
		dataMap.put("msg", msg);
		
		LOGGER.debug(msg);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;				
	}	
	
	// 병원 메인 스타트
	// 진료환자
	@RequestMapping("/main-dgnss-list")
	public ResponseEntity<Map<String, Object>> mainDgnssList(@RequestParam(defaultValue = "1") int page,
															@RequestParam(defaultValue = "5") int perPageNum,
															HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		DgnssListSearchCommand cri = new DgnssListSearchCommand(page, perPageNum);
		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));
		cri.setHsptNo(hspt.getHsptNo());
		try {
			Map<String, Object> dataMap = hsptServiceLKH.getDgnssList(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 입원환자
	@RequestMapping("/main-inptnt-list")
	public ResponseEntity<Map<String, Object>> mainInptntList(@RequestParam(defaultValue = "1") int page,
																@RequestParam(defaultValue = "10") int perPageNum, 
																HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		InptntListSearchCommand cri = new InptntListSearchCommand(page, perPageNum);
		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));
		cri.setHsptNo(hspt.getHsptNo());
		try {
			Map<String, Object> dataMap = hsptServiceLKH.getInptntList(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//승인대기 병상 목록
	@RequestMapping("/main-reqsckbd-list")
	public ResponseEntity<Map<String, Object>> mainReqsckbdList(@RequestParam(defaultValue = "1") int page,
																@RequestParam(defaultValue = "5") int perPageNum,
																HttpSession session)
														throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		InptntListSearchCommand cri = new InptntListSearchCommand(page, perPageNum);
		HsptVO hspt = (HsptVO) (session.getAttribute("loginInst"));
		cri.setHsptNo(hspt.getHsptNo());
		try {
			Map<String, Object> dataMap = hsptServiceLKH.getReqInptntList(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 잔여병상수 수정
	@RequestMapping("/sckbd-cnt-modify")
	public ResponseEntity<Map<String, Object>> sckbdCntModify(@RequestParam(defaultValue = "0") int sckbdCnt, HttpSession session) 
				throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		String msg = null;
		
		HsptVO loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		int sckbdCntAfter = loginHspt.getSckbdCnt() + sckbdCnt;
		int rmndSckbdAfter = loginHspt.getRmndSckbdCnt() + sckbdCnt;
		
		if(sckbdCntAfter < 0 || rmndSckbdAfter < 0) {
			msg = ErrorCodeUtil.getCodeName("HSPT_ERROR_21");
		}else {
			loginHspt.setSckbdCnt(sckbdCntAfter);
			loginHspt.setRmndSckbdCnt(rmndSckbdAfter);
			
			msg = hsptSerivceLKH.modifySckbdCntLKH(loginHspt);
		}
		dataMap = new HashMap<String, Object>();
		dataMap.put("msg", msg);
		
		int curInptntCnt = hsptService.getAllInptntCnt(loginHspt.getHsptNo());
		
		dataMap.put("curInptntCnt", curInptntCnt);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/main-sckbdCountAndStats")
	public ResponseEntity<Map<String, Object>> mainSckbdCountAndStats(HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		HsptVO loginHspt = (HsptVO)session.getAttribute("loginInst");
		HsptStatsVO hsptStats = hsptSerivceLKH.getHsptMainStatisticsByHspt(loginHspt);
		
		Map<String, Object> map = hsptSerivceLKH.getMainChartDataMap(loginHspt.getHsptNo());
		
		List<HsptStatsVO> hsptStatsList = (List<HsptStatsVO>)map.get("hsptStatsList");
		
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("hsptStatsList", hsptStatsList);
		dataMap.put("hsptStats", hsptStats);
		dataMap.put("loginHspt", loginHspt);
		
		int curInptntCnt = hsptService.getAllInptntCnt(loginHspt.getHsptNo());
		
		dataMap.put("curInptntCnt", curInptntCnt);
		
		LOGGER.debug("{}", "before mainSckbdCountAndStats");
		LOGGER.debug("{}", dataMap);
		LOGGER.debug("{}", "after mainSckbdCountAndStats");
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/main-chart")
	public ResponseEntity<Map<String, Object>> mainChart(HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		HsptVO loginHspt = (HsptVO) session.getAttribute("loginInst");
		String hsptNo = loginHspt.getHsptNo();
		
		
		dataMap = hsptSerivceLKH.getMainChartDataMap(hsptNo);
		
		LOGGER.debug("{}","before");
		LOGGER.debug("{}",dataMap);
		LOGGER.debug("{}","after");
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		return entity;
		
	}
	//직원관리 리스트
	@RequestMapping("/emp-manage-list-go")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> manageList(@RequestParam(defaultValue="1")int page,
														  @RequestParam(defaultValue="15")int perPageNum,
														  @RequestParam(defaultValue="")String searchType,
														  @RequestParam(defaultValue="")String keyword,
														  HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		MberManageCommand cri = new MberManageCommand(page, perPageNum, searchType, keyword);
		HsptVO hspt = (HsptVO) session.getAttribute("loginInst");
		cri.setInstNo(hspt.getInstNo());
		try {
			Map<String, Object> dataMap = mberService.getManageList(cri);
		
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	//직원등록폼 아이디체크
	@RequestMapping(value="/idcheck",method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> idCheck(String mberId) throws Exception {

		ResponseEntity<String> entity = null;
		MberVO mber = mberService.getMember(mberId);
		String message = null;
				
		try {
			if (mber == null) {
				message = "success";

			} else {
				message = "fail";
			}

			entity = new ResponseEntity<String>(message, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}
	
	@RequestMapping("/stats-test")
	public ResponseEntity<Map<String, Object>> statsTest() throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String msg = "success";
		
		LOGGER.debug("before");
		
		HsptStatisticsUpdateScheduler hsptStatisticsUpdateScheduler = new HsptStatisticsUpdateScheduler();
		
		hsptStatisticsUpdateScheduler.setHsptService(hsptService);
		
		LOGGER.debug("{}", hsptStatisticsUpdateScheduler);
		
		hsptStatisticsUpdateScheduler.updateHsptStatistics();
		
/*		HsptStatisticsInsertScheduler hsptStatisticsInsertScheduler = new HsptStatisticsInsertScheduler();
		
		hsptStatisticsInsertScheduler.setHsptService(hsptService);
		
		LOGGER.debug("{}", hsptStatisticsInsertScheduler);
		
		hsptStatisticsInsertScheduler.registHsptStatistics();*/
		
		LOGGER.debug("after");
		
		dataMap.put("msg", msg);
		
		entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
													  
}
