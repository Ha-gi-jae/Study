package com.spring.compass.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.compass.command.NoticeModifyCommand;
import com.spring.compass.command.NoticeRegistCommand;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SearchCriteriaGeon;
import com.spring.compass.command.instRegistCommand;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.HsptService;
import com.spring.compass.service.InspService;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtService;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.util.LogReadingUtil;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.LoginVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private InspService inspService;
	@Autowired
	private PbhtService pbhtService;
	@Autowired
	private HsptService hsptService;
	@Autowired
	private MberService mberService;
	@Autowired
	private LtctService ltctService;
	@Autowired
	private AdminService adminService;
	
	@Resource(name="instPath")
	private String instPath;
	
	@Resource(name="noticeFilePath")
	private String noticeFilePath;
	
	@Resource(name="loginUserFilePath")
	private String savePath;
	
	@Resource(name="loginUserFileName")
	private String loginFileName;
	
	@Resource(name="loginFailUserFilePath")
	private String saveFailPath;
	
	@Resource(name="loginFailUserFileName")
	private String loginFailFileName;
	
	@RequestMapping("main")
	public ModelAndView adminMain(ModelAndView mnv) {
		String url="admin/main";
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<LoginVO> mainLogList = null;
		List<LoginVO> mainFailLogList = null;
		try {
			mainLogList = 
					new LogReadingUtil().getMainLoginList(savePath, loginFileName);
			mainFailLogList =
					new LogReadingUtil().getMainLoginFailList(saveFailPath, loginFailFileName);
			dataMap.put("mainLogList", mainLogList);
			dataMap.put("mainFailLogList", mainFailLogList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/inst-list")
	public String insttList(){
		String url="admin/inst-list";
		return url;
	}
	@RequestMapping("/error-log-list")
	public ModelAndView error(ModelAndView mnv, @RequestParam(defaultValue="1")int page
											   ,@RequestParam(defaultValue="15")int perPageNum
											   ,@RequestParam(defaultValue="")String searchType
											   ,@RequestParam(defaultValue="")String keyword) throws Exception{
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		Map<String, Object> dataMap = new HashMap<String, Object>();

		String url="admin/errorlogPage";
		dataMap = LogReadingUtil.getLogList(saveFailPath, loginFailFileName, cri);
		mnv.addObject("dataMap", dataMap);
		
		mnv.setViewName(url);

		
		return mnv;
	}
	@RequestMapping("/access-log-list")
	public ModelAndView access(ModelAndView mnv, @RequestParam(defaultValue="1")int page
												,@RequestParam(defaultValue="15")int perPageNum
												,@RequestParam(defaultValue="")String searchType
												,@RequestParam(defaultValue="")String keyword)throws Exception{
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String url="admin/accesslogPage";
		dataMap = LogReadingUtil.getLogList(savePath, loginFileName, cri);
		mnv.addObject("dataMap", dataMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/loginFileDownload")
	public String loginFileDown(Model model) {
		String url="downloadFile";
		
		model.addAttribute("fileName",loginFileName);
		model.addAttribute("savePath",savePath);
		
		return url;
	}
	
	@RequestMapping("/loginFailFileDownload")
	public String loginFailFileDown(Model model) {
		String url ="downloadFile";
		System.out.println("옵니다 faildownload");
		model.addAttribute("fileName", loginFailFileName);
		model.addAttribute("savePath", saveFailPath);
		
		return url;
	}
	
	@RequestMapping("/inst-registForm")
	public ModelAndView insttRegistForm(@RequestParam(defaultValue="")String instNm,
								  @RequestParam(defaultValue="")String pbhtNo,
								  ModelAndView mnv) {
		String url="admin/inst-registForm";
		
		mnv.addObject("instNm", instNm);
		mnv.addObject("pbhtNo", pbhtNo);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/admin-emp-modifyForm")
	public String admin_emp() {
		String url = "admin/admin-emp-modifyForm";
		return url;
	}

	@RequestMapping("/notice-list")
	public ModelAndView admin_notice(@RequestParam(defaultValue="1")int page,
									 @RequestParam(defaultValue="15")int perPageNum,
									 @RequestParam(defaultValue="")String searchType,
									 @RequestParam(defaultValue="")String keyword,
									 ModelAndView mnv) throws Exception{
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		String url = "admin/notice-list";
		Map<String, Object> dataMap = adminService.getNoticeList(cri);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	@RequestMapping("/notice-detail")
	public ModelAndView admin_detail(String noticeNo, ModelAndView mnv) throws Exception{
		String url = "admin/notice-detail";
		
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
	@RequestMapping("/notice-registForm")
	public String noticeRegistForm() {
		String url="admin/notice-registForm";
		
		return url;
	}
	@RequestMapping("/notice-modifyForm")
	public ModelAndView noticeModifyForm(String noticeNo, ModelAndView mnv) throws Exception {
		String url="admin/notice-modifyForm";
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
		String url="admin/notice-modifySuccess";
		HttpSession session = req.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		String mberNo = mber.getMberNo();
		NoticeVO notice = noticeModifyCommand.toNoticeVo(mberNo);
		MultipartFile noticeFile = noticeModifyCommand.getNoticeModifyFile();
		String deleteFileCheck = noticeModifyCommand.getDeleteFileCheck();
		String hiddenModifyFile = noticeModifyCommand.getHiddenModifyFile();
		
		System.out.println("hiddenModifyFile:"+hiddenModifyFile);
		
		if(deleteFileCheck.equals("YES")) {
			adminService.removeAttachByfileName(noticeModifyCommand.getDeleteFileName());
		}
		if(noticeFile.getOriginalFilename().length()<1) {
			notice.setPopUp("N");
			adminService.modifyNotice(notice);
		}
		if(hiddenModifyFile !=null) {
			notice.setPopUp("Y");
			adminService.modifyNotice(notice);
			return url;
		}
		if(noticeFile.getOriginalFilename().length()>1) {
			notice.setPopUp("Y");
			String fileName=FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			adminService.removeAttachByfileName(noticeModifyCommand.getDeleteFileName());
			adminService.modifyNotice(notice);
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
	
	
	@RequestMapping("/notice-regist")
	public String noticeRegist(HttpServletRequest req, NoticeRegistCommand noticeCommand)throws Exception{
		String url="admin/notice-registSuccess";
		AttachVO attach = new AttachVO();
		HttpSession session = req.getSession();
		MberVO loginUser = (MberVO) session.getAttribute("loginUser");
		String mberNo = loginUser.getMberNo();
		MultipartFile noticeFile = noticeCommand.getNoticeFile();
		String noticeNo = adminService.getNoticeSeq();
		NoticeVO notice=noticeCommand.toNoticeVo(noticeNo, mberNo);
		if(noticeFile.getOriginalFilename().length()>1) {
			System.out.println("여기로옴");
			notice.setPopUp("Y");
		}
		try {
			adminService.registNoticeAdmin(notice);
			
		}catch(Exception e) {
			e.printStackTrace();
			url="admin/notice-registFail";
		}
		if(noticeFile.getOriginalFilename().length()>1) {
			System.out.println("여기도옴");
			String fileName = FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			String attachNo = adminService.getAttachSeq();
			attach.setAtchNo(attachNo);
			attach.setUploadPath(noticeFilePath);
			attach.setFileName(fileName);
			attach.setNoticeNo(noticeNo);
			attach.setMberNo(mberNo);
			try {
				adminService.registAttach(attach);
			}catch(Exception e) {
				e.printStackTrace();
				url="admin/notice-registFail";
			}
		}
		
		return url;
	}
	
	@RequestMapping(value="/getFile", method=RequestMethod.GET)
	public String getFile(String fileName, Model model) {
		String url="downloadFile";
		model.addAttribute("fileName", fileName);
		model.addAttribute("savePath", noticeFilePath);
		return url;
	}
	
	@RequestMapping(value="/notice-remove", method=RequestMethod.GET)
	public String noticeRemove(String noticeNo) throws Exception{
		String url="admin/noticeRemoveSuccess";
		AttachVO attach = adminService.getAttachByNoticeNo(noticeNo);
		String atchNo=null;
		if(attach != null) {
			atchNo = attach.getAtchNo();
		}
		adminService.removeNotice(atchNo, noticeNo);
		
		return url;
	}
	
	@RequestMapping(value="/pbht-list")
	public ModelAndView pbhtList(@RequestParam(defaultValue="1")int page,
						   @RequestParam(defaultValue="15")int perPageNum,
						   @RequestParam(defaultValue="")String searchType,
						   @RequestParam(defaultValue="")String searchType2,
						   @RequestParam(defaultValue="")String keyword, ModelAndView mnv) throws Exception{
		String url="admin/pbht-list";
		SearchCriteriaGeon cri = new SearchCriteriaGeon(page, perPageNum, searchType, searchType2, keyword);
		Map<String, Object> pbhtMap = adminService.getMainPbhtList(cri);
		mnv.addObject("pbhtMap", pbhtMap);
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value="/inst-selfRegist", method=RequestMethod.POST)
	public String selfInstRegist(instRegistCommand registCommand)throws Exception{
		InspVO insp = new InspVO();
		PbhtVO pbht = new PbhtVO();
		HsptVO hspt = new HsptVO();
		LtctVO ltct = new LtctVO();
		InstVO inst = new InstVO();
		MberVO mber = new MberVO();
		String url="admin/inst-registSuccess";
		String writer=registCommand.getWriter();
		String checkInst = registCommand.getInst();
		String instCall=registCommand.getInstCall();
		String checkAdres = registCommand.getInstAdres();
		String instNm = registCommand.getInstName();
		String resAgency =registCommand.getResAgency();
		String resAgencyNo = registCommand.getResAgencyNo();
		
		String changeAdres = checkAdres.substring(0, checkAdres.indexOf(" "));
		System.out.println("changeAdres:"+changeAdres);
		try {
			switch (checkInst) {
			case "검사소":
				String cityNoInsp = inspService.getInspCityNo(changeAdres);
				String responsibleAgency = resAgency;
				String inspSeqNo = inspService.getInspSeqNo();
				String instSeqNo = inspService.getInstSeqNo();
				String instNoInsp = "INST" + "01" + instSeqNo;
				String inspNo = "INSP"+cityNoInsp+inspSeqNo;
				String pbhtNoByInsp = resAgencyNo;
				
				insp.setPbhtNo(pbhtNoByInsp);
				insp.setCityNo(cityNoInsp);
				insp.setInspNo(inspNo);
				insp.setInstAdres(checkAdres);
				insp.setInstNm(instNm);
				insp.setInstNo(instNoInsp);
				insp.setInstTelno(instCall);
				insp.setInstCode("C101");
				
				inst.setInstNo(instNoInsp);
				inst.setInstCode("C101");
				inst.setChildNo(inspNo);
				inst.setInstNm(instNm);
				inst.setInstTelno(instCall);
				inst.setInstAdres(checkAdres);
				
				String mberNoInsp = mberService.getMberSeq();
				String mberIdInsp = changeAdres+instNm.replaceAll(" ", "");
				String instTelnoInsp = instCall;
				String mberPwdInsp=instTelnoInsp.replaceAll("-", "");
				
				mber.setMberNo(mberNoInsp);
				mber.setInstNo(instNoInsp);
				mber.setMberCode("B121");
				mber.setMberId(mberIdInsp);
				mber.setMberPwd(mberPwdInsp);
				mber.setMberTelno(instTelnoInsp);
				mber.setMberNm(instNm);
				mber.setMberAdres(checkAdres);
				
				inspService.registInsp(insp);
				adminService.registInst(inst);
				mberService.registMberRepresent(mber);
				
				break;
			case "보건소":
				String cityNoPbht = pbhtService.getPbhtCityNo(changeAdres);
				int pbhtSeq = pbhtService.getPbhtSeqNo();
				int instSeq = pbhtService.getInstSeqNo();
				String pbhtNo = "PBHT"+cityNoPbht+pbhtSeq;
				String instNo = "INST"+"02"+instSeq;
				
				pbht.setCityNo(cityNoPbht);
				pbht.setPbhtNo(pbhtNo);
				pbht.setInstNo(instNo);
				
				pbht.setInstAdres(checkAdres);
				pbht.setInstNm(instNm);
				pbht.setInstTelno(instCall);
				
				inst.setInstNo(instNo);
				inst.setInstCode("C102");
				inst.setChildNo(pbhtNo);
				inst.setInstNm(instNm);
				inst.setInstTelno(instCall);
				inst.setInstAdres(checkAdres);
				
				String mberNo = mberService.getMberSeq();
				String mberId = changeAdres+instNm.replaceAll(" ", "");
				String instTelno = instCall;
				String mberPwd=instTelno.replaceAll("-", "");
				
				mber.setMberNo(mberNo);
				mber.setInstNo(instNo);
				mber.setMberCode("B122");
				mber.setMberId(mberId);
				mber.setMberPwd(mberPwd);
				mber.setMberTelno(instTelno);
				mber.setMberNm(instNm);
				mber.setMberAdres(checkAdres);
				
				pbhtService.registPbht(pbht);
				adminService.registInst(inst);
				mberService.registMberRepresent(mber);
				break;
	
			case "병원":
				String cityNoHspt = hsptService.getHsptCityNo(changeAdres);
				int hsptSeq = hsptService.getHsptSeqNo();
				int instSeqHspt = hsptService.getInstSeqNo();
				String hsptNo = "HSPT"+cityNoHspt+hsptSeq;
				String instNoHspt = "INST"+"03"+instSeqHspt;
				
				hspt.setCityNo(cityNoHspt);
				hspt.setHsptNo(hsptNo);
				hspt.setInstNo(instNoHspt);
				
				hspt.setInstAdres(checkAdres);
				hspt.setInstNm(instNm);
				hspt.setInstTelno(instCall);
				
				inst.setInstNo(instNoHspt);
				inst.setInstCode("C103");
				inst.setChildNo(hsptNo);
				inst.setInstNm(instNm);
				inst.setInstTelno(instCall);
				inst.setInstAdres(checkAdres);
				
				String mberNoHspt = mberService.getMberSeq();
				String mberIdHspt = changeAdres+instNm.replaceAll(" ", "");
				String instTelnoHspt = instCall;
				String mberPwdHspt = instTelnoHspt.replaceAll("-", "");
				
				mber.setMberNo(mberNoHspt);
				mber.setInstNo(instNoHspt);
				mber.setMberCode("B123");
				mber.setMberId(mberIdHspt);
				mber.setMberPwd(mberPwdHspt);
				mber.setMberTelno(instTelnoHspt);
				mber.setMberNm(instNm);
				mber.setMberAdres(checkAdres);
				
				hsptService.registHspt(hspt);
				hsptService.registInst(inst);
				mberService.registMberRepresent(mber);
				
				break;
				
			case "생활치료센터":
				String cityNoLtct = ltctService.getLtctCityNo(changeAdres);
				int ltctSeq = ltctService.getLtctSeqNo();
				int instSeqLtct = hsptService.getInstSeqNo();
				String ltctNo = "LTCT"+cityNoLtct+ltctSeq;
				String instNoLtct = "INST"+"04"+instSeqLtct;
				
				ltct.setCityNo(cityNoLtct);
				ltct.setLtctNo(ltctNo);
				ltct.setInstNo(instNoLtct);
				
				
				ltct.setInstAdres(checkAdres);
				ltct.setInstNm(instNm);
				ltct.setInstTelno(instCall);
				
				inst.setInstNo(instNoLtct);
				inst.setInstCode("C104");
				inst.setChildNo(ltctNo);
				inst.setInstNm(instNm);
				inst.setInstTelno(instCall);
				inst.setInstAdres(checkAdres);
				
				String mberNoLtct = mberService.getMberSeq();
				String mberIdLtct = changeAdres+instNm.replaceAll(" ", "");
				String instTelnoLtct = instCall;
				String mberPwdLtct = instTelnoLtct.replaceAll("-", "");
				
				mber.setMberNo(mberNoLtct);
				mber.setInstNo(instNoLtct);
				mber.setMberCode("B124");
				mber.setMberId(mberIdLtct);
				mber.setMberPwd(mberPwdLtct);
				mber.setMberTelno(instTelnoLtct);
				mber.setMberNm(instNm);
				mber.setMberAdres(checkAdres);
				
				ltctService.registLtct(ltct);
				ltctService.registInst(inst);
				mberService.registMberRepresent(mber);
				
				
				
				break;	
			}
		}catch(Exception e) {
			e.printStackTrace();
			url="admin/inst-registFail";
		}
		return url;
	}


	private List<Map<String, String>> instList;
	@RequestMapping(value="/inst-fileRegist", method=RequestMethod.POST)
	public String insttRegist(instRegistCommand registCommand)throws Exception{
		String url="admin/inst-registSuccess";
		String writer=registCommand.getWriter();
		String instName = registCommand.getInst();
		String fileName =registCommand.getFileName();

		
		//확장자확인
		String extension = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
		
		String filePath = instPath+fileName;
		
		File file = new File(filePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		MultipartFile instFile = registCommand.getInstFile();
		
		instFile.transferTo(file);
		
		if(extension.equals("xlsx")) {
			instList =new registFileResolver().registInstXlsxFile(filePath);
		}
		if(extension.equals("xls")) {
			instList =new registFileResolver().registInstXlsFile(filePath);
		}
		try {
		switch (instName) {
			case "검사소":
				for(int i=0; i<instList.size(); i++) {
					InspVO insp = new InspVO();
					InstVO inst = new InstVO();
					MberVO mber = new MberVO();
					Map<String, String> needDataMap = instList.get(i);
					String city = needDataMap.get("city");
					String cityNo = inspService.getInspCityNo(city);
					String responsibleAgency = needDataMap.get("responsibleAgency");
					String pbhtNo = inspService.getResponsibleAgency(responsibleAgency);
					
					String inspSeqNo = inspService.getInspSeqNo();
					String instSeqNo = inspService.getInstSeqNo();
					String instNo = "INST" + "01" + instSeqNo;
					String inspNo = "INSP"+cityNo+inspSeqNo;
					
					insp.setPbhtNo(pbhtNo);
					insp.setCityNo(cityNo);
					insp.setInspNo(inspNo);
					insp.setInstAdres(needDataMap.get("instAdres"));
					insp.setInstNm(needDataMap.get("instNm"));
					insp.setInstNo(instNo);
					insp.setInstTelno(needDataMap.get("instTelNo"));
					insp.setInstCode("C101");
					
					inst.setInstNo(instNo);
					inst.setInstCode("C101");
					inst.setChildNo(inspNo);
					inst.setInstNm(needDataMap.get("instNm"));
					inst.setInstTelno(needDataMap.get("instTelNo"));
					inst.setInstAdres(needDataMap.get("instAdres"));
					
					String mberNo = mberService.getMberSeq();
					String mberId = city+ needDataMap.get("instNm").replaceAll(" ", "");
					String instTelno = needDataMap.get("instTelNo");
					String mberPwd=instTelno.replaceAll("-", "");
					mber.setMberNo(mberNo);
					mber.setInstNo(instNo);
					mber.setMberCode("B121");
					mber.setMberId(mberId);
					mber.setMberPwd(mberPwd);
					mber.setMberTelno(needDataMap.get("instTelNo"));
					mber.setMberNm(needDataMap.get("instNm"));
					mber.setMberAdres(needDataMap.get("instAdres"));
					
					inspService.registInsp(insp);
					adminService.registInst(inst);
					mberService.registMberRepresent(mber);
					
				}
				break;
	
			case "보건소":
				for(int i=0; i<instList.size(); i++) {
					PbhtVO pbht = new PbhtVO();
					InstVO inst = new InstVO();
					MberVO mber = new MberVO();
					Map<String, String> needDataMap = instList.get(i);
					String city = needDataMap.get("city");
					String cityNo = pbhtService.getPbhtCityNo(city);
					int pbhtSeq = pbhtService.getPbhtSeqNo();
					int instSeq = pbhtService.getInstSeqNo();
					String pbhtNo = "PBHT"+cityNo+pbhtSeq;
					String instNo = "INST"+"02"+instSeq;
					
					pbht.setCityNo(cityNo);
					pbht.setPbhtNo(pbhtNo);
					pbht.setInstNo(instNo);
					pbht.setInstAdres(needDataMap.get("instAdres"));
					pbht.setInstNm(needDataMap.get("instNm"));
					pbht.setInstTelno(needDataMap.get("instTelNo"));
					
					inst.setInstNo(instNo);
					inst.setInstCode("C102");
					inst.setChildNo(pbhtNo);
					inst.setInstNm(needDataMap.get("instNm"));
					inst.setInstTelno(needDataMap.get("instTelNo"));
					inst.setInstAdres(needDataMap.get("instAdres"));
					
					String mberNo = mberService.getMberSeq();
					String mberId = city+needDataMap.get("instNm").replaceAll(" ", "");
					String instTelno = needDataMap.get("instTelNo");
					String mberPwd=instTelno.replaceAll("-", "");
					mber.setMberNo(mberNo);
					mber.setInstNo(instNo);
					mber.setMberCode("B122");
					mber.setMberId(mberId);
					mber.setMberPwd(mberPwd);
					mber.setMberTelno(needDataMap.get("instTelNo"));
					mber.setMberNm(needDataMap.get("instNm"));
					mber.setMberAdres(needDataMap.get("instAdres"));
					
					pbhtService.registPbht(pbht);
					adminService.registInst(inst);
					mberService.registMberRepresent(mber);
				}
				break;
			
			
			case "병원":
				for(int i=0; i<instList.size(); i++) {
					HsptVO hspt = new HsptVO();
					MberVO mber = new MberVO();
					InstVO inst = new InstVO();
					Map<String, String> needDataMap = instList.get(i);
					String city = needDataMap.get("city");
					String cityNo = hsptService.getHsptCityNo(needDataMap.get("city"));
					int hsptSeq = hsptService.getHsptSeqNo();
					int instSeq = hsptService.getInstSeqNo();
					String hsptNo = "HSPT"+cityNo+hsptSeq;
					String instNo = "INST"+"03"+instSeq;
					hspt.setCityNo(cityNo);
					hspt.setHsptNo(hsptNo);
					hspt.setInstNo(instNo);
					hspt.setInstAdres(needDataMap.get("instAdres"));
					hspt.setInstNm(needDataMap.get("instNm"));
					hspt.setInstTelno(needDataMap.get("instTelNo"));
					
					inst.setInstNo(instNo);
					inst.setInstCode("C103");
					inst.setChildNo(hsptNo);
					inst.setInstNm(needDataMap.get("instNm"));
					inst.setInstTelno(needDataMap.get("instTelNo"));
					inst.setInstAdres(needDataMap.get("instAdres"));
					
					String mberNo = mberService.getMberSeq();
					String mberId = city+ needDataMap.get("instNm").replaceAll(" ", "");
					String instTelno = needDataMap.get("instTelNo");
					String mberPwd=instTelno.replaceAll("-", "");
					mber.setMberNo(mberNo);
					mber.setInstNo(instNo);
					mber.setMberCode("B123");
					mber.setMberId(mberId);
					mber.setMberPwd(mberPwd);
					mber.setMberTelno(needDataMap.get("instTelNo"));
					mber.setMberNm(needDataMap.get("instNm"));
					mber.setMberAdres(needDataMap.get("instAdres"));
					
					hsptService.registHspt(hspt);
					adminService.registInst(inst);
					mberService.registMberRepresent(mber);
				}
				
				break;
			
			case "생활치료센터":
				for(int i=0; i<instList.size(); i++) {
					LtctVO ltct = new LtctVO();
					MberVO mber = new MberVO();
					InstVO inst = new InstVO();
					
					Map<String, String> needDataMap = instList.get(i);
					String city = needDataMap.get("city");
					String cityNo = ltctService.getLtctCityNo(needDataMap.get("city"));
					int ltctSeq = ltctService.getLtctSeqNo();
					int instSeq = ltctService.getInstSeqNo();
					String ltctNo = "LTCT"+cityNo+ltctSeq;
					String instNo = "INST"+"04"+instSeq;
					ltct.setCityNo(cityNo);
					ltct.setLtctNo(ltctNo);
					ltct.setInstNo(instNo);
					ltct.setInstAdres(needDataMap.get("instAdres"));
					ltct.setInstNm(needDataMap.get("instNm"));
					ltct.setInstTelno(needDataMap.get("instTelNo"));
					
					inst.setInstNo(instNo);
					inst.setInstCode("C104");
					inst.setChildNo(ltctNo);
					inst.setInstNm(needDataMap.get("instNm"));
					inst.setInstTelno(needDataMap.get("instTelNo"));
					inst.setInstAdres(needDataMap.get("instAdres"));
					
					String mberNo = mberService.getMberSeq();
					String mberId = city + needDataMap.get("instNm").replaceAll(" ", "");
					String instTelno = needDataMap.get("instTelNo");
					String mberPwd=instTelno.replaceAll("-", "");
					mber.setMberNo(mberNo);
					mber.setInstNo(instNo);
					mber.setMberCode("B124");
					mber.setMberId(mberId);
					mber.setMberPwd(mberPwd);
					mber.setMberTelno(needDataMap.get("instTelNo"));
					mber.setMberNm(needDataMap.get("instNm"));
					mber.setMberAdres(needDataMap.get("instAdres"));
					
					ltctService.registLtct(ltct);
					adminService.registInst(inst);
					
					mberService.registMberRepresent(mber);
				}
				break;
			}
		}catch(Exception e) {
			e.printStackTrace();
			url="admin/inst-registFail";
		}
		return url;
	}
	
	@RequestMapping("/inst-detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> instDetail(@RequestParam("instNo") String instNo) {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> instMap = new HashMap<String, Object>();
		try {
			instMap = adminService.getAllInstDetail(instNo);
			entity = new ResponseEntity<Map<String,Object>>(instMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping("/inst-modifyForm")
	public ModelAndView instModifyForm(String instNo, ModelAndView mnv) throws Exception{
		InstVO inst = adminService.getInstDetail(instNo);
		String url="admin/inst-modifyForm";
		
		mnv.addObject("inst", inst);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/inst-modify")
	public String instModify(InstVO inst) throws Exception{
		String url="admin/inst-modifySuccess";
		
		int result = adminService.modifyInst(inst);
		
		if(result<1) {
			url="admin/inst-modifyFail";
		}
		
		return url;
	}
	
	@RequestMapping("/inst-remove")
	public String instRemove(String[] deleteValues) throws Exception{
		String url="admin/instRemoveSuccess";
		for(int i=0; i<deleteValues.length; i++) {
			String instNo = deleteValues[i];
			String childNo = adminService.getChildNoByInstNo(instNo);
			String checkInst = childNo.substring(0, 4);
			
			switch (checkInst) {
			
			case "INSP":
				String pstiNo = adminService.getPstiNoByInspNo(childNo);
				if(pstiNo != null) {
					adminService.removeHtscByPstiNo(pstiNo);
					adminService.removePstiByInspNo(childNo);
				}
				
				adminService.removeInspEmpByInspNo(childNo);
				adminService.removeMemberByInstNo(instNo);
				adminService.removeInspStatsByInspNo(childNo);
				
				adminService.removeInspByInspNo(childNo);
				adminService.removeInstByInstNo(instNo);
				break;
				
			case "PBHT":
				List<String> inspNoByPbhtNoList = adminService.getInspNoByPbhtNo(childNo);
				
				for(int j=0; j<inspNoByPbhtNoList.size(); j++) {
					String instNoByInspNo = adminService.getInstNoByInspNo(inspNoByPbhtNoList.get(j));
					
					String pstiNoPB = adminService.getPstiNoByInspNo(inspNoByPbhtNoList.get(j));
					if(pstiNoPB != null) {
						adminService.removeHtscByPstiNo(pstiNoPB);
						adminService.removePstiByInspNo(inspNoByPbhtNoList.get(j));
					}
					
					adminService.removeInspEmpByInspNo(inspNoByPbhtNoList.get(j));
					adminService.removeMemberByInstNo(instNoByInspNo);
					adminService.removeInspStatsByInspNo(inspNoByPbhtNoList.get(j));
					adminService.removeInspByInspNo(inspNoByPbhtNoList.get(j));
					adminService.removeInstByInstNo(instNoByInspNo);
					
				}
				
				adminService.removePbhtEmp(childNo);
				adminService.removeSlfptntByPbhtNo(childNo);
				adminService.removeCnfmByPbhtNo(childNo);
				adminService.removeSmplByPbhtNo(childNo);
				adminService.removeMemberByInstNo(instNo);
				adminService.removePbhtStatsByPbhtNo(childNo);
				adminService.removePbhtByPbhtNo(childNo);
				adminService.removeInstByInstNo(instNo);
				break;
				
			case "HSPT":
				adminService.removeHsptEmpByHsptNo(childNo);
				adminService.removeInptntByHsptNo(childNo);
				adminService.removeDgnssByHsptNo(childNo);
				adminService.removeHsptStatsByHsptNo(childNo);
				
				adminService.removeMemberByInstNo(instNo);
				adminService.removeHsptByHsptNo(childNo);
				adminService.removeInstByInstNo(instNo);
				
				break;
			case "LTCT":
				adminService.removeIsoptntByLtctNo(childNo);
				adminService.removeLtctEmpByLtctNo(childNo);
				adminService.removeLtctStatsByLtctNo(childNo);
				
				adminService.removeMemberByInstNo(instNo);
				adminService.removeLtctByLtctNo(childNo);
				adminService.removeInstByInstNo(instNo);
				break;
			}
		}
		return url;
	}
	
	@RequestMapping(value="eachInst-remove", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> eachInstRemove(@RequestBody HashMap<String, Object>[] instNoMap,
															 HttpServletResponse response)throws Exception{
		
		ResponseEntity<Map<String, String>> entity = null;
		
		Map<String, String> msg = new HashMap<String, String>();
		
		String result ="삭제되었습니다.";
		
		
		for(HashMap<String, Object> test : instNoMap) {
			for(Map.Entry<String, Object> entry : test.entrySet()) {
				String instNo = (String) entry.getValue();
				if(!instNo.equals("on")) {
					
				String childNo = adminService.getChildNoByInstNo(instNo);
				String checkInst = childNo.substring(0, 4);
				
				switch (checkInst) {
				case "INSP":
					try {
						String pstiNo = adminService.getPstiNoByInspNo(childNo);
						if(pstiNo != null) {
							adminService.removeHtscByPstiNo(pstiNo);
							adminService.removePstiByInspNo(childNo);
						}
						
						adminService.removeInspEmpByInspNo(childNo);
						adminService.removeMemberByInstNo(instNo);
						adminService.removeInspStatsByInspNo(childNo);
						
						adminService.removeInspByInspNo(childNo);
						adminService.removeInstByInstNo(instNo);
						
						msg.put("msg", result);
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.OK);
					}catch(Exception e){
						msg.put("msg", "삭제 실패했습니다.");
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.INTERNAL_SERVER_ERROR);
						
					}
					
					break;
				
				case "PBHT":
					
					List<String> inspNoByPbhtNoList = adminService.getInspNoByPbhtNo(childNo);
					try {
						for(int i=0; i<inspNoByPbhtNoList.size(); i++) {
							String instNoByInspNo = adminService.getInstNoByInspNo(inspNoByPbhtNoList.get(i));
							
							String pstiNoPB = adminService.getPstiNoByInspNo(inspNoByPbhtNoList.get(i));
							if(pstiNoPB != null) {
								adminService.removeHtscByPstiNo(pstiNoPB);
								adminService.removePstiByInspNo(inspNoByPbhtNoList.get(i));
							}
							
							adminService.removeInspEmpByInspNo(inspNoByPbhtNoList.get(i));
							adminService.removeMemberByInstNo(instNoByInspNo);
							adminService.removeInspStatsByInspNo(inspNoByPbhtNoList.get(i));
							adminService.removeInspByInspNo(inspNoByPbhtNoList.get(i));
							adminService.removeInstByInstNo(instNoByInspNo);
							
						}
						
						adminService.removePbhtEmp(childNo);
						adminService.removeSlfptntByPbhtNo(childNo);
						adminService.removeCnfmByPbhtNo(childNo);
						adminService.removeSmplByPbhtNo(childNo);
						adminService.removeMemberByInstNo(instNo);
						adminService.removePbhtStatsByPbhtNo(childNo);
						adminService.removePbhtByPbhtNo(childNo);
						adminService.removeInstByInstNo(instNo);
						
						msg.put("msg", result);
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.OK);
						
					}catch(Exception e) {
						msg.put("msg", "삭제 실패했습니다.");
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.INTERNAL_SERVER_ERROR);
					}
					
					
					break;
				case "HSPT":
					try {
						adminService.removeHsptEmpByHsptNo(childNo);
						adminService.removeInptntByHsptNo(childNo);
						adminService.removeDgnssByHsptNo(childNo);
						adminService.removeHsptStatsByHsptNo(childNo);
						
					    adminService.removeMemberByInstNo(instNo);
						adminService.removeHsptByHsptNo(childNo);
						adminService.removeInstByInstNo(instNo);
						
						msg.put("msg", result);
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.OK);
						
					}catch(Exception e) {
						msg.put("msg", "삭제 실패했습니다.");
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.INTERNAL_SERVER_ERROR);
					}
					
					
					break;
				case "LTCT":
					try {
						adminService.removeIsoptntByLtctNo(childNo);
						adminService.removeLtctEmpByLtctNo(childNo);
						adminService.removeLtctStatsByLtctNo(childNo);
						
						adminService.removeMemberByInstNo(instNo);
						adminService.removeLtctByLtctNo(childNo);
						adminService.removeInstByInstNo(instNo);
						
						msg.put("msg", result);
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.OK);
					}catch(Exception e) {
						msg.put("msg", "삭제 실패했습니다.");
						entity = new ResponseEntity<Map<String,String>>(msg,HttpStatus.INTERNAL_SERVER_ERROR);
					}
					break;
				}
			}
			
			}
		}
		
		return entity;
	}
	
	@RequestMapping(value="/passwordReset", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, String>> passwordReset(String mberNo, HttpServletResponse response) throws Exception{
		String result ="비밀번호가 초기화 되었습니다.";
		ResponseEntity<Map<String, String>> entity = null;
		Map<String, String> msg = new HashMap<String, String>();
		String instNo = adminService.getInstNoByMberNo(mberNo);
		String instTelnofir = adminService.getInstTelNoByInstNo(instNo);
		
		String instTelno = instTelnofir.replaceAll("-", "");
		
		MberVO mber = new MberVO();
		mber.setMberNo(mberNo);
		mber.setMberPwd(instTelno);
		
		int check = adminService.modifyPasswordMber(mber);
		msg.put("msg", result);
		entity = new ResponseEntity<Map<String, String>>(msg,HttpStatus.OK);
		if(check<1) {
			result="수정 실패했습니다.";
			entity = new ResponseEntity<Map<String, String>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/inspDataBackup")
	public String inspDataBackup(Model model) throws Exception{
		String url="downloadInspFile";
		List<InspVO> inspBackupList = inspService.getInspListBackup();
		model.addAttribute("inspBackupList", inspBackupList);
		return url;
	}
	
	@RequestMapping("/pbhtDataBackup")
	public String pbhtDataBackup(Model model) throws Exception{
		String url="downloadPbhtFile";
		List<PbhtVO> pbhtBackupList = pbhtService.getPbhtBackList();
		model.addAttribute("pbhtBackupList", pbhtBackupList);
		return url;
	}
	
	@RequestMapping("/hsptDataBackup")
	public String hsptDataBackup(Model model) throws Exception{
		String url="downloadHsptFile";
		List<HsptVO> hsptBackupList = hsptService.getHsptBackupList();
		model.addAttribute("hsptBackupList", hsptBackupList);
		return url;
	}
	
	@RequestMapping("/ltctDataBackup")
	public String ltctDataBackup(Model model) throws Exception{
		String url="downloadLtctFile";
		List<LtctVO> ltctBackupList = ltctService.getLtctBackupList();
		model.addAttribute("ltctBackupList", ltctBackupList);
		return url;
	}
	
	@RequestMapping("/pstiDataBackup")
	public String pstiDataBackup(Model model) throws Exception{
		String url="downloadPstiFile";
		
		List<PstiVO> pstiBackupList = adminService.getPstiBackupList();
		
		model.addAttribute("pstiBackupList", pstiBackupList);
		return url;
	}
	
	@RequestMapping("/sampleInspFile")
	public String sampleInstFile(Model model) throws Exception{
		String url="downloadSampleInspFile";
		
		return url;
	}
	@RequestMapping("/samplePbhtFile")
	public String samplePbhtFile(Model model) throws Exception{
		String url="downloadSamplePbhtFile";
		
		return url;
	}
	@RequestMapping("/sampleHsptFile")
	public String sampleHsptFile(Model model) throws Exception{
		String url="downloadSampleHsptFile";
		
		return url;
	}
	@RequestMapping("/sampleLtctFile")
	public String sampleLtctFile(Model model) throws Exception{
		String url="downloadSampleLtctFile";
		
		return url;
	}


}
