package com.spring.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.spring.dto.MemberVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		// Authentication 로그인 성공한 아이디가 여기에 뜬다.
		//우리는 세션만 살짝쿵 얹을예정.
		// 상속만 잘 이해하면 사용하기 쉬움!
		UserDetails user = (UserDetails)authentication.getPrincipal();
		String username = user.getUsername();
		String password = user.getPassword();
		
		MemberVO member = new MemberVO();
		member.setId(username);
		member.setPwd(password);
		member.setName("mimi");
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

	
}
