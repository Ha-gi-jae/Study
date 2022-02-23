package com.spring.compass.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.compass.command.DgnssDetailCommand;
import com.spring.compass.command.InptntDetailCommand;
import com.spring.compass.command.InptntListSearchCommand;
import com.spring.compass.command.InptntListVO;
import com.spring.compass.command.MberCommand;
import com.spring.compass.command.NoticeModifyCommand;
import com.spring.compass.command.NoticeRegistCommand;
import com.spring.compass.command.ReqInptntDetailCommand;
import com.spring.compass.command.SckbdreqDetailCommand;
import com.spring.compass.command.SckbdreqProcessCommand;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.HsptSerivceLKH;
import com.spring.compass.service.HsptService;
import com.spring.compass.service.LtctServiceLKH;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PstiServiceLKH;
import com.spring.compass.service.StatisticsService;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.HsptStatsVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.SckbdreqVO;
import com.spring.compass.vo.SmplResultVO;

@Controller
@RequestMapping(value="/hspt")
public class HsptlController {

	private static final Logger LOGGER = LoggerFactory.getLogger(HsptlController.class);
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MberService mberService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
		
	@Resource(name="noticeFilePath")
	private String noticeFilePath;
	
	@Resource(name="hsptService")
	private HsptService hsptService;
	
	@Resource(name="ltctServiceLKH")
	private LtctServiceLKH ltctServiceLKH;
	
	@Resource(name="hsptServiceLKH")
	private HsptSerivceLKH hsptServiceLKH;

	@Resource(name="statisticsService")
	private StatisticsService statsService;
	
	@Resource(name="pstiServiceLKH")
	private PstiServiceLKH pstiServiceLKH;

	@RequestMapping(value="main")
	public void main(HttpSession session,HttpServletRequest request) throws Exception {
		
		HsptVO hspt = (HsptVO) session.getAttribute("loginInst");
		HsptVO loginHspt = hsptServiceLKH.getHsptByHsptNo(hspt.getHsptNo());
		session.setAttribute("loginInst", loginHspt);
	}
	
	@RequestMapping("/main-dgnss-detail")
	public ModelAndView mainDgnssDetail(String manageNo, String instNm, ModelAndView mnv) throws Exception{
			// 진료대기 상세
			
			String url = "hspt/main-dgnss-detail";

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

			mnv.setViewName(url);
			
			mnv.addObject("dgnssDetailCommand", dgnssDetailCommand);
			mnv.addObject("manageNo", manageNo);
			mnv.addObject("instNm", instNm);
			mnv.addObject("reqYmd", new Timestamp(dgnssDetailCommand.getReqYmd().getTime()));
			mnv.addObject("resYmd", new Timestamp(dgnssDetailCommand.getResYmd().getTime()));

			return mnv;
		
	}
	
	@RequestMapping("/main-inptnt-detail")
	public ModelAndView mainInptntDetail(String manageNo, ModelAndView mnv) throws Exception{
		// 진료대기 상세
		
		String url = "hspt/main-inptnt-detail";
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
		InptntVO inptnt = pstiServiceLKH.getInptntByManageNo(manageNo);
		CnfmVO cnfm = pstiServiceLKH.getCnfmByManageNo(manageNo);
		
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",dgnssResult);
		LOGGER.debug("{}",inptnt);
		LOGGER.debug("{}",cnfm);
		
		InptntDetailCommand inptntDetailCommand = new InptntDetailCommand();
		
		inptntDetailCommand.setData(inptnt);
		inptntDetailCommand.setData(dgnssResult);
		inptntDetailCommand.setData(psti);
		inptntDetailCommand.setData(cnfm);
		
		LOGGER.debug("{}",inptntDetailCommand);
		
		mnv.setViewName(url);
		
		mnv.addObject("inptntDetailCommand", inptntDetailCommand);
		mnv.addObject("manageNo", manageNo);
		mnv.addObject("inYmd", new Timestamp(inptntDetailCommand.getInYmd().getTime()));
		
		return mnv;
		
	}
	
	@RequestMapping("/main-req-inptnt-detail")
	public ModelAndView mainReqInptntDetail(SckbdreqProcessCommand sckbdreqProcessCommand, ModelAndView mnv) throws Exception{
		
		String url = "hspt/main-req-inptnt-detail";
		
		
		LOGGER.debug("{}", sckbdreqProcessCommand);
		
		String manageNo = sckbdreqProcessCommand.getManageNo();
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByManageNo(manageNo);
		DgnssResultVO dgnssResult = pstiServiceLKH.getVDgnssResultByManageNo(manageNo);
		
		SckbdreqVO sckbdreq = pstiServiceLKH.getSckbdreqByManageNo(manageNo);
		
		String hsptNo = sckbdreq.getHsptNo();
		HsptVO hspt = hsptServiceLKH.getHsptByHsptNo(hsptNo);
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
		
		LOGGER.debug(reqInptntDetailCommand.toString());
		
		HsptVO dgnssHspt = hsptServiceLKH.getHsptByHsptNo(reqInptntDetailCommand.getDgnssHsptNo());
		String dgnssHsptNm = dgnssHspt.getInstNm();
		
		LOGGER.debug("{}", dgnssHspt);

		reqInptntDetailCommand.setDgnssHsptNm(dgnssHsptNm);
		
		LOGGER.debug("{}", reqInptntDetailCommand);
		
		mnv.setViewName(url);
		mnv.addObject("reqInptntDetailCommand", reqInptntDetailCommand);
		mnv.addObject("sckbdReqYmd", new Timestamp(reqInptntDetailCommand.getSckbdreqYmd().getTime()));
		mnv.addObject("resYmd", new Timestamp(reqInptntDetailCommand.getResYmd().getTime()));
		
		mnv.addObject("childNo",sckbdreqProcessCommand.getChildNo());
		mnv.addObject("sckbdreqNo",sckbdreqProcessCommand.getSckbdreqNo());
		mnv.addObject("manageNo",sckbdreqProcessCommand.getManageNo());
		mnv.addObject("requestCode",sckbdreqProcessCommand.getRequestCode());
		mnv.addObject("type",sckbdreqProcessCommand.getType());
		
		return mnv;
		
	}
	
	@RequestMapping("/main-my-sckbdreq-detail")
	public ModelAndView mainMySckbdreqDetail(String manageNo, String sckbdreqNo, ModelAndView mnv) throws Exception{
		
		String url = "hspt/main-my-sckbdreq-detail";
		
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
		
		boolean lastRecord = sckbdreq.getSckbdreqNo().equals(sckbdreqNo);
		
		if(sckbdreq.getType().equals("A")) {
			hspt = hsptServiceLKH.getHsptByHsptNo(childNo);
		}
		if(sckbdreq.getType().equals("B")) {
			ltct = ltctServiceLKH.getLtctByLtctNo(childNo);
		}
		
		LOGGER.debug("{}",psti);
		LOGGER.debug("{}",dgnssResult);
		LOGGER.debug("{}",smplResult);
		LOGGER.debug("{}",sckbdreq);
		LOGGER.debug("{}",inptnt);
		LOGGER.debug("{}",cnfm);
		LOGGER.debug("{}",ltct);
		LOGGER.debug("{}",hspt);
		
		SckbdreqDetailCommand sckbdreqDetailCommand = new SckbdreqDetailCommand();
		
		sckbdreqDetailCommand.setData(dgnssResult);
		sckbdreqDetailCommand.setData(psti);
		sckbdreqDetailCommand.setData(sckbdreq);
		sckbdreqDetailCommand.setData(ltct);
		sckbdreqDetailCommand.setData(hspt);
		sckbdreqDetailCommand.setData(smplResult);
		sckbdreqDetailCommand.setData(inptnt);
		sckbdreqDetailCommand.setData(cnfm);
		
		LOGGER.debug("{}", sckbdreqDetailCommand);
		
		HsptVO dgnssHspt = hsptServiceLKH.getHsptByHsptNo(sckbdreqDetailCommand.getDgnssHsptNo());
		String dgnssHsptNm = dgnssHspt.getInstNm();
		
		LOGGER.debug("{}", dgnssHspt);

		sckbdreqDetailCommand.setDgnssHsptNm(dgnssHsptNm);
		
		sckbdreqDetailCommand.setLastRecord(lastRecord);
		
		LOGGER.debug("{}", sckbdreqDetailCommand);		
		
		mnv.setViewName(url);
		mnv.addObject("sckbdreqDetailCommand", sckbdreqDetailCommand);
		mnv.addObject("sckbdReqYmd", new Timestamp(sckbdreqDetailCommand.getSckbdreqYmd().getTime()));
		mnv.addObject("resYmd", new Timestamp(sckbdreqDetailCommand.getResYmd().getTime()));
		mnv.addObject("cancleYmd", new Timestamp(sckbdreqDetailCommand.getCancleYmd().getTime()));
		
		return mnv;
		
	}
	
	@RequestMapping(value="/sckbdreq-inptnt")
	public ModelAndView sckbdRequest( ModelAndView mnv 
									 ,String manageNo
									 ,String pstiNm
									 ,@RequestParam(defaultValue="A") String type
									 ,@RequestParam(defaultValue="") String sckbdreqNo
									 ,HttpSession session) {
		String url = "hspt/sckbdreq-inptnt-work";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("manageNo", manageNo);
		dataMap.put("pstiNm", pstiNm);
		dataMap.put("type", type);
		dataMap.put("sckbdreqNo", sckbdreqNo);
		
		mnv.addAllObjects(dataMap);
		
		LOGGER.debug("{}",dataMap);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping(value="/sckbdreq-isoptnt")
	public ModelAndView sckbdLtctRequest( ModelAndView mnv 
										 ,String manageNo
										 ,String pstiNm
										 ,@RequestParam(defaultValue="A") String type
										 ,@RequestParam(defaultValue="") String sckbdreqNo
										 ,HttpSession session) {
		String url = "hspt/sckbdreq-isoptnt";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("manageNo", manageNo);
		dataMap.put("pstiNm", pstiNm);
		dataMap.put("type", type);
		dataMap.put("sckbdreqNo", sckbdreqNo);
		
		mnv.addAllObjects(dataMap);
		
		LOGGER.debug("{}",dataMap);
		
		mnv.setViewName(url);
		
		return mnv;
	}



	@RequestMapping(value="/inptnt-list")
	public ModelAndView inptntList(ModelAndView mnv, HttpSession session) throws Exception{
		
		String url = "hspt/inptnt-list-work";
		
		HsptVO loginHspt = (HsptVO) session.getAttribute("loginInst");
		
		List<PbhtVO> pbhtList = hsptServiceLKH.getPbhtListByAreaNo(loginHspt.getAreaNo());
		
		mnv.addObject("pbhtList", pbhtList);
		
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping(value="/dgnss-list")
	public String dgnssList() {
		
		String url = "hspt/dgnss-list-work";
		
		return url;
	}

	//병상 등록 및 사용현황 view
	@RequestMapping(value="/sckbd-modify")
	public ModelAndView modify(HttpSession session, ModelAndView mnv) throws Exception {
		
		String url = "hspt/sckbd-modify-work";
		
		Map<String, Object> dataMap = null;
		
		HsptVO loginHspt = (HsptVO)session.getAttribute("loginInst");
		HsptStatsVO hsptStats = hsptServiceLKH.getHsptMainStatisticsByHspt(loginHspt);
		
		double sckbdCnt = (double)loginHspt.getSckbdCnt();
		double rmndSckbdCnt = (double)loginHspt.getRmndSckbdCnt();
		double opRate = 0;
		String color = "";
		
		dataMap = new HashMap<String, Object>();
		if(loginHspt.getSckbdCnt() == 0) {
			opRate = 0;
		}else {
			opRate = Math.round(( (sckbdCnt - rmndSckbdCnt) / sckbdCnt)  * 100);
		}
		if(opRate > 80){
			color = "#dc3545";
		}else if(opRate > 60){
			color = "##ffc107";
		}else if(opRate > 40){
			color = "#28a745";
		}else{
			color = "#007bff";
		}
		
		if(hsptStats == null) {
			hsptStats = new HsptStatsVO();
			hsptStats.setInptntCnt(0);
			hsptStats.setRlsedCnt(0);
			hsptStats.setOutCnt(0);
			hsptStats.setDeathCnt(0);
		}

		int curInptntCnt = hsptService.getAllInptntCnt(loginHspt.getHsptNo());
		
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("curInptntCnt", curInptntCnt);
		
		dataMap.put("hsptStats", hsptStats);
		dataMap.put("loginHspt", loginHspt);
		dataMap.put("opRate", opRate);
		dataMap.put("color", color);
		LOGGER.debug("{}", hsptStats);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		
		return mnv;
	}

	// 총병상수 수정
	@RequestMapping(value="/sckbdModifyUpdate")
	public String sckbdModifyUpdate(HttpSession session,HttpServletRequest request,int inputSckbd) throws Exception {
		String url = "redirect:hspt/sckbdcnt-modify-success";
		HsptVO hspt = (HsptVO) session.getAttribute("loginInst");
		
		String hsptNo = hspt.getHsptNo();
		hsptService.getRmndSckbdCnt(hsptNo);
		hsptService.getSckbdCnt(hsptNo);
		request.setAttribute("inputSckbd", inputSckbd);
		
		
		//redirect /sckbd-modify
		return url;
	}
	
	@RequestMapping(value="/req-sckbd-list")
	public String reqSckbdList() {
		return "hspt/req-sckbd-list";
	}
	@RequestMapping(value="/req-inptnt-list")
	public String reqInptntList() {
		return "hspt/req-inptnt-list-work";
	}
	@RequestMapping("/notice-list")
	public ModelAndView noticeList(HttpServletRequest request,
						  @RequestParam(defaultValue="1") int page,
						  @RequestParam(defaultValue="15") int perPageNum,
						  @RequestParam(defaultValue="") String searchType,
						  @RequestParam(defaultValue="") String keyword,
						  ModelAndView mnv) throws Exception {
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		String url ="hspt/notice-list";
		/*HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		
		String instNo = mber.getInstNo();
		cri.setInstNo(instNo);
		Map<String, Object> dataMap = adminService.getNoticeListByInstNo(cri);
		mnv.addObject("dataMap", dataMap);*/
		Map<String, Object> dataMap = adminService.getNoticeList(cri);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	@RequestMapping("/notice-registForm")
	public String noticeRegistform() {
		String url="hspt/notice-registForm";
		
		return url;
	}
	
	@RequestMapping("/notice-regist")
	public String noticeRegist(HttpServletRequest req, NoticeRegistCommand noticeCommand) throws Exception{
		String url="hspt/notice-registSuccess";
		AttachVO attach = new AttachVO();
		HttpSession session = req.getSession();
		MberVO loginUser = (MberVO) session.getAttribute("loginUser");
		String mberNo = loginUser.getMberNo();
		String instNo = loginUser.getInstNo();
		MultipartFile noticeFile = noticeCommand.getNoticeFile();
		String noticeNo = adminService.getNoticeSeq();
		NoticeVO notice=noticeCommand.toNoticeVo(noticeNo, mberNo);
		notice.setInstNo(instNo);
		int resultNotice = adminService.registNotice(notice);
		if(resultNotice<1) url="hspt/notice-registFail";
		
		if(noticeFile.getOriginalFilename().length()>1) {
			String fileName = FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			String attachNo = adminService.getAttachSeq();
			attach.setAtchNo(attachNo);
			attach.setUploadPath(noticeFilePath);
			attach.setFileName(fileName);
			attach.setNoticeNo(noticeNo);
			attach.setMberNo(mberNo);
			int resultAttach = adminService.registAttach(attach);
			if(resultAttach<1) url="hspt/notice-registFail";
		}
		
		return url;
	}
	
	@RequestMapping("/notice-detail")
	public ModelAndView admin_detail(String noticeNo, ModelAndView mnv) throws Exception{
		String url = "hspt/notice-detail";
		
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		AttachVO attach = adminService.getAttachByNoticeNo(noticeNo);
		if(attach !=null) {
			String fileName = attach.getFileName();
			String originalFileName =fileName.split("\\$\\$")[1];
			mnv.addObject("originalFileName", originalFileName);
			mnv.addObject("fileName", fileName);
		}
		mnv.addObject("notice", notice);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/notice-modifyForm")
	public ModelAndView noticeModifyForm(String noticeNo, ModelAndView mnv) throws Exception {
		String url="hspt/notice-modifyForm";
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		AttachVO attach = adminService.getAttachByNoticeNo(noticeNo);
		if(attach !=null) {
			String fileName = attach.getFileName();
			String originalFileName =fileName.split("\\$\\$")[1];
			mnv.addObject("originalFileName", originalFileName);
			mnv.addObject("fileName", fileName);
		}
		SimpleDateFormat smformat = new SimpleDateFormat("yyy-MM-dd");
		String startDate =smformat.format(notice.getStartYmd());
		String endDate=smformat.format(notice.getEndYmd());
		mnv.addObject("notice", notice);
		mnv.addObject("startDate", startDate);
		mnv.addObject("endDate", endDate);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/notice-modify")
	public String noticeModify(HttpServletRequest req, NoticeModifyCommand noticeModifyCommand) throws Exception{
		String url="hspt/notice-modifySuccess";
		HttpSession session = req.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		String mberNo = mber.getMberNo();
		NoticeVO notice = noticeModifyCommand.toNoticeVo(mberNo);
		String writerMberNo = notice.getMberNo();
		if(!(mberNo.equals(writerMberNo))) {
			url="hspt/notice-inconsistent";
			return url;
		}
		MultipartFile noticeFile = noticeModifyCommand.getNoticeModifyFile();
		String deleteFileCheck = noticeModifyCommand.getDeleteFileCheck();
		if(deleteFileCheck.equals("YES")) {
			adminService.removeAttachByfileName(noticeModifyCommand.getDeleteFileName());
		}
		if(noticeFile.getOriginalFilename().length()<1) {
			adminService.modifyNoticeByInst(notice);
		}
		if(noticeFile.getOriginalFilename().length()>1) {
			String fileName=FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			adminService.removeAttachByfileName(noticeModifyCommand.getDeleteFileName());
			adminService.modifyNoticeByInst(notice);
			AttachVO attach = new AttachVO();
			String attachNo = adminService.getAttachSeq();
			attach.setAtchNo(attachNo);
			attach.setUploadPath(noticeFilePath);
			attach.setFileName(fileName);
			attach.setNoticeNo(notice.getNoticeNo());
			attach.setMberNo(mberNo);
			adminService.registAttach(attach);
			
		}
		
		return url;
	}
	
	@RequestMapping(value="/notice-remove", method=RequestMethod.GET)
	public String noticeRemove(HttpServletRequest request, String noticeNo) throws Exception{
		String url="hspt/noticeRemoveSuccess";
		HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		String mberNo = mber.getMberNo();
		String writerMberNo = notice.getMberNo();
		
		if(!(mberNo.equals(writerMberNo))) {
			url="hspt/notice-inconsistent";
			return url;
		}
		
		String atchNo=null;
		AttachVO attach = adminService.getAttachByNoticeNo(noticeNo);
		if(attach !=null) {
			atchNo = attach.getAtchNo();
		}
		adminService.removeNotice(atchNo, noticeNo);
		
		return url;
	}
	
	@RequestMapping(value="/getFile", method=RequestMethod.GET)
	public String getFile(String fileName, Model model) {
		String url="downloadFile";
		model.addAttribute("fileName", fileName);
		model.addAttribute("savePath", noticeFilePath);
		return url;
	}

	@RequestMapping(value="/emp-manage-registform" )
	public ModelAndView empRegistForm(ModelAndView mnv,HttpSession session) {
		String url="hspt/emp-manage-registform";
				
		HsptVO hspt = (HsptVO) session.getAttribute("loginInst");
		MberVO mber = (MberVO) session.getAttribute("loginUser");
			
		mnv.addObject("hspt",hspt);
		mnv.addObject("mberCode",mber.getMberCode());
		
		mnv.setViewName(url);

		return mnv;
	}
	@RequestMapping(value="/statistics")
	public String statistics() {
		String url="hspt/statistics";

		return url;
	}
	@RequestMapping("/main-inptnt-list") // inptnt-list-module-work 입원환자
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
		
	@RequestMapping(value="/mberRegist",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> mberRegist (MberCommand data, HttpSession session) throws Exception{
		
		HsptVO hspt = (HsptVO) session.getAttribute("loginInst");
		String instNm = hspt.getInstNm();
		
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
	
	@RequestMapping("/emp-manage-list")
	public String mberList()throws Exception{
		String url = "hspt/emp-manage-list";
		
		return url;
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "common/mypage";
		MberVO loginUser = (MberVO)session.getAttribute("loginUser");
		
		String mberNo= loginUser.getMberNo();
		try {
			MberVO mber = mberService.getDetailByMberNo(mberNo);
			mnv.addObject("mber", mber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	

}
