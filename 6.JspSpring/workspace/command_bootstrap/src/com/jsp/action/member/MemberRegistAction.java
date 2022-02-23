package com.jsp.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.MemberRegistCommand;
import com.jsp.controller.HttpRequestParameterAdapter;
import com.jsp.dto.MemberVO;
import com.jsp.service.MemberService;

public class MemberRegistAction implements Action {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = "/member/regist_success";
		
		
		
		MemberVO member = null;
		
			try {
				MemberRegistCommand regData = (MemberRegistCommand) HttpRequestParameterAdapter.execute(request, MemberRegistCommand.class);
				
				member = regData.toMemberVO();
			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(response.SC_BAD_REQUEST);
				url = null;
			}
			try {
				memberService.registMember(member);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(response.SC_INTERNAL_SERVER_ERROR);
				url = null;
//				url="/member/regist_fail";
			}

		return url;
	}

}
