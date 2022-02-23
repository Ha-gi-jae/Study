package com.hgj.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.action.Action;
import com.hgj.service.MemberService;

public class MemberModifyFormAction implements Action {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = "/member/modify";
		
		String id = request.getParameter("id");
		return url;
	}

}
