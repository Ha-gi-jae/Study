package com.spring.compass.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.IsoptntListVO;
import com.spring.compass.command.LtctRequestSmplVO;
import com.spring.compass.command.LtctResListVO;
import com.spring.compass.command.LtctSckbdCountAndStats;
import com.spring.compass.command.LtctSckbdListVO;
import com.spring.compass.command.LtctSckbdreqOkCommand;
import com.spring.compass.command.LtctSearchCommand;
import com.spring.compass.command.LtctUpdateSckbdCntCommand;
import com.spring.compass.command.MberManageCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.MberService;
import com.spring.compass.util.MakeStatisticsLogByLtct;
import com.spring.compass.vo.LtctBasicDetailVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.PbhtVO;

@RestController
@RequestMapping("/rest-ltct")
public class RestLtctController {
	
	@Autowired
	private LtctService ltctService;
	
	@Autowired
	private MberService mberService;
	
	@RequestMapping("/emp-manage-list-go")
	public ResponseEntity<Map<String, Object>> manageList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="15")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String keyword,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		MberManageCommand cri = new MberManageCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		cri.setInstNo(ltct.getInstNo());
		
		try {
			Map<String, Object> dataMap = mberService.getManageList(cri);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/dgnsstoday")
	public ResponseEntity<Map<String, Object>> dgnssToday(String manageNo) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> data = new HashMap<String, Object>();
		try {
			int result = ltctService.getDgnssTodayByManageNo(manageNo);
			data.put("result", result);
			entity = new ResponseEntity<Map<String, Object>>(data, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public ResponseEntity<String> idCheck(String mberId) throws Exception{
		ResponseEntity<String> entity = null;
		MberVO mber = mberService.getMember(mberId);
		String message = null;
		
		try {
			if(mber == null) {
				message = "success";
			}else {
				message = "fail";
			}
			entity = new ResponseEntity<String>(message, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/bookmark-regist")
	public ResponseEntity<Integer>bookmarkRegist(String hsptNo, HttpSession session, @RequestParam(defaultValue= "C104") String fromCode,
																					@RequestParam(defaultValue="C103") String toCode){
		ResponseEntity<Integer> entity = null;
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		data.put("from_ltctNo", ltct.getLtctNo());
		data.put("to_hsptNo", hsptNo);
		data.put("fromCode", fromCode);
		data.put("toCode", toCode);
		try {
			Integer result = ltctService.setBookMark(data);
			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/bookmark-remove")
	public ResponseEntity<Integer> bookmarkRemove(String hsptNo, HttpSession session){
		ResponseEntity<Integer> entity = null;
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		data.put("from_ltctNo", ltct.getLtctNo());
		data.put("to_hsptNo", hsptNo);
		try {
			Integer result = ltctService.removeBookMark(data);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/hspt-detail")
	public ResponseEntity<Map<String, Object>> hsptDetail(String hsptNo, HttpSession session){
		ResponseEntity<Map<String, Object>> entity = null;
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("ltctNo", ltct.getLtctNo());
		data.put("hsptNo", hsptNo);
		try {
			Map<String, Object> dataMap = new HashMap<String, Object>();
			DgnssHsptVO dgnssHspt = ltctService.getHsptDetail(hsptNo);
			int result = ltctService.getBookMark(data);
			dataMap.put("dgnssHspt", dgnssHspt);
			dataMap.put("result", result);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/hspt-bookmark-list")
	public ResponseEntity<Map<String, Object>> hsptBookmarkList(@RequestParam(defaultValue="1")int page,
																@RequestParam(defaultValue="10")int perPageNum,
																@RequestParam(defaultValue="")String searchType,
																@RequestParam(defaultValue="")String keyword,
																@RequestParam(defaultValue="")String typeCode,
																@RequestParam(defaultValue="")String manageNo,
																@RequestParam(defaultValue="false")boolean rmndSckbdCntCheck,
																HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		
		cri.setLtctNo(ltct.getLtctNo());
		cri.setRmndSckbdCntCheck(rmndSckbdCntCheck);
		try {
				Map<String, Object> dataMap = new HashMap<String, Object>();
				PstiAdresVO psti = ltctService.getPstiDetail(manageNo);
			if(typeCode.equals("all")) {
				dataMap = ltctService.getHsptAllList(cri, psti);
				dataMap.put("psti", psti);
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			}else {
				dataMap = ltctService.getHsptBookmarkList(cri);
				dataMap.put("psti", psti);
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			}
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/request-smpl")
	public void requestSmpl(String manageNo, String pbhtNo, HttpSession session) throws Exception{
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String instNo = ltct.getInstNo();
		
		String[] chkManageNo = manageNo.split(",");
		for(int i = 0; i < chkManageNo.length; i++) {
			String manage = chkManageNo[i].trim();

			LtctRequestSmplVO smpl = new LtctRequestSmplVO();
			smpl.setPbhtNo(pbhtNo);
			smpl.setInstNo(instNo);			
			smpl.setManageNo(manage);
			
			ltctService.registSmplByLtct(smpl);
			System.out.println(manage);
			System.out.println(pbhtNo);
			System.out.println(instNo);
			
		}
	}
	
	@RequestMapping(value="/sckbdreq-return")
	public void sckbdreqReturn(String manageNo, HttpSession session) throws Exception{
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String ltctNo = ltct.getLtctNo();
		ltctService.modifySckbdreqReturn(manageNo, ltctNo);
	}
	
	@RequestMapping(value="/sckbdreq-ok")
	public void sckbdreqOk(String datas, HttpSession session) throws Exception{
		LtctSckbdreqOkCommand sckbdreq = new LtctSckbdreqOkCommand();
		String[] data = datas.split(",");
		String manageNo = data[0];
		String hsptNo =  data[1];
//		 				36.00001 ~ 36.99999          0.00001 ~ 0.99999
		double temp = (Math.floor(((Math.random()+36) + (Math.random()*2))* 10) ) / 10;
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String ltctNo = ltct.getLtctNo();
		String instNo = ltct.getInstNo();
		String instNm = ltct.getInstNm();
		
		sckbdreq.setManageNo(manageNo);
		sckbdreq.setHsptNo(hsptNo);
		sckbdreq.setBdtemp(temp);
		sckbdreq.setLtctNo(ltctNo);
		sckbdreq.setInstNo(instNo);
		sckbdreq.setInstNm(instNm);
		ltctService.registSckbdreqOk(sckbdreq);
		
		MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsIsoptnt(ltctNo);
	}
	
	@RequestMapping(value="/sckbd-cnt-modify")
	public ResponseEntity<String> sckbdCntModify(HttpSession session, int sckbdCnt) throws Exception{
		ResponseEntity<String> entity = null;
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		LtctUpdateSckbdCntCommand sckbdCntCommand = new LtctUpdateSckbdCntCommand();
		sckbdCntCommand.setLtctNo(ltct.getLtctNo());
		sckbdCntCommand.setSckbdCnt(sckbdCnt);
		try {
			ltctService.modifySckbdCnt(sckbdCntCommand);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("main-sckbdCountAndStats")
	public ResponseEntity<LtctSckbdCountAndStats> sckbdCountAndStats(HttpSession session) throws Exception{
		ResponseEntity<LtctSckbdCountAndStats> entity = null;
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String ltctNo = ltct.getLtctNo();
		try {
			LtctSckbdCountAndStats sckbdCountAndStats = ltctService.getSckbdCountAndStats(ltctNo);
			
			entity = new ResponseEntity<LtctSckbdCountAndStats>(sckbdCountAndStats, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<LtctSckbdCountAndStats>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 입소자 상세조회
//	@RequestMapping("/isoptnt-detail")
//	public ResponseEntity<IsoptntVO> isoptntDetail(String manageNo) throws Exception{
//		ResponseEntity<IsoptntVO> entity = null;
//		try {
//		}catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<IsoptntVO>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//		
//		return entity;
//	}
	
	// 생활치료센터 기본적인 상세조회
	@RequestMapping("/manage-detail")
	public ResponseEntity<LtctBasicDetailVO> resDetail(String manageNo) throws Exception{
		ResponseEntity<LtctBasicDetailVO> entity = null;
		try {
			LtctBasicDetailVO basicDetail = ltctService.getBasicDetail(manageNo);
			entity = new ResponseEntity<LtctBasicDetailVO>(basicDetail, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<LtctBasicDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// 병상신청 상세조회
	@RequestMapping("/sckbd-detail")
	public ResponseEntity<LtctBasicDetailVO> sckbdDetail(String manageNo) throws Exception{
		ResponseEntity<LtctBasicDetailVO> entity = null;
		try {
			LtctBasicDetailVO basicDetail = ltctService.getBasicDetail(manageNo);
			LtctBasicDetailVO sckbdreqYmd = ltctService.getSckbdreqYmd(manageNo);
			Date isoptntInYmd = ltctService.getLtctInYmdByManageNo(manageNo);
			DgnssHsptVO hspt = ltctService.getHsptDetail(sckbdreqYmd.getHsptNo());
			basicDetail.setSckbdreqYmd(sckbdreqYmd.getSckbdreqYmd());
			basicDetail.setHsptNo(sckbdreqYmd.getHsptNo());
			basicDetail.setInstNm(hspt.getInstNm());
			basicDetail.setIsoptntInYmd(isoptntInYmd);
			if(sckbdreqYmd.getResYmd() != null) basicDetail.setResYmd(sckbdreqYmd.getResYmd());
			entity = new ResponseEntity<LtctBasicDetailVO>(basicDetail, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<LtctBasicDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	// 입소자 목록
	@RequestMapping("/isoptnt-list") // isoptnt-list-module-work 입소자(메뉴)
	public ResponseEntity<Map<String, Object>> isoptntList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String keyword,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		cri.setLtctNo(ltct.getLtctNo());
		cri.setInstNo(ltct.getInstNo());
		try {
			Map<String, Object> dataMap = ltctService.getIsoptntListPage(cri);
			List<IsoptntListVO> isoptntList = (List<IsoptntListVO>) dataMap.get("isoptntList");
			
			if(!isoptntList.isEmpty()) {
				String manageNo = isoptntList.get(0).getManageNo();
				LtctBasicDetailVO basicDetail = ltctService.getBasicDetail(manageNo);
				LtctBasicDetailVO sckbdreqYmd = ltctService.getSckbdreqYmd(manageNo);
				
				Date isoptntInYmd = ltctService.getLtctInYmdByManageNo(manageNo);
				DgnssHsptVO hspt = ltctService.getHsptDetail(sckbdreqYmd.getHsptNo());
				basicDetail.setSckbdreqYmd(sckbdreqYmd.getSckbdreqYmd());
				basicDetail.setHsptNo(sckbdreqYmd.getHsptNo());
				basicDetail.setInstNm(hspt.getInstNm());
				basicDetail.setIsoptntInYmd(isoptntInYmd);
				if(sckbdreqYmd.getResYmd() != null) basicDetail.setResYmd(sckbdreqYmd.getResYmd());
				dataMap.put("basicDetail", basicDetail);
			}
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	//메인 입소자
	@RequestMapping("/main-isoptnt-list") // isoptnt-list-module-work 입소자(메뉴)
	public ResponseEntity<Map<String, Object>> mainIsoptntList(@RequestParam(defaultValue="1")int page,
																@RequestParam(defaultValue="5")int perPageNum,
																HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		String areaNo = ltct.getAreaNo();
		cri.setLtctNo(ltct.getLtctNo());
		cri.setInstNo(ltct.getInstNo());
		try {
			Map<String, Object> dataMap = ltctService.getIsoptntListPage(cri);
			List<PbhtVO> pbhtList = ltctService.getPbhtListByAreaNo(areaNo);
			dataMap.put("pbhtList", pbhtList);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// 재검결과 목록
	@RequestMapping("/res-list") // res-list-module-work 재검결과(메뉴)
	public ResponseEntity<Map<String, Object>> resList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String keyword,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		cri.setLtctNo(ltct.getLtctNo());
		try {
			Map<String, Object> dataMap = ltctService.getResListPage(cri);
			List<LtctResListVO> resList = (List<LtctResListVO>) dataMap.get("resList");
			if(!resList.isEmpty()) {
				String manageNo = resList.get(0).getManageNo();
				LtctBasicDetailVO basicDetail = ltctService.getBasicDetail(manageNo);
				LtctBasicDetailVO sckbdreqYmd = ltctService.getSckbdreqYmd(manageNo);
				basicDetail.setSckbdreqYmd(sckbdreqYmd.getSckbdreqYmd());
				basicDetail.setHsptNo(sckbdreqYmd.getHsptNo());
				dataMap.put("basicDetail", basicDetail);
			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// main 결과
	@RequestMapping("/main-res-list") // res-list-module-work 재검결과(메뉴)
	public ResponseEntity<Map<String, Object>> mainResList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="5")int perPageNum,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		cri.setLtctNo(ltct.getLtctNo());
		try {
			Map<String, Object> dataMap = ltctService.getResListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// 병상신청 승인목록
	@RequestMapping("/sckbd-list") // sckbd-list-module-work 병상승인신청(메뉴)
	public ResponseEntity<Map<String, Object>> sckbdList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String keyword,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		cri.setLtctNo(ltct.getLtctNo());
		try {
			Map<String, Object> dataMap = ltctService.getSckbdListPage(cri);
			List<LtctSckbdListVO> sckbdList = (List<LtctSckbdListVO>) dataMap.get("sckbdList");
			if(!sckbdList.isEmpty()) {
				String manageNo = sckbdList.get(0).getManageNo();
				LtctBasicDetailVO basicDetail = ltctService.getBasicDetail(manageNo);
				LtctBasicDetailVO sckbdreqYmd = ltctService.getSckbdreqYmd(manageNo);
				Date isoptntInYmd = ltctService.getLtctInYmdByManageNo(manageNo);
				DgnssHsptVO hspt = ltctService.getHsptDetail(sckbdreqYmd.getHsptNo());
				basicDetail.setSckbdreqYmd(sckbdreqYmd.getSckbdreqYmd());
				basicDetail.setHsptNo(sckbdreqYmd.getHsptNo());
				basicDetail.setInstNm(hspt.getInstNm());
				basicDetail.setIsoptntInYmd(isoptntInYmd);
				if(sckbdreqYmd.getResYmd() != null) basicDetail.setResYmd(sckbdreqYmd.getResYmd());
				dataMap.put("basicDetail", basicDetail);
			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// main 병원 신청목록
	@RequestMapping("/main-sckbd-list") // sckbd-list-module-work 병상승인신청(메뉴)
	public ResponseEntity<Map<String, Object>> mainSckbdList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="5")int perPageNum,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum);
		LtctVO ltct = (LtctVO)(session.getAttribute("loginInst"));
		cri.setLtctNo(ltct.getLtctNo());
		try {
			Map<String, Object> dataMap = ltctService.getSckbdListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/pbht-list")
	public ResponseEntity<Map<String, Object>> pbhtList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String keyword,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum, searchType, keyword);
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		cri.setLtctNo(ltct.getAreaNo());
		try {
			Map<String, Object> dataMap = ltctService.getPbhtListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/bookmark-list")
	public ResponseEntity<Map<String, Object>> bookmarkList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="15")int perPageNum,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		LtctSearchCommand cri = new LtctSearchCommand(page, perPageNum);
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		cri.setLtctNo(ltct.getLtctNo());
		try {
			Map<String, Object> dataMap = ltctService.getBookmarkListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/getRmndSckbd")
	public ResponseEntity<String> getRmndSckbdCnt(String hsptNo) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			String rmndSckbdCnt = ltctService.getRmndSckbdCntByHsptNo(hsptNo);
			entity = new ResponseEntity<String>(rmndSckbdCnt, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
