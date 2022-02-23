package com.jsp.service;

import com.jsp.dto.MemberVO;
import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIDException;

public interface MemberServiceForModify extends MemberService {
	
	void modify(MemberVO member) throws Exception;
	
	void remove(String id) throws Exception;
	
	void enabled(MemberVO member) throws Exception;
	
	void enabled(String id, int enabled) throws Exception;
	
	// 회원 로그인
	void login(String id, String pwd) throws NotFoundIDException, InvalidPasswordException, Exception;
	
}
