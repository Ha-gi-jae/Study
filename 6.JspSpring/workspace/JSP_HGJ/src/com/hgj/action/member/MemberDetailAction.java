package com.hgj.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.action.Action;
import com.hgj.dto.MemberVO;
import com.hgj.service.MemberService;

public class MemberDetailAction implements Action {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = "/member/detail";
		
		String id = request.getParameter("id");
		
		try {
			MemberVO member = memberService.getMember(id);
			request.setAttribute("member", member);
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		return url;
	}

}
