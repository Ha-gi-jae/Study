package com.jsp.action.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.Criteria;
import com.jsp.command.SearchCriteria;
import com.jsp.exception.NotNumberException;
import com.jsp.service.MemberService;

public class MemberListAction implements Action {
	
	//Mapper에서 값 설정해줌.
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String url = "/member/list";
		
		String pageParam = request.getParameter("page");
		String perPageNumParam = request.getParameter("perPageNum");
		String searchTypeParam = request.getParameter("searchType");
		String keywordParam = request.getParameter("keyword");
		
		try {
			Criteria cri = null;
			if(pageParam != null && perPageNumParam != null) {
				 cri = new SearchCriteria(pageParam,perPageNumParam, searchTypeParam, keywordParam);
			}else {
				cri = new SearchCriteria();
			}

			//List<MemberVO> memberList = //memberService.getMemberList();
										//memberService.getMemberList(cri);
			Map<String, Object> dataMap = memberService.getMemberListPage(cri);
			request.setAttribute("dataMap", dataMap);
//			if(true) throw new IOException();
			
		}catch (NotNumberException e) {
			request.setAttribute("exception", e);
//			url = "/error/message.jsp";
			response.sendError(response.SC_BAD_REQUEST);
		}catch (Exception e) {
			request.setAttribute("exception", e);
			// 동기할때는 문제가 안되는데 비동기때 문제가된다... 
//			url = "/error/500.jsp"; // 응답은 200으로 나가는데 500이 나옴. - ajax에서 success
			response.sendError(response.SC_INTERNAL_SERVER_ERROR); // 응답도 500으로 나가고 페이지도 500이 나옴. - ajax에서 error
		}
		return url;
		// 포워딩할지 리다이렉트를 할지는 servlet이 결정해야함.

	}

}
