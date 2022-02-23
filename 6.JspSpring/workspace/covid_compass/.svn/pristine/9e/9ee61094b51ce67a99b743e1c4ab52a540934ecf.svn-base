package com.spring.compass.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.compass.command.NoticeModifyCommand;
import com.spring.compass.command.NoticeRegistCommand;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.VPstiCommand;
import com.spring.compass.parse.TestParsingExelCovidData;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtService;
import com.spring.compass.service.PbhtServiceLMY;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.util.MakeComma;
import com.spring.compass.util.MakeFileName;
import com.spring.compass.util.MakeMillionCalc;
import com.spring.compass.util.MakeStatisticsLogByPbht;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.CovidStatsAgeVO;
import com.spring.compass.vo.DailyCovidVO;
import com.spring.compass.vo.InstVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.WholeCovidVO;

import net.nurigo.java_sdk.api.Message;

@Controller
@RequestMapping("/pbhlth")
public class PbhlthController {
	
private static final Logger LOGGER = LoggerFactory.getLogger(PbhlthController.class);
	
	private final static String APIKEY = "NCSAPXSIFKAYD8MM";
	private final static String APISECRET = "SPVLAXK5IDMRJEREVXRBTBWMXY8OVIER";

	@Autowired
	private PbhtServiceLMY pbhtServiceLMY;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PbhtService pbhtService;
	
	@Autowired
	private MberService mberService;
	
	@Autowired
	private TestParsingExelCovidData testParsingExcelCovidData;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@Resource(name="noticeFilePath")
	private String noticeFilePath;
	
	@Resource(name="mypageFilePath")
	private String mypageFilePath;
	
	@RequestMapping(value="main")
	public void main() {}
	
	@RequestMapping(value="smple-list")
	public String smpleList() {
		String url ="pbhlth/smple-list";
		
		return url;
	}
	@RequestMapping(value="smple-detail")
	public String smpleDetail() {
		String url ="pbhlth/smple-detail";
		
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
		String url ="pbhlth/notice-list";
		/*HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		
		String instNo = mber.getInstNo();
		cri.setInstNo(instNo);
		Map<String, Object> dataMap = adminService.getNoticeListByInstNo(cri);
		mnv.addObject("dataMap", dataMap);*/
		Map<String, Object> dataMap = adminService.getNoticeList(cri);
		mnv.addObject("keyword", keyword);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	@RequestMapping("/notice-registForm")
	public String noticeRegistform() {
		String url="pbhlth/notice-registForm";
		
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
		String url = "pbhlth/notice-detail";
		
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
		String url="pbhlth/notice-modifyForm";
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
		String url="pbhlth/notice-modifySuccess";
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
		String url="pbhlth/noticeRemoveSuccess";
		HttpSession session = request.getSession();
		MberVO mber = (MberVO) session.getAttribute("loginUser");
		NoticeVO notice = adminService.getNoticeByNoticeNo(noticeNo);
		String mberNo = mber.getMberNo();
		String writerMberNo = notice.getMberNo();
		
		if(!(mberNo.equals(writerMberNo))) {
			url="pbhlth/notice-inconsistent";
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
	
	@RequestMapping(value="emp-manage-list")
	public String empManageList() {
		String url = "pbhlth/emp-manage-list";
		
		return url;
	}
	
	@RequestMapping(value="cnfrm-list")
	public String crfrmList() {
		String url = "pbhlth/cnfrm-list";
		
		return url;
	}
	@RequestMapping(value="slfptnt-list")
	public String slfptntList() {
		String url = "pbhlth/slfptnt-list";
		
		return url;
	}
	
	@RequestMapping(value="statistics")
	public ModelAndView statistics(ModelAndView mnv, HttpSession session)throws Exception {
		String url ="pbhlth/statistics";
		
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		String pbhtNo = pbht.getPbhtNo();
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap = pbhtServiceLMY.getPbhtStats(pbhtNo);
		
		Map<String, Object> weekMap = (Map<String, Object>)dataMap.get("weekMap");
		List<String> weekList = (List<String>)dataMap.get("weekList");
		LOGGER.debug("weekMap is null : {}",weekMap == null);
		
		LOGGER.debug("weekList is null : {}",weekList == null);
		Map<String, Object> oneDayMap = (Map<String,Object>)weekMap.get(weekList.get(0));
		
		Map<String, Object> twoDayMap = (Map<String,Object>)weekMap.get(weekList.get(1));
		Map<String, Object> threeDayMap = (Map<String,Object>)weekMap.get(weekList.get(2));
		Map<String, Object> fourDayMap = (Map<String,Object>)weekMap.get(weekList.get(3));
		Map<String, Object> fiveDayMap = (Map<String,Object>)weekMap.get(weekList.get(4));
		Map<String, Object> sixDayMap = (Map<String,Object>)weekMap.get(weekList.get(5));
		Map<String, Object> sevenDayMap = (Map<String,Object>)weekMap.get(weekList.get(6));
		
		
		mnv.addObject("oneDayMap", oneDayMap);
		mnv.addObject("twoDayMap", twoDayMap   );
		mnv.addObject("threeDayMap", threeDayMap );
		mnv.addObject("fourDayMap", fourDayMap  );
		mnv.addObject("fiveDayMap", fiveDayMap  );
		mnv.addObject("sixDayMap", sixDayMap   );
		mnv.addObject("sevenDayMap", sevenDayMap );
		
		LOGGER.debug("oneDayMap : {}",oneDayMap);
		LOGGER.debug("twoDayMap   :{}",twoDayMap   );
		LOGGER.debug("threeDayMap :{}",threeDayMap );
		LOGGER.debug("fourDayMap  :{}",fourDayMap  );
		LOGGER.debug("fiveDayMap  :{}",fiveDayMap  );
		LOGGER.debug("sixDayMap   :{}",sixDayMap   );
		LOGGER.debug("sevenDayMap :{}",sevenDayMap );
		
		mnv.addObject("weekMap", weekMap);
		mnv.addObject("dataMap", dataMap);
		
		WholeCovidVO wholeCovidVO = testParsingExcelCovidData.excelParsingWholeCovid();
		Map<String, DailyCovidVO> beforedailyCovidMap = testParsingExcelCovidData.excelParsingDailyCovid();
		Map<String, DailyCovidVO> dailyCovidMap = MakeMillionCalc.calcDailyMillion(wholeCovidVO.getConfirm(), wholeCovidVO.getWholedeath(), beforedailyCovidMap);
		CovidStatsAgeVO covidStatsAgeVO = testParsingExcelCovidData.excelParsingAgeCovid();
		Map<String, String> genderMap = testParsingExcelCovidData.excelParsingGenderCovid();
		Map<String, String> commaDailyCovidMap = MakeComma.makeCommaDailyCovidVO(dailyCovidMap);
		mnv.addObject("commaDailyCovidMap", commaDailyCovidMap);
		mnv.addObject("wholeCovidVO", wholeCovidVO);
		mnv.addObject("dailyCovidMap", dailyCovidMap);
		mnv.addObject("covidStatsAgeVO", covidStatsAgeVO);
		mnv.addObject("genderMap", genderMap);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="cnfrm-detail-dgnss-regist")
	public ModelAndView cnfrmDetailDgnssRegist(ModelAndView mnv, String manageNo, String pstiNm, HttpSession session) {
		String url = "pbhlth/cnfrm-detail-dgnss-regist";
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("pstiNm", pstiNm);
		dataMap.put("pbhtNo", pbht.getPbhtNo());
		dataMap.put("manageNo", manageNo);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="cnfrm-dgnss-registgo")
	public ModelAndView cnfrmDgnssRegistgo(ModelAndView mnv, String manageNo, String hsptNo, HttpSession session)throws Exception {
		String url = "pbhlth/dgnss-rsgist-success";
		
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		
		Map<String, Object> reqData = new HashMap<String, Object>();
		
		reqData.put("manageNo", manageNo);
		reqData.put("hsptNo", hsptNo);
		reqData.put("pbhtNo", pbht.getPbhtNo());
		
		int result = pbhtServiceLMY.setHsptDgnssRegist(reqData);
		
		mnv.addObject(result);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="cnfrm-detail-dgnss-detail")
	public String cnfrmDetailDgnssDetail() {
		String url = "pbhlth/cnfrm-detail-dgnss-detail";
		
		return url;
	}
	
	@RequestMapping("res-smple-list")
	public void resSmpleList() {}
	
	@Autowired
	private MakeStatisticsLogByPbht makeStatisticsByPbht;
	
	@RequestMapping("smpl-confirmed")
	public ModelAndView smplConfirmed(ModelAndView mnv, String smplNo, String manageNo, String sttusCode, HttpSession session)throws Exception {
		String url = "pbhlth/smple-list";
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("smplNo", smplNo);
		data.put("manageNo", manageNo);
		data.put("sttusCode", sttusCode);
		data.put("pbhtNo", pbht.getPbhtNo());
		
		int result = pbhtServiceLMY.setCheckSmplRegist(data);
		
		makeStatisticsByPbht.makePbhtStatisticsSmpleCnt(pbht.getPbhtNo());
		
		VPstiCommand psti = pbhtService.getPstiByManageNo(manageNo);
		String pstiNm = psti.getPstiNm();
		String pstiTelno = psti.getPstiTelno().replaceAll("-", "");
		String instNm = pbht.getInstNm();
		
		Message coolsms = new Message(APIKEY, APISECRET);
		
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", pstiTelno);
		params.put("from", "01064757568"); //무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("app_version", "test app 1.2");
		
		if(sttusCode.equals("A102")) {
			makeStatisticsByPbht.makePbhtStatisticsPstvGender(manageNo, pbht.getPbhtNo());
			makeStatisticsByPbht.makePbhtStatisticsPstvAge(manageNo, pbht.getPbhtNo());
			params.put("text", pstiNm+"님 "+ instNm +"입니다. PCR 검사결과는 [양성] 입니다.");
		}
		if(sttusCode.equals("A103")) {
			makeStatisticsByPbht.makePbhtStatisticsNgtvGender(manageNo, pbht.getPbhtNo());
			makeStatisticsByPbht.makePbhtStatisticsNgtvAge(manageNo, pbht.getPbhtNo());
			params.put("text", pstiNm+"님 "+ instNm +"입니다. PCR 검사결과는 [음성] 입니다.");
		}
		
//		try {
//			//send() 는 메시지를 보내는 함수  
//			JSONObject obj = (JSONObject) coolsms.send(params);
//		} catch (CoolsmsException e) {
//			e.printStackTrace();
//		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="emp-manage-registform" )
	public ModelAndView empRegistForm(ModelAndView mnv,HttpSession session) {
		String url="pbhlth/emp-manage-registform";
				
		PbhtVO pbht = (PbhtVO) session.getAttribute("loginInst");
		MberVO mber = (MberVO) session.getAttribute("loginUser");
			
		mnv.addObject("pbht",pbht);
		mnv.addObject("mberCode",mber.getMberCode());
		
		mnv.setViewName(url);

		return mnv;
	}
	
	
	@RequestMapping("smpls-confirmed")
	public ModelAndView smplsConfirmed(ModelAndView mnv, String smplNo, String manageNo, String sttusCode, HttpSession session)throws Exception {
		String url = "pbhlth/smple-list";
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		
		String[] smpls = smplNo.split(",");
		String[] manages = manageNo.split(",");
		
		
		for(int i = 0; i < smpls.length; i++) {
			
			Map<String, Object> data = new HashMap<String, Object>();
			
			data.put("smplNo", smpls[i]);
			data.put("manageNo", manages[i]);
			data.put("sttusCode", sttusCode);
			data.put("pbhtNo", pbht.getPbhtNo());
			String manage = manages[i];
			int result = pbhtServiceLMY.setCheckSmplRegist(data);
			makeStatisticsByPbht.makePbhtStatisticsSmpleCnt(pbht.getPbhtNo());
			
			VPstiCommand psti = pbhtService.getPstiByManageNo(manage);
			LOGGER.debug(manages[i] +"매니지번호에영@@@@@@@@@@@");
			String pstiNm = psti.getPstiNm();
			String pstiTelno = psti.getPstiTelno().replaceAll("-", "");
			String instNm = pbht.getInstNm();
			
			Message coolsms = new Message(APIKEY, APISECRET);
			
			HashMap<String, String> params = new HashMap<String, String>();
			
			params.put("to", pstiTelno);
			params.put("from", "01064757568"); //무조건 자기번호 (인증)
			params.put("type", "SMS");
			params.put("app_version", "test app 1.2");
			if(sttusCode.equals("A102")) {
				makeStatisticsByPbht.makePbhtStatisticsPstvGender(manages[i], pbht.getPbhtNo());
				makeStatisticsByPbht.makePbhtStatisticsPstvAge(manages[i], pbht.getPbhtNo());
				params.put("text", pstiNm+"님 "+ instNm +"입니다. PCR 검사결과는 [양성] 입니다.");
			}
			if(sttusCode.equals("A103")) {
				makeStatisticsByPbht.makePbhtStatisticsNgtvGender(manages[i], pbht.getPbhtNo());
				makeStatisticsByPbht.makePbhtStatisticsNgtvAge(manages[i], pbht.getPbhtNo());
				params.put("text", pstiNm+"님 "+ instNm +"입니다. PCR 검사결과는 [음성] 입니다.");
			}
			
//			try {
//				//send() 는 메시지를 보내는 함수  
//				JSONObject obj = (JSONObject) coolsms.send(params);
//			} catch (CoolsmsException e) {
//				e.printStackTrace();
//			}
		}
		
		
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
			System.out.println("mberNm"+mber.getMberNm());
			InstVO inst = adminService.getInstDetail(mber.getInstNo());
			System.out.println("instNm:"+inst.getInstNm());
			if(mber.getMberNm().equals(inst.getInstNm())) {
				AttachVO attach = adminService.getAttachByMberNo(mber.getMberNo());
				if(attach != null) {
					String fileName = MakeFileName.parseFileNameFromUUID(attach.getFileName(), "\\$\\$");
					mnv.addObject("fileName", fileName);
				}
				System.out.println("여기로옵니다.");
				mnv.addObject("checkCeo", "Y");
			}else {
				mnv.addObject("checkCeo", "N");
			}
			mnv.addObject("mber", mber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
