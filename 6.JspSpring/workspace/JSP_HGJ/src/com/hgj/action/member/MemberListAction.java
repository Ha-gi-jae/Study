package com.hgj.action.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.action.Action;
import com.hgj.command.Criteria;
import com.hgj.command.SearchCriteria;
import com.hgj.exception.NotNumberException;
import com.hgj.service.MemberService;

public class MemberListAction implements Action {

	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = "/member/list";
		
		String pageParam = request.getParameter("page");
		String perPageNumParam = request.getParameter("perPageNum");
		String searchTypeParam = request.getParameter("searchType");
		String keywordParam = request.getParameter("keyword");
		
		try {
			Criteria cri = null;
			if(pageParam != null && perPageNumParam != null) {
				cri = new SearchCriteria(pageParam, perPageNumParam, searchTypeParam, keywordParam);
			}else {
				cri = new SearchCriteria();
			}
			
			Map<String, Object> dataMap = memberService.getMemberListPage(cri);
			request.setAttribute("dataMap", dataMap);
			
		}catch (NotNumberException e) {
			request.setAttribute("exception", e);
			response.sendError(response.SC_BAD_REQUEST);
			url = null;
		}catch (Exception e) {
			request.setAttribute("exception", e);
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		return url;
	}

}
