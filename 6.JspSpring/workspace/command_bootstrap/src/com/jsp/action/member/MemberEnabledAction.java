package com.jsp.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MemberServiceForModify;

public class MemberEnabledAction implements Action {
	
	private MemberServiceForModify memberService;

	public void setMemberService(MemberServiceForModify memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = null;
		String id = request.getParameter("id");
		int enabled = Integer.parseInt(request.getParameter("enabled"));
		
//		MemberVO member = new MemberVO();
//		member.setId(id);
//		member.setEnabled(enabled);
		
		try {
//			memberService.enabled(member);
			memberService.enabled(id, enabled);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('"+id+"님의 상태가 변경되었습니다.');");
			out.print("location.href='detail.do?id="+id+"';");
			out.print("</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		return url;
	}
	
	

}
