package com.hgj.service;

import java.util.List;
import java.util.Map;

import com.hgj.command.Criteria;
import com.hgj.dto.MemberVO;

public interface MemberService {
	
	public List<MemberVO> getMemberList() throws Exception;
	
	public List<MemberVO> getMemberList(Criteria cri) throws Exception;
	
	public Map<String, Object> getMemberListPage(Criteria cri) throws Exception;
	// 한번에 두개 던져주려고 맵을 씀.
	
	public MemberVO getMember(String id) throws Exception;
	
	public void regist(MemberVO member) throws Exception;
	
}
