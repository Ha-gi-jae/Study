package com.hgj.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.action.Action;
import com.hgj.dto.MemberVO;
import com.hgj.service.MemberService;

public class MemberIdCheckAction implements Action {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = null;

		String resultStr = "";
		
		String id = request.getParameter("id");
		
		response.setContentType("type/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			MemberVO member = memberService.getMember(id);
			
			if(member != null) resultStr = "DUPLICATED";
			
			out.print(resultStr);
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}finally {
			out.close();
		}
		
		return url;
	}

}
