package com.spring.compass.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.InspPstiRegistCommand;
import com.spring.compass.command.InspPstiSearchCommand;
import com.spring.compass.command.InspSmplRequestCommand;
import com.spring.compass.command.MberManageCommand;
import com.spring.compass.service.InspService;
import com.spring.compass.service.MberService;
import com.spring.compass.util.MakerStatisticsLogByInsp;
import com.spring.compass.vo.InspChckdVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspResultVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.KitHistVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;

@RestController
@RequestMapping("/rest-insp")
public class RestInspController {

	@Autowired
	private InspService inspService;
	
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
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		cri.setInstNo(insp.getInstNo());
		
		try {
			Map<String, Object> dataMap = mberService.getManageList(cri);
			
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
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
	
	@RequestMapping(value="/regist-Question")
	public ResponseEntity<String> registQuestion(InspPstiRegistCommand psti, HttpSession session) {

		ResponseEntity<String> entity = null;
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		
		try {
			int kitCount = inspService.getPcrKitCount(insp.getInspNo());
			
			if(kitCount < 1) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}else {
				kitCount = kitCount - 1;
				psti.setRmndKitCnt(kitCount);
				psti.setInspNo(insp.getInspNo());
				inspService.registQuestion(psti);
				entity = new ResponseEntity<String>(HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping(value="/regist-Request-Smpl")
	public ResponseEntity<String> registRequestSmpl(@RequestParam String pstiNo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		
		String[] chkPstiNo = pstiNo.split(",");
		int checkNum = pstiNo.indexOf(",");
		System.out.println("checkNum"+checkNum);
		if(checkNum > 0) {
			for(int i = 0; i < chkPstiNo.length; i++) {
				InspSmplRequestCommand smplRequest = new InspSmplRequestCommand();
				String psti = chkPstiNo[i].trim();
				
				smplRequest.setPbhtNo(insp.getPbhtNo());
				smplRequest.setInstNo(insp.getInstNo());
				smplRequest.setInstNm(insp.getInstNm());
				smplRequest.setPstiNo(psti);
				
				try {
					String manageNo = inspService.getManageNoByPstiNo(psti);
					
					if(manageNo != null && !manageNo.isEmpty() && manageNo != "") {
						smplRequest.setManageNo(manageNo);
					}
					inspService.registRequestSmpl(smplRequest);
					entity = new ResponseEntity<String>(HttpStatus.OK);
					
					MakerStatisticsLogByInsp.getMakerStatisticsLogByInspInstance()
											.makeInspStatisticsLog(insp.getInspNo());
					
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="/registKit")
	@ResponseBody
	public ResponseEntity<String> registKit(int inputCnt, HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		
		KitHistVO kitHist = new KitHistVO();
		kitHist.setInputCnt(inputCnt);
		kitHist.setInspempNo(mber.getMberNo());
		kitHist.setInspNo(insp.getInspNo());

		try {
			inspService.registKitHist(kitHist);
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//메인 피검자 리스트
	@RequestMapping("/main-psti-list")
	public ResponseEntity<Map<String, Object>> mainPstiList(@RequestParam(defaultValue="1") int page,
															@RequestParam(defaultValue="5") int perPageNum,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		
		try {
			Map<String, Object> dataMap = inspService.getPstiListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	//메인 검사요청 리스트
	@RequestMapping("/main-chckd-list")
	public ResponseEntity<Map<String, Object>> mainChckdList(@RequestParam(defaultValue="1") int page,
															@RequestParam(defaultValue="5") int perPageNum,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		
		try {
			Map<String, Object> dataMap = inspService.getChckdListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	//메인 검사결과 리스트
	@RequestMapping("/main-result-list")
	public ResponseEntity<Map<String, Object>> mainResultList(@RequestParam(defaultValue="1") int page,
															@RequestParam(defaultValue="5") int perPageNum,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		
		try {
			Map<String, Object> dataMap = inspService.getResultListPage(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	// 메인 PCR 갯수 (등록 할때 마다 리로드 해야함) 그래서 list에 안담음.
	@RequestMapping("/main-kit-count")
	public ResponseEntity<Integer> mainKitCount(HttpSession session) throws Exception{
		ResponseEntity<Integer> entity = null;
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		try {
			int kitCount = inspService.getPcrKitCount(insp.getInspNo());
			entity = new ResponseEntity<Integer>(kitCount, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//메인 PCR 리스트
	@RequestMapping("/main-pcr-list")
	public ResponseEntity<Map<String, Object>> mainKitList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="5")int perPageNum,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		try {
			Map<String, Object> dataMap = inspService.getPcrKitList(cri);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	//피검자 목록
	@RequestMapping("/psti-list")
	public ResponseEntity<Map<String, Object>> pstiList(@RequestParam(defaultValue="1")int page,
														@RequestParam(defaultValue="15")int perPageNum,
														@RequestParam(defaultValue="")String searchType,
														@RequestParam(defaultValue="")String keyword,
														HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum, searchType, keyword);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		try {
			Map<String, Object> dataMap = inspService.getPstiListPage(cri);
			List<InspPstiVO> pstiList = (List<InspPstiVO>) dataMap.get("pstiList");
			if(!pstiList.isEmpty()) {
				InspPstiVO psti = pstiList.get(0);
				dataMap.put("psti", psti);
			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// 피검자 상세조회
		@RequestMapping("/psti-detail")
		public ResponseEntity<InspPstiVO> pstiDetail(String pstiNo) throws Exception{
			ResponseEntity<InspPstiVO> entity = null;
			try {
				InspPstiVO psti = inspService.getPstiDetail(pstiNo);
				entity = new ResponseEntity<InspPstiVO>(psti, HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<InspPstiVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}
	//검사요청 목록
	@RequestMapping("/chckd-list")
	public ResponseEntity<Map<String, Object>> ChckdPstiList(@RequestParam(defaultValue="1")int page,
															@RequestParam(defaultValue="15")int perPageNum,
															@RequestParam(defaultValue="")String searchType,
															@RequestParam(defaultValue="")String keyword,
															HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		System.out.println("암쏘 쎾씨~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println(page);
		System.out.println(perPageNum);
		System.out.println(searchType);
		System.out.println(keyword);
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum, searchType, keyword);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		try {
			Map<String, Object> dataMap = inspService.getChckdListPage(cri);
			
			List<InspChckdVO> chckdList = (List<InspChckdVO>) dataMap.get("chckdList");
			
			if(!chckdList.isEmpty()) {
				InspChckdVO chckd = chckdList.get(0);
				dataMap.put("chckd", chckd);
			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	// 결과조회 목록
	@RequestMapping("/result-list")
	public ResponseEntity<Map<String, Object>> ResultList(@RequestParam(defaultValue="1")int page,
																	@RequestParam(defaultValue="15")int perPageNum,
																	@RequestParam(defaultValue="")String searchType,
																	@RequestParam(defaultValue="")String keyword,
																	HttpSession session) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum, searchType, keyword);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));
		cri.setInspNo(insp.getInspNo());
		String pbhtNo = insp.getPbhtNo();
		try {
			Map<String, Object> dataMap = inspService.getResultListPage(cri);
			List<InspResultVO> resultList = (List<InspResultVO>) dataMap.get("resultList");
			if(!resultList.isEmpty()) {
				InspResultVO result = resultList.get(0);
				InspResultVO pbht = inspService.getPbhtInfoByPbhtNo(pbhtNo);
				result.setInstAdres(pbht.getInstAdres());
				result.setInstNm(pbht.getInstNm());
				result.setInstTelno(pbht.getInstTelno());
				dataMap.put("result", result);
			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	
	// 검사요청 상세조회
	@RequestMapping("/chckd-detail")
	public ResponseEntity<InspChckdVO> chckdDetail(String pstiNo) throws Exception{
		ResponseEntity<InspChckdVO> entity = null;
		try {
			InspChckdVO chckd = inspService.getChckdDetail(pstiNo);
			if(chckd.getGender().equals("M")) {
				
			}
			entity = new ResponseEntity<InspChckdVO>(chckd, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<InspChckdVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/result-detail")
	public ResponseEntity<InspResultVO> resultDetail(String pstiNo, HttpSession session) throws Exception{
		ResponseEntity<InspResultVO> entity = null;
		
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		String pbhtNo = insp.getPbhtNo();
		try {
			InspResultVO pbht = inspService.getPbhtInfoByPbhtNo(pbhtNo);
			
			InspResultVO result = inspService.getResultDetail(pstiNo);
			result.setInstNm(pbht.getInstNm());
			result.setInstAdres(pbht.getInstAdres());
			result.setInstTelno(pbht.getInstTelno());
			entity = new ResponseEntity<InspResultVO>(result, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<InspResultVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
