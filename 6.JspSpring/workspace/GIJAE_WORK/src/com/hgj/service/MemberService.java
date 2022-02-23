package com.hgj.service;

import java.util.List;

import com.hgj.dto.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList() throws Exception;
}
