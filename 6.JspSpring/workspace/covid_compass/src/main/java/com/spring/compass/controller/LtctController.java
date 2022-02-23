package com.spring.compass.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.spring.compass.command.DgnssHsptVO;
import com.spring.compass.command.LtctIsoptntHighTempCardListVO;
import com.spring.compass.command.LtctSckbdCountAndStats;
import com.spring.compass.command.MberCommand;
import com.spring.compass.command.NoticeModifyCommand;
import com.spring.compass.command.NoticeRegistCommand;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.MberService;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.util.MakeStatisticsLogByLtct;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.LtctBasicDetailVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;

@Controller
@RequestMapping("/ltct")
public class LtctController {

	@Autowired
	private LtctService ltctService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MberService mberService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Resource(name="noticeFilePath")
	private String noticeFilePath;
	
	@RequestMapping(value="/mberDelete", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/mberRegist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> mberRegist(MberCommand data, HttpSession session) throws Exception{
		ResponseEntity<Integer> entity = null;
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String instNm = ltct.getInstNm();
		
		MberVO mber = data.mber();
		
		mber.setInstNm(instNm);
		
		try {
			int result = mberService.registMber(mber);
			
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
		
	}
	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session, ModelAndView mnv) throws Exception{
		String url="ltct/main";
		List<NoticeVO> popupList = adminService.getPopupNoticeList();
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		List<LtctIsoptntHighTempCardListVO> highTempCardList = null;
		try {
			highTempCardList = ltctService.getIsoptntHighTempCardList(ltct.getLtctNo());
			if(!highTempCardList.isEmpty()) {
				mnv.addObject("highTempCardList", highTempCardList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(popupList.size()>0) {
			mnv.addObject("popupCheck", "YES");
			mnv.addObject("popupList", popupList);
		}
		if(popupList.size()<1) {
			mnv.addObject("popupCheck", "NO");
		}
//		mnv.addObject("popupList", popupList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/main-sckbd-detail")
	public ModelAndView mainResDetail(String manageNo, ModelAndView mnv) {
		String url = "ltct/main-sckbd-detail-module-work";
		LtctBasicDetailVO sckbdreq = null;
		try {
			sckbdreq = ltctService.getBasicDetail(manageNo);
			LtctBasicDetailVO sckbdreqYmd = ltctService.getSckbdreqYmd(manageNo);
			Date isoptntInYmd = ltctService.getLtctInYmdByManageNo(manageNo);
			DgnssHsptVO hspt = ltctService.getHsptDetail(sckbdreqYmd.getHsptNo());
			sckbdreq.setSckbdreqYmd(sckbdreqYmd.getSckbdreqYmd());
			sckbdreq.setHsptNo(sckbdreqYmd.getHsptNo());
			sckbdreq.setInstNm(hspt.getInstNm());
			sckbdreq.setIsoptntInYmd(isoptntInYmd);
			if(sckbdreqYmd.getResYmd() != null) sckbdreq.setResYmd(sckbdreqYmd.getResYmd());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mnv.addObject("sckbdreq", sckbdreq);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/isoptnt-list")
	public ModelAndView isopntList(HttpSession session, ModelAndView mnv) {
		String url="ltct/isoptnt-list";
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String areaNo = ltct.getAreaNo();
		
		try {
			List<PbhtVO> pbhtList = ltctService.getPbhtListByAreaNo(areaNo);
			mnv.addObject("pbhtList", pbhtList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/isoptnt-detail")
	public String isopntDetail() {
		String url="ltct/isoptnt-detail";
		return url;
	}
	
	@RequestMapping(value="/res-smple-list")
	public String resSmpleList() {
		String url="ltct/res-smple-list";
		
		return url;
	}
	@RequestMapping(value="/req-isoptnt-list")
	public String reqIsoptntList() {
		String url="ltct/req-isoptnt-list";
		
		return url;
	}
	
	@RequestMapping(value="/statistics")
	public String ltctStatistics() {
		String url="ltct/statistics";
		
		return url;
	}
	@RequestMapping("/notice-list")
	public ModelAndView noticeList(HttpServletRequest request,
						  @RequestParam(defaultValue="1") int page,
						  @RequestParam(defaultValue="15") int perPageNum,
						  @RequestParam(defaultValue="") String searchType,
						  @RequestParam(defaultValue="") String keyword,
						  ModelAndView mnv) throws Exception {
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		String url ="ltct/notice-list";
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
	
	@RequestMapping("/notice-popup")
	public ModelAndView notice_popup(String noticeNo, ModelAndView mnv) throws Exception{
		String url = "insp/notice-popup";
		
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
	public String noticeRegistform() {
		String url="ltct/notice-registForm";
		
		return url;
	}
	
	@RequestMapping("/notice-regist")
	public String noticeRegist(HttpServletRequest req, NoticeRegistCommand noticeCommand) throws Exception{
		String url="ltct/notice-registSuccess";
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
		if(resultNotice<1) url="ltct/notice-registFail";
		
		if(noticeFile.getOriginalFilename().length()>1) {
			String fileName = FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			String attachNo = adminService.getAttachSeq();
			attach.setAtchNo(attachNo);
			attach.setUploadPath(noticeFilePath);
			attach.setFileName(fileName);
			attach.setNoticeNo(noticeNo);
			attach.setMberNo(mberNo);
			int resultAttach = adminService.registAttach(attach);
			if(resultAttach<1) url="ltct/notice-registFail";
		}
		
		return url;
	}
	
	@RequestMapping("/notice-detail")
	public ModelAndView admin_detail(String noticeNo, ModelAndView mnv) throws Exception{
		String url = "ltct/notice-detail";
		
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
		String url="ltct/notice-modifyForm";
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
		String url="ltct/notice-modifySuccess";
		HttpSession session = req.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		String mberNo = mber.getMberNo();
		NoticeVO notice = noticeModifyCommand.toNoticeVo(mberNo);
		String writerMberNo = notice.getMberNo();
		if(!(mberNo.equals(writerMberNo))) {
			url="ltct/notice-inconsistent";
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
		String url="ltct/noticeRemoveSuccess";
		HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		String mberNo = mber.getMberNo();
		String writerMberNo = notice.getMberNo();
		
		if(!(mberNo.equals(writerMberNo))) {
			url="ltct/notice-inconsistent";
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
	
	@RequestMapping(value="/emp-manage-list")
	public String empList() {
		String url="ltct/emp-manage-list";
		
		return url;
	}
	
	@RequestMapping(value="/emp-manage-registform")
	public ModelAndView empRegistForm(ModelAndView mnv, HttpSession session) {
		String url="ltct/emp-manage-registform";
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		
		mnv.addObject("ltct", ltct);
		mnv.addObject("mberCode", mber.getMberCode());
		mnv.setViewName(url);
		
		return mnv;
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
	
	@RequestMapping(value="/mypage-modifyform")
	public String mypageModifyForm() {
		String url="ltct/mypage-modifyform";
		
		return url;
	}
	@RequestMapping(value="/change-passwordForm")
	public String chanePasswordForm() {
		String url="ltct/change-passwordForm";
		
		return url;
	}
	@RequestMapping(value="/cnfrm-detail-dgnss-regist")
	public ModelAndView dgnssRegist(ModelAndView mnv, String manageNo, String pstiNm, HttpSession session) {
		String url="ltct/cnfrm-detail-dgnss-regist";
		
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("pstiNm", pstiNm);
		dataMap.put("ltctNo", ltct.getLtctNo());
		dataMap.put("manageNo", manageNo);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/cnfrm-dgnss-registgo")
	public ModelAndView dngssRegistGo(ModelAndView mnv, String manageNo, String hsptNo, HttpSession session) throws Exception{
		String url = "ltct/dgnss-regist-success";
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		Map<String, Object> reqData = new HashMap<String, Object>();
		
		reqData.put("manageNo", manageNo);
		reqData.put("hsptNo", hsptNo);
		reqData.put("ltctNo", ltct.getLtctNo());
		System.out.println("-----------------------------");
		System.out.println(manageNo);
		System.out.println(hsptNo);
		System.out.println(ltct.getLtctNo());
		int result = ltctService.setHsptDgnssRegist(reqData);
		System.out.println("펑-----------------------------------------");
		mnv.addObject(result);
		mnv.setViewName(url);
		
		MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsReqDgnss(ltct.getLtctNo());
		
		return mnv;
	}
	
	@RequestMapping(value="/sckbd-modify")
	public ModelAndView modify(ModelAndView mnv, HttpSession session) {
		String url = "ltct/sckbdcnt-modify";
		LtctVO ltct = (LtctVO) session.getAttribute("loginInst");
		String ltctNo = ltct.getLtctNo();
		try {
			LtctSckbdCountAndStats sckbdCountAndStats = ltctService.getSckbdCountAndStats(ltctNo);
			double sckbdCnt = (double) sckbdCountAndStats.getSckbdCnt();
			double rmndSckbdCnt = (double) sckbdCountAndStats.getRmndSckbdCnt();
			double opRate = 0;
			String color = "";
			if(ltct.getSckbdCnt() == 0) {
				opRate = 0;
			}else {
				opRate = Math.round((( sckbdCnt - rmndSckbdCnt) / sckbdCnt) * 100);
			}
			if(opRate > 80){
				color = "#dc3545";
			}else if(opRate > 60){
				color = "#ffc107";
			}else if(opRate > 40){
				color = "#28a745";
			}else{
				color = "#007bff";
			}
			sckbdCountAndStats.setOpRate(opRate);
			sckbdCountAndStats.setColor(color);
			mnv.addObject("sckbdCountAndStats", sckbdCountAndStats);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	@RequestMapping(value="/isoptnt-modify-cancel", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> pstiModifyCancel(String pstiNo, String manageNo) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			
			InspPstiVO psti = ltctService.getModifyCancel(pstiNo);
			int result = ltctService.getDgnssTodayByManageNo(manageNo);
			dataMap.put("psti", psti);
			dataMap.put("result", result);
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/isoptnt-modify", method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> isoptntModify(String pstiNm, String pregnYn, String pstiAdres, String pstiTelno, String pstiNo, String manageNo) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		InspPstiVO psti = new InspPstiVO();
		
		psti.setPstiNm(pstiNm);
		psti.setPregnYn(pregnYn);
		psti.setPstiTelno(pstiTelno);
		psti.setPstiAdres(pstiAdres);
		psti.setPstiNo(pstiNo);
		
		try {
			ltctService.modifyPstiInfo(psti);
			int result = ltctService.getDgnssTodayByManageNo(manageNo);
			dataMap.put("result", result);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
}
