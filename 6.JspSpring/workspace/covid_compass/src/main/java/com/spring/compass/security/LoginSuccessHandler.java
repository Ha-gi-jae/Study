package com.spring.compass.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.spring.compass.service.AdminService;
import com.spring.compass.service.HsptService;
import com.spring.compass.service.InspService;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtService;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.MberVO;
import com.spring.compass.vo.PbhtVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	private MberService mberService;

	public void setMberService(MberService mberService) {
		this.mberService = mberService;
	}

	private InspService inspService;

	public void setInspService(InspService inspService) {
		this.inspService = inspService;
	}

	private PbhtService pbhtService;

	public void setPbhtService(PbhtService pbhtService) {
		this.pbhtService = pbhtService;
	}

	private HsptService hsptService;

	public void setHsptService(HsptService hsptService) {
		this.hsptService = hsptService;
	}

	private LtctService ltctService;

	public void setLtctService(LtctService ltctService) {
		this.ltctService = ltctService;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		UserDetails userDetail = (UserDetails) authentication.getDetails();
		String mberId = userDetail.getUsername();

		MberVO loginUser = null;

		HttpSession session = request.getSession();

		try {
			loginUser = mberService.getMember(mberId);

			String instNo = loginUser.getInstNo();

			String mberCode = loginUser.getMberCode();

			if(mberCode.equals("B121") || mberCode.equals("B101")) {
				InspVO loginInst = inspService.getInspByInstNo(instNo);
				session.setAttribute("loginInst", loginInst);
			}
			if(mberCode.equals("B122") || mberCode.equals("B102")) {
				PbhtVO loginInst = pbhtService.getPbhtByInstNo(instNo);
				session.setAttribute("loginInst", loginInst);
			}
			if(mberCode.equals("B123") || mberCode.equals("B103")) {
				HsptVO loginInst = hsptService.getHsptByInstNo(instNo);
				session.setAttribute("loginInst", loginInst);
			}
			if(mberCode.equals("B124") || mberCode.equals("B104")) {
				LtctVO loginInst = ltctService.getLtctByInstNo(instNo);
				session.setAttribute("loginInst", loginInst);
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("loginUser", loginUser);
		session.setMaxInactiveInterval(60*60);

		super.onAuthenticationSuccess(request, response, authentication);
	}


}
