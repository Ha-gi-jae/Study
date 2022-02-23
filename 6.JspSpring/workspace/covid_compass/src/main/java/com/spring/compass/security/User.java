package com.spring.compass.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.spring.compass.vo.MberVO;

public class User implements UserDetails {

	private MberVO mber;
	
	public User(MberVO mber) {
		this.mber = mber;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(mber.getUseYn()));
		return roles;
	}

	@Override
	public String getPassword() {
		return mber.getMberPwd();
	}

	@Override
	public String getUsername() {
		return mber.getMberId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return mber.getUseYn() != "N";
	}
	
	public MberVO getMberVO() {
		return this.mber;
	}

}
