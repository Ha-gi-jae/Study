package com.spring.compass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.compass.command.CnfrmDgnssReqDetailVO;
import com.spring.compass.command.CnfrmDgnssWaitDetailVO;
import com.spring.compass.command.CnfrmListDetailVO;
import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.MberCommand;
import com.spring.compass.command.MberManageCommand;
import com.spring.compass.command.PstiAdresVO;
import com.spring.compass.command.ResSmplDetailVO;
import com.spring.compass.command.SlfptntDetailVO;
import com.spring.compass.command.SmplListDetailVO;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtServiceLMY;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;

@RestController
@RequestMapping("/rest-pbht")
public class RestPbhtController {

	private static final Logger LOGGER = LoggerFactory.getLogger(RestHsptController.class);

	@Autowired
	private PbhtServiceLMY pbhtServiceLMY;
	
	@Autowired
	private MberService mberService;
	
	@RequestMapping("/smpl-list")
	public ResponseEntity<Map<String, Object>> reqSmplList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum, searchType, keyword);

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		cri.setPbhtNo(pbht.getPbhtNo());

		try {
			Map<String, Object> dataMap = pbhtServiceLMY.getSmplList(cri);

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/res-smple-list")
	public ResponseEntity<Map<String, Object>> smplResultList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String typeCode,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum, searchType, keyword);

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		System.out.println(typeCode);
		cri.setPbhtNo(pbht.getPbhtNo());
		cri.setTypeCode(typeCode);
		try {
			Map<String, Object> dataMap = pbhtServiceLMY.getSmplResultList(cri);
			dataMap.put("typeCode", typeCode);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-list")
	public ResponseEntity<Map<String, Object>> cnfrmList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "A102") String typeCode,
			@RequestParam(defaultValue = "10") int displayPageNum,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum, searchType, keyword);

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		cri.setPbhtNo(pbht.getPbhtNo());
		cri.setTypeCode(typeCode);
		try {
			Map<String, Object> dataMap = pbhtServiceLMY.getCnfrmDgnssList(cri, displayPageNum);
			System.out.println(dataMap);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-manage-list")
	public ResponseEntity<Map<String, Object>> cnfrmManageList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "15") int perPageNum, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String typeCode,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum, searchType, keyword);

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		cri.setPbhtNo(pbht.getPbhtNo());
		cri.setTypeCode(typeCode);
		try {
			Map<String, Object> dataMap = pbhtServiceLMY.getCnfrmManageList(cri);

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/smpl-detail")
	public ResponseEntity<SmplListDetailVO> smplDetail(HttpSession session, String smplNo) {

		ResponseEntity<SmplListDetailVO> entity = null;
		Map<String, Object> sldData = new HashMap<String, Object>();

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		sldData.put("pbhtNo", pbht.getPbhtNo());
		sldData.put("smplNo", smplNo);

		try {
			SmplListDetailVO dataMap = pbhtServiceLMY.getSmplDetail(sldData);

			entity = new ResponseEntity<SmplListDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<SmplListDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-wait-datail")
	public ResponseEntity<CnfrmDgnssWaitDetailVO> cnfrmWaitDatail(HttpSession session, String cnfmNo) {

		ResponseEntity<CnfrmDgnssWaitDetailVO> entity = null;
		Map<String, Object> cdwdData = new HashMap<String, Object>();

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		cdwdData.put("pbhtNo", pbht.getPbhtNo());
		cdwdData.put("cnfmNo", cnfmNo);

		try {
			CnfrmDgnssWaitDetailVO dataMap = pbhtServiceLMY.getCnfrmDgnssWaitDetail(cdwdData);
			entity = new ResponseEntity<CnfrmDgnssWaitDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CnfrmDgnssWaitDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-req-datail")
	public ResponseEntity<CnfrmDgnssReqDetailVO> cnfrmReqDatail(HttpSession session, String dgnssNo) {

		ResponseEntity<CnfrmDgnssReqDetailVO> entity = null;
		Map<String, Object> cdrdData = new HashMap<String, Object>();

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));

		cdrdData.put("pbhtNo", pbht.getPbhtNo());
		cdrdData.put("dgnssNo", dgnssNo);

		System.out.println(cdrdData);

		try {
			CnfrmDgnssReqDetailVO dataMap = pbhtServiceLMY.getCnfrmDgnssReqDetail(cdrdData);
			entity = new ResponseEntity<CnfrmDgnssReqDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CnfrmDgnssReqDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-list-datail")
	public ResponseEntity<CnfrmListDetailVO> cnfrmListDatail(String manageNo) {

		ResponseEntity<CnfrmListDetailVO> entity = null;

		try {
			CnfrmListDetailVO dataMap = pbhtServiceLMY.getCnfrmListDetail(manageNo);
			entity = new ResponseEntity<CnfrmListDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CnfrmListDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/cnfrm-slf-list-datail")
	public ResponseEntity<SlfptntDetailVO> cnfrmSlfListDatail(String manageNo) {

		ResponseEntity<SlfptntDetailVO> entity = null;

		try {
			SlfptntDetailVO dataMap = pbhtServiceLMY.getSlfptntDetail(manageNo);
			entity = new ResponseEntity<SlfptntDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<SlfptntDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/res-smple-detail")
	public ResponseEntity<ResSmplDetailVO> resSmpleDetail(String manageNo, String typeCode, String smplNo) {

		ResponseEntity<ResSmplDetailVO> entity = null;

		try {
			ResSmplDetailVO dataMap = pbhtServiceLMY.getResSmplDetail(manageNo, typeCode, smplNo);
			entity = new ResponseEntity<ResSmplDetailVO>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<ResSmplDetailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/hspt-detail")
	public ResponseEntity<Map<String, Object>> hsptDetail(String hsptNo, HttpSession session) {
		ResponseEntity<Map<String, Object>> entity = null;
		
		PbhtVO pbht = (PbhtVO)session.getAttribute("loginInst");
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("pbhtNo", pbht.getPbhtNo());
		data.put("hsptNo", hsptNo);
		
		try {
			Map<String,Object> dataMap = new HashMap<String, Object>();
			DgnssHsptVO dgnssHspt = pbhtServiceLMY.getHsptDetail(hsptNo);
			int result = pbhtServiceLMY.getBookMark(data);
			dataMap.put("dgnssHspt", dgnssHspt);
			dataMap.put("result", result);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}

	@RequestMapping("/hspt-bookmark-list")
	public ResponseEntity<Map<String, Object>> hsptBookmarkList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int perPageNum, @RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String typeCode,
			@RequestParam(defaultValue = "") String manageNo, @RequestParam(defaultValue = "false") boolean rmndSckbdCntCheck,
			HttpSession session) {

		ResponseEntity<Map<String, Object>> entity = null;

		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum, searchType, keyword);

		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));
		
		cri.setPbhtNo(pbht.getPbhtNo());
		cri.setRmndSckbdCntCheck(rmndSckbdCntCheck);
		try {
				Map<String, Object> dataMap = new HashMap<String, Object>();
				PstiAdresVO psti = pbhtServiceLMY.getPstiDatile(manageNo);
			if (typeCode.equals("all")) {
				dataMap = pbhtServiceLMY.getDgnssHsptAllList(cri, psti);
				dataMap.put("psti", psti);
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			} else {
				dataMap = pbhtServiceLMY.getDgnssHsptBookmarkList(cri);
				dataMap.put("psti", psti);
				entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping("/main-hspt-list")
	public ResponseEntity<Map<String, Object>> mainHsptList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int perPageNum,@RequestParam(defaultValue = "") String areaNo,
			HttpSession session) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		SmplSearchCommand cri = new SmplSearchCommand(page, perPageNum );
		
		PbhtVO pbht = (PbhtVO) (session.getAttribute("loginInst"));
		cri.setPbhtNo(pbht.getPbhtNo());
		try {
			Map<String, Object> dataMap = pbhtServiceLMY.getHsptAllList(cri, areaNo);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}

	@RequestMapping("/req-cancle-regist")
	public ResponseEntity<Map<String, Object>> reqCancleRegist(String dgnssNo, String manageNo, String hsptNo) {

		ResponseEntity<Map<String, Object>> entity = null;
		
		
		try {
			   String result = pbhtServiceLMY.setDgnssReqDelete(dgnssNo, manageNo, hsptNo);
			   Map<String, Object> dataMap = new HashMap<String, Object>();
			   dataMap.put("result", result);
			   entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	@RequestMapping("/self-modifyRegist")
	public ResponseEntity<Map<String, Object>> selfModifyRegist(PstiVO pstiVo) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = pbhtServiceLMY.setSelfModifyRegist(pstiVo);
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("result", result);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/bookmark-regist")
	public ResponseEntity<Integer>bookmarkRegist(String hsptNo, HttpSession session, @RequestParam(defaultValue = "C102") String fromCode
																				   , @RequestParam(defaultValue = "C103") String toCode){
		
		ResponseEntity<Integer> entity = null;
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		PbhtVO pbht = (PbhtVO) session.getAttribute("loginInst");
		data.put("from_pbhtNo", pbht.getPbhtNo());
		data.put("to_hsptNo", hsptNo);
		data.put("fromCode", fromCode);
		data.put("toCode", toCode);
		try {
			Integer result = pbhtServiceLMY.setBookMark(data);
			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/bookmark-remove")
	public ResponseEntity<Integer>bookmarkRemove(String hsptNo, HttpSession session){
		
		ResponseEntity<Integer> entity = null;
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		PbhtVO pbht = (PbhtVO) session.getAttribute("loginInst");
		data.put("from_pbhtNo", pbht.getPbhtNo());
		data.put("to_hsptNo", hsptNo);
		try {
			Integer result = pbhtServiceLMY.deleteBookMark(data);
			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/rmndSckbdCnt-check")
	public ResponseEntity<Integer>rmndSckbdCntCheck(String hsptNo){
		
		ResponseEntity<Integer> entity = null;
		
		try {
			Integer result = pbhtServiceLMY.getRmndSckbdCntCheck(hsptNo);
			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
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
			PbhtVO pbht = (PbhtVO) session.getAttribute("loginInst");
			cri.setInstNo(pbht.getInstNo());
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
		
		@RequestMapping(value="/mberRegist",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<Integer> mberRegist (MberCommand data, HttpSession session) throws Exception{
			
			PbhtVO pbht = (PbhtVO) session.getAttribute("loginInst");
			String instNm = pbht.getInstNm();
			
			ResponseEntity<Integer> entity = null;
			
			MberVO mber = data.mber();
			
			
			mber.setInstNm(instNm);
			
			try {
				
				int result = mberService.registMber(mber);

				entity = new ResponseEntity<Integer>(result, HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			}				
			return entity;
		}
		
		@RequestMapping(value = "/mberDelete", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<Integer> mberDelete(String mberNo) throws Exception{
			ResponseEntity<Integer> entity = null;
			
			try {
				int result = mberService.removeMber(mberNo);
				entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return entity;
		}

}
