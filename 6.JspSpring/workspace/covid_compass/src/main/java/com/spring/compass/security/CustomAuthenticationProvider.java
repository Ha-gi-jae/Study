package com.spring.compass.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.compass.service.MberService;
import com.spring.compass.vo.MberVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private MberService mberService;
	
	public void setMberService(MberService mberService) {
		this.mberService = mberService;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String loginId = (String) authentication.getPrincipal();
		String loginPwd = (String) authentication.getCredentials();
		
		MberVO mber = null;
		try {
			mber = mberService.getMember(loginId);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BadCredentialsException("서버 장애로 서비스가 불가합니다.");
		}
		
		if(mber != null) {
			if(loginPwd.equals(mber.getMberPwd())) {
				UserDetails authUser = new User(mber);
				boolean invalidCheck = authUser.isEnabled();
				
				if(invalidCheck) {
					UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
					
					result.setDetails(authUser);
					
					return result;
				}
				throw new BadCredentialsException("계정이 비활성화 처리되어 로그인이 불가합니다.");
			}else {
				new LoginFailureHandler().setMeberId(loginId);
				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
				
			}
		}else {
			throw new BadCredentialsException("존재하지 않는 아이디입니다.");
		}
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
