package com.spring.compass.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.spring.compass.command.VPstiCommand;
import com.spring.compass.service.AdminService;
import com.spring.compass.service.InspService;
import com.spring.compass.service.MberService;
import com.spring.compass.service.MenuService;
import com.spring.compass.service.PbhtServiceLKH;
import com.spring.compass.service.PstiServiceLKH;
import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.util.FileRegistUtil;
import com.spring.compass.vo.AttachVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.MenuVO;
import com.spring.compass.vo.NoticeVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.SmplResultVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class CommonController {
	
	private final static String APIKEY = "NCSAPXSIFKAYD8MM";
	private final static String APISECRET = "SPVLAXK5IDMRJEREVXRBTBWMXY8OVIER";
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private PstiServiceLKH pstiServiceLKH;
	
	@Autowired
	private MberService mberService;
	
	@Autowired
	private PbhtServiceLKH pbhtServiceLKH;
	
	@Autowired
	private InspService inspService;
	
	@Autowired
	private AdminService adminService;
	
	@Resource(name="mypageFilePath")
	private String mypageFilePath;
	
	public void setMberService(MberService mberService) {
		this.mberService = mberService;
	}

	@RequestMapping(value="/sessionIncrease")
	public void SessionIncrease(HttpSession session, HttpServletResponse response) {
		session.setMaxInactiveInterval(60*60);
		session.setAttribute("criteriaTime", new Timestamp(System.currentTimeMillis()));
	}

	@RequestMapping(value="common/main")
	public String main() {

		String url = "common/main";

		return url;
	}

	@RequestMapping("/index")
	public String index(String murl, String mcode, Model model)
											throws SQLException{
		String url = "common/indexPage";

		model.addAttribute("murl", murl);
		model.addAttribute("mcode", mcode);

		return url;
	}
	// 정보변경
	@RequestMapping(value = "/common/modify-Info", method=RequestMethod.POST)
	public ModelAndView modifyInfo(HttpServletRequest req, MultipartFile mypageFile,
									String mberNo, String mberTelno, 
									String mberAdres, String mberEmail,
									ModelAndView mnv, String checkFile) throws Exception {
		String url="common/insertFileSuccess";
		MberVO mber = new MberVO();
		HttpSession session = req.getSession();
		MberVO loginUser = (MberVO) session.getAttribute("loginUser");
		String instNo = loginUser.getInstNo();
		mber.setMberNo(mberNo);
		mber.setMberTelno(mberTelno);
		mber.setMberAdres(mberAdres);
		mber.setMberEmail(mberEmail);
		AttachVO attach = new AttachVO();
		if(mypageFile == null) System.out.println("파일없음");
		try {
			mberService.modifyInfo(mber);
			if(mypageFile !=null && checkFile.equals("Y")) {
				adminService.removeAttachByMberNo(mberNo);
				String fileName = FileRegistUtil.fileRegist(mypageFile, mypageFilePath);
				String attachNo = adminService.getAttachSeq();
				attach.setAtchNo(attachNo);
				attach.setUploadPath(mypageFilePath);
				attach.setFileName(fileName);
				attach.setNoticeNo("9999999");
				attach.setMberNo(mber.getMberNo());
				attach.setInstNo(instNo);
				attach.setType("B");
				adminService.registAttach(attach);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			url="common/failMypageUpdate";
		}
		mnv.addObject("mberNm", loginUser.getMberNm());
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/index-test")
	public String indexTest(String murl, String mcode, Model model) {
		String url = "common/indexPage";

		model.addAttribute("mcode", mcode);
		model.addAttribute("murl", murl);

		return url;
	}

	//로그인 화면
	@RequestMapping("/common/loginForm")
	public String loginForm(@RequestParam(defaultValue="")String error, HttpServletResponse response, HttpSession session) {

		String url = "common/login";
//		String url = "common/loginHome";

		if(error.equals("1")) {
			response.setStatus(302);
		}
		if(session.getAttribute("loginUser") != null || session.getAttribute("loginInst") != null) {
			session.invalidate();
		}
		return url;
	}
	// 세션 만료
	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model) throws Exception{
		String url = "security/sessionOut";
		
		model.addAttribute("message", "세션이 만료되었습니다.\\n다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping("/security/accessDenied")
	public void accessDenied() {}

	@RequestMapping("/common/find_IdForm")
	public void find_idForm() {}
	
	// 아이디 찾기
	@RequestMapping(value="/common/findId", method=RequestMethod.POST)
	public String find_id(MberVO mber, Model model) {
		String url = "common/check-id";
		
		MberVO user = null;
		try {
			user = mberService.getInfo(mber);
			model.addAttribute("mberId", user.getMberId());
		} catch (Exception e) {
			e.printStackTrace();
			url = "common/notFoundInfo";
		}
		
		return url;
	}

	@RequestMapping("/common/find_PwdForm")
	public void find_pwdForm() {}

	@RequestMapping(value="/common/findPwd", method=RequestMethod.POST)
	public String find_pwd(String mberNm, String mberTelno, Model model) {
		String url="common/change-password";
		
		MberVO mber = new MberVO();
		
		mber.setMberNm(mberNm);
		mber.setMberTelno(mberTelno);
		
		try {
			MberVO user = mberService.getInfo(mber);
			model.addAttribute("mberNo", user.getMberNo());
				
		} catch (Exception e) {
			e.printStackTrace();
			url = "common/notFoundInfo";
		}
		return url;
	}
	
	@RequestMapping("/common/check-id")
	public void check_id() {}

	@RequestMapping("/common/change-password")
	public void change_password() {}
	
	@RequestMapping("/common/changepass")
	public String changePass(String mberNo, String mberPwd, String SessionMberNo, HttpSession session) {
		String url = null;
		MberVO mber = new MberVO();
		if(SessionMberNo == "" || SessionMberNo == null || SessionMberNo.isEmpty()) {
			mber.setMberNo(mberNo);
		}
		if(mberNo == "" || mberNo == null || mberNo.isEmpty()) {
			mber.setMberNo(SessionMberNo);
		}
		mber.setMberPwd(mberPwd);
		
		try {
			mberService.modifyPwd(mber);
			url = "common/success";
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
			url = "common/error";
		}
		return url;
	}
	@RequestMapping("/common/mypage")
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

	@RequestMapping("/common/mypage-modifyform")
	public void mypage_modifyform() {}

	@RequestMapping("/common/set-session")
	public void setSession() {}

	@RequestMapping("/common/loading")
	public String loading() {
		return "common/loading";
	}

	@Autowired
	private MenuService menuService;

	@RequestMapping("/indexPage")
	public String index(@RequestParam(value="mCode", defaultValue = "M060000") String menuNo,
						@RequestParam(value="noticeNo", defaultValue = "") String noticeNo,
						HttpSession session,
			 			Model model)
			 					throws Exception{
		String url = "common/indexPage";
		
		String tempMenuNo = menuNo.substring(0,3) + "0000";
		List<MenuVO> menuList = null;
		
		MberVO loginUser = (MberVO)session.getAttribute("loginUser");
		
		List<MenuVO> menuList2 = menuService.getAllSubMenuList(tempMenuNo);
		LOGGER.debug("{}", menuList2);
		
		MenuVO myPage = menuList2.get(menuList2.size() - 1);
		MenuVO qrPage = null;
		
		LOGGER.debug("{}", loginUser);
		LOGGER.debug("{}",myPage);
		
		if(loginUser != null) {
			
			LOGGER.debug(loginUser.getMberCode().substring(2, 3));
			
			if(loginUser.getMberCode().substring(2, 3).equals("2")) {
				LOGGER.debug("대표회원!");
				menuList = menuService.getSubMenuList(tempMenuNo);
			}else {
				LOGGER.debug("일반회원!");
				menuList = menuService.getEmpSubMenuList(tempMenuNo);
			}
			
			if(loginUser.getMberCode().equals("B101") || loginUser.getMberCode().equals("B121")) {
				qrPage = menuList2.get(menuList2.size() - 2);
			}
			
			LOGGER.debug("{}", menuList);
		}
		
		
		MenuVO menu = menuService.getMenu(menuNo);
		
		LOGGER.debug("{}", menu);
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("menu", menu);
		model.addAttribute("myPage", myPage);
		model.addAttribute("qrPage", qrPage);
		
		model.addAttribute("isNotice", false);
		
		if(!noticeNo.isEmpty()) {
			
			model.addAttribute("isNotice", true);
			model.addAttribute("noticeNo", noticeNo);
			
		}
		
		return url;
	}

	@RequestMapping("/submenu")
	public String submenu(@RequestParam(value="mCode", defaultValue = "M020000") String menuNo, Model model)
		throws Exception{

		String url = "common/indexPage";

		List<MenuVO> menuList = menuService.getSubMenuList(menuNo);

		model.addAttribute("menuList", menuList);

		return url;
	}

	@RequestMapping("/common/sms")
	@ResponseBody
	public void smsOkay(@RequestBody Map<String, String> data) {
		
		String name = data.get("mberNm");
		String tel = data.get("mberTelno");
		String number = data.get("number");
		
		MberVO mber = new MberVO();
		mber.setMberNm(name);
		mber.setMberTelno(tel);
		
		MberVO user = null;
		
		try {
			user = mberService.getInfo(mber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String userNm = user.getMberNm();
		String userTelno = user.getMberTelno().replaceAll("-", "");
		
		Message coolsms = new Message(APIKEY, APISECRET);
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("from", "01064757568");
		params.put("to", userTelno); //무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", userNm+"님 COVID-19 COMPASS입니다. 인증번호는 ["+ number +"] 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version
		
		try {
			//send() 는 메시지를 보내는 함수  
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		
	}
	
	
	@RequestMapping("/common/qrInfo")
	public ModelAndView qrInfo(String pstiNo, @RequestParam(defaultValue="")String smplNo, ModelAndView mnv) throws Exception{
		
		String url = "common/qrInfo";
		Map<String, Object> dataMap = null;
		dataMap = new HashMap<String, Object>();
		
		LOGGER.debug(pstiNo);
		
		VPstiCommand psti = pstiServiceLKH.getVPstiByPstiNo(pstiNo);

		if(psti!= null) {
			
			psti.setJobCode(CommonCodeUtil.getCodeName(psti.getJobCode()));
			psti.setVacCode(CommonCodeUtil.getCodeName(psti.getVacCode()));
			
			String inspNo = psti.getInspNo();
			LOGGER.debug("{}", inspNo);
			InspVO insp = inspService.getInspByInspNo(inspNo);
			LOGGER.debug("{}", insp);
			
			dataMap.put("insp", insp);
			
			mnv.addObject("wrtYmd", new Timestamp(psti.getWrtYmd().getTime()));
			
			String manageNo = psti.getManageNo();
			if(manageNo != null && !smplNo.isEmpty()) {
				
				SmplResultVO smpl = pstiServiceLKH.getVSmplResultBySmplNo(smplNo);
				
				LOGGER.debug("{}", smpl);
				
				if(smpl != null) {
					
					String pbhtNo = smpl.getPbhtNo();
					PbhtVO pbht = pbhtServiceLKH.getPbhtByPbhtNo(pbhtNo);
					
					LOGGER.debug("{}", pbht);
					
					String pbhtNm = pbht.getInstNm();
					
					dataMap.put("reqYmd", new Timestamp(smpl.getReqYmd().getTime()));
					dataMap.put("pbhtNm", pbhtNm);
					
					if(smpl.getResYmd() != null) {
						dataMap.put("resYmd", new Timestamp(smpl.getResYmd().getTime()));
						dataMap.put("pstvYn", smpl.getPstvYn());
					}
				}
			}
		}
		
		LOGGER.debug("{}", psti);
		
		dataMap.put("psti", psti);
		
		LOGGER.debug("{}", dataMap);
		
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/common/read-detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> readDetail(String manageNo
														, String purposeCode
														, String purposeNote
														, HttpSession session) throws Exception{
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = null;
		
		MberVO loginUser = (MberVO) session.getAttribute("loginUser");
		
		dataMap = new HashMap<String, Object>();
		
		String instNo = loginUser != null ? loginUser.getInstNo() : "모바일 접근 기관번호";
		String mberNo = loginUser != null ? loginUser.getMberNo() : "모바일 접근 회원번호";
		
		String logTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		LOGGER.debug("{}", mberNo);
		LOGGER.debug("{}", instNo);
		LOGGER.debug("{}", manageNo);
		LOGGER.debug("{}", purposeCode);
		LOGGER.debug("{}", purposeNote);
		LOGGER.debug("{}", logTime);
		
		dataMap.put("msg", "readDetail");
		
		String savePath="c:\\commonReadDetail\\readDetail";
		String saveFileName="readDetail.log.csv";
		
		File file = new File(savePath);
		
		if(!file.exists()) file.mkdirs();
		
		String tag ="[common:readDetail]";
		String log = String.format("%s%s,%s,%s,%s,%s,%s", tag, mberNo, instNo, manageNo, purposeCode, purposeNote, logTime);
		
		String logFilePath = savePath+ File.separator + saveFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		LOGGER.debug(log);
		
		out.write(log);
		out.newLine();
		out.close();
			
		entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/common/qrPage")
	public ModelAndView qrPage(String pstiNo, ModelAndView mnv) throws Exception{
		
		String url = "common/qrPage";
		
		LOGGER.debug("{}", pstiNo);
		
		mnv.addObject("pstiNo", pstiNo);
		mnv.setViewName(url);
		
		LOGGER.debug("{}", mnv);
		
		return mnv;
	}
}