package com.jsp.action.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.service.MemberServiceForModify;

public class MemberRemoveAction implements Action {

	private MemberServiceForModify memberService;

	public void setMemberService(MemberServiceForModify memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = null;
		String id = request.getParameter("id");
		
		try {
			memberService.remove(id);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('"+id+"님 삭제되었습니다.');");
			out.print("window.close();");
			out.print("</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
		return url;
	}
	
}
