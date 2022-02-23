package com.jsp.action.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.NoticeVO;
import com.jsp.service.NoticeService;

public class NoticeDetailAction implements Action {

	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = "/notice/detail";
		
		
		try {
			int nno = Integer.parseInt(request.getParameter("nno"));
			String from = request.getParameter("from"); // 수정페이지로 가면 from 이 온다.
			
			NoticeVO notice = null;
			
			if(from != null && from.equals("modify")) {
				notice = noticeService.getNoticeForModify(nno);
			}else {
				notice = noticeService.getNotice(nno);
			}
			
			request.setAttribute("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		return url;
	}

}
