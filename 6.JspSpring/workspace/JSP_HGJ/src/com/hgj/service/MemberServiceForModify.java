package com.hgj.service;

import com.hgj.dto.MemberVO;

public interface MemberServiceForModify extends MemberService {
	
	public void modify(MemberVO member) throws Exception;
	
	public void remove(String id) throws Exception;
	
	void enabled(String id, int enabled) throws Exception;
}
