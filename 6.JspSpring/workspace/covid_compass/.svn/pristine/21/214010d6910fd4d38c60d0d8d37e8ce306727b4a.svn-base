package com.spring.compass.controller;

import java.text.SimpleDateFormat;
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

import com.spring.compass.command.InspPstiSearchCommand;
import com.spring.compass.command.MberCommand;
import com.spring.compass.command.NoticeModifyCommand;
import com.spring.compass.command.NoticeRegistCommand;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.InspService;
import com.spring.compass.service.MberService;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.InspPstiVO;
import com.spring.compass.vo.InspStatsVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;

@Controller
@RequestMapping(value="/insp")
public class InspController {
	
	@Autowired
	private InspService inspService;
	
	@Autowired
	private MberService mberService;
	
	public void setInspService(InspService inspService) {
		this.inspService = inspService;
	}
	
	@Autowired
	private AdminService adminService;
	
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
		
		InspVO insp= (InspVO) session.getAttribute("loginInst");
		String instNm = insp.getInstNm();
		
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
	
	
	@RequestMapping(value="/main")
	public ModelAndView main(ModelAndView mnv, HttpSession session) throws Exception {
		String url = "insp/main";
		List<NoticeVO> popupList = adminService.getPopupNoticeList();
		System.out.println("popupListSize: "+popupList.size());
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		String inspNo = insp.getInspNo();
		try {
			List<InspStatsVO> statsList = inspService.getInspStatsByInspNo(inspNo);
			if(!statsList.isEmpty()) mnv.addObject("statsList", statsList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(popupList.size()>0) {
			mnv.addObject("popupCheck", "YES");
			mnv.addObject("popupList", popupList);
		}
		if(popupList.size()==0) {
			mnv.addObject("popupCheck", "NO");
		}
//		mnv.addObject("popupList", popupList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/psti-modify-cancel", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<InspPstiVO> pstiModifyCancel(String pstiNo) throws Exception{
		ResponseEntity<InspPstiVO> entity = null;
		
		try {
			InspPstiVO psti = inspService.getModifyCancel(pstiNo);
			entity = new ResponseEntity<InspPstiVO>(psti, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<InspPstiVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/psti-modify", method= RequestMethod.POST)
	public void pstiModify(String pstiNm, String pstiTelno, String pstiAdres, String pregnYn, String pstiNo, ModelAndView model) {
		InspPstiVO psti = new InspPstiVO();
		psti.setPstiNm(pstiNm);
		psti.setPstiAdres(pstiAdres);
		psti.setPstiTelno(pstiTelno);
		psti.setPregnYn(pregnYn);
		psti.setPstiNo(pstiNo);
		try {
			inspService.modifyPstiInfo(psti);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="psti-list")
	public void pstiList() {}

	@RequestMapping(value="/chckd-psti-list")
	public void chckdPstiList() {}

	@RequestMapping(value="/res-psti-list")
	public void resPstiList() {}
	
//	@RequestMapping(value="/psti-regist-form")
//	public ModelAndView pstiRegistform(String pstiNo, ModelAndView model) {
//		String url = "insp/psti-regist-form";
//		model.setViewName(url);
//		return model;
//	}

	@RequestMapping("/pcrKitForm")
	public ModelAndView pcrKitForm(@RequestParam(defaultValue="1")int page,
									@RequestParam(defaultValue="5")int perPageNum,
									HttpSession session, ModelAndView model) {
		String url = "insp/pcrKitForm";
		InspPstiSearchCommand cri = new InspPstiSearchCommand(page, perPageNum);
		InspVO insp = (InspVO)(session.getAttribute("loginInst"));;
		String inspNo = insp.getInspNo();
		cri.setInspNo(inspNo);
		try {
			int kitCount = inspService.getPcrKitCount(inspNo);
			Map<String, Object> dataMap = inspService.getPcrKitList(cri);
			int totalKitCount = inspService.getTotalKitCount(inspNo);
			double useper = 0;
			if(kitCount > 0 && totalKitCount > 0) {
				useper = (((double)totalKitCount - (double)kitCount)/ (double)totalKitCount) * 100;
			}else {
				useper = 0;
			}
			int usekit = 0;
			if(kitCount > 0 && totalKitCount > 0) {
				usekit = totalKitCount - kitCount;
			}else {
				usekit = 0;
			}
			model.addObject("kitCount", kitCount);
			model.addObject("dataMap", dataMap);
			model.addObject("totalKitCount", totalKitCount);
			model.addObject("usekit", usekit);
			model.addObject("useper", useper);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.setViewName(url);
		return model;
	}

	@RequestMapping(value="/qrpage")
	public ModelAndView qrcode(HttpSession session, ModelAndView mnv) {
		
		String url = "insp/qrcode";
		
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		
		mnv.setViewName(url);
		mnv.addObject("insp", insp);
		
		return mnv;
	}

	@RequestMapping("/emp-manage-list")
	public void empManageList(){}

	@RequestMapping("/main-psti-regist-form")
	public ModelAndView pstiRegist(String pstiNo, ModelAndView model) {
		String url = "insp/main-psti-regist-form";
		InspPstiVO psti = null;
		try {
			psti = inspService.getPstiDetail(pstiNo);
			String pstiRechckd = psti.getRechkdYn();
			if(pstiRechckd.equals("Y")) {
				psti.setRechkdYn("자가격리");
			}else {
				psti.setRechkdYn("본인판단");
			}
			String pstiGender = psti.getGender();
			if(pstiGender.equals("M")) {
				psti.setGender("남");
			}else {
				psti.setGender("여");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addObject("psti", psti);
		model.setViewName(url);
		return model;
	}

	@RequestMapping("/emp-manage-registform")
	public ModelAndView empManageRegistform(ModelAndView mnv, HttpSession session){
		String url = "insp/emp-manage-registform";
		
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		
		mnv.addObject("insp", insp);
		mnv.addObject("mberCode", mber.getMberCode());
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/dataTableSample")
	public void dataTableSample(){}

	@RequestMapping("/datatable-psti-list")
	public void datatablePstiList(){}

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

	@RequestMapping("/mypage-modifyform")
	public void mypageModifyform() {}
	
	
	@RequestMapping("/notice-list")
	public ModelAndView noticeList(HttpServletRequest request,
						  @RequestParam(defaultValue="1") int page,
						  @RequestParam(defaultValue="15") int perPageNum,
						  @RequestParam(defaultValue="") String searchType,
						  @RequestParam(defaultValue="") String keyword,
						  ModelAndView mnv) throws Exception {
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		String url ="insp/notice-list";
		//HttpSession session = request.getSession();
		/*MberVO mber = (MberVO) session.getAttribute("loginUser");
		
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
		String url="insp/notice-registForm";
		
		return url;
	}
	
	@RequestMapping("/notice-regist")
	public String noticeRegist(HttpServletRequest req, NoticeRegistCommand noticeCommand) throws Exception{
		String url="admin/notice-registSuccess";
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
		if(resultNotice<1) url="admin/notice-registFail";
		
		if(noticeFile.getOriginalFilename().length()>1) {
			String fileName = FileRegistUtil.fileRegist(noticeFile, noticeFilePath);
			String attachNo = adminService.getAttachSeq();
			attach.setAtchNo(attachNo);
			attach.setUploadPath(noticeFilePath);
			attach.setFileName(fileName);
			attach.setNoticeNo(noticeNo);
			attach.setMberNo(mberNo);
			int resultAttach = adminService.registAttach(attach);
			if(resultAttach<1) url="admin/notice-registFail";
		}
		
		return url;
	}
	
	@RequestMapping("/notice-detail")
	public ModelAndView admin_detail(String noticeNo, ModelAndView mnv) throws Exception{
		String url = "insp/notice-detail";
		
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
	

	@RequestMapping("/notice-modifyForm")
	public ModelAndView noticeModifyForm(String noticeNo, ModelAndView mnv) throws Exception {
		String url="insp/notice-modifyForm";
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
		String url="insp/notice-modifySuccess";
		HttpSession session = req.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		String mberNo = mber.getMberNo();
		NoticeVO notice = noticeModifyCommand.toNoticeVo(mberNo);
		String writerMberNo = notice.getMberNo();
		if(!(mberNo.equals(writerMberNo))) {
			url="insp/notice-inconsistent";
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
		String url="insp/noticeRemoveSuccess";
		HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		String mberNo = mber.getMberNo();
		String writerMberNo = notice.getMberNo();
		
		if(!(mberNo.equals(writerMberNo))) {
			url="insp/notice-inconsistent";
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
	
	@RequestMapping("/statistics")
	public void statistics() {}

	@RequestMapping("/qrPage")
	public ModelAndView qrPage(HttpSession session, ModelAndView mnv) throws Exception{
		
		String url = "insp/qrPage";
		
		InspVO insp = (InspVO) session.getAttribute("loginInst");
		
		mnv.addObject("insp", insp);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}


