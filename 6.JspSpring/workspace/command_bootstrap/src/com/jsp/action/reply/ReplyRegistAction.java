package com.jsp.action.reply;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.josephoconnell.html.HTMLInputFilter;
import com.jsp.action.Action;
import com.jsp.command.PageMaker;
import com.jsp.command.SearchCriteria;
import com.jsp.dto.ReplyVO;
import com.jsp.service.ReplyService;

public class ReplyRegistAction implements Action {

	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = null;
		
		ObjectMapper mapper = new ObjectMapper();
		
		ReplyVO reply = mapper.readValue(request.getReader(), ReplyVO.class); 
		// String으로 넘어옴. Stringify()로 했으니까.
		
		try {
			//XSS
			reply.setReplytext(HTMLInputFilter.htmlSpecialChars(reply.getReplytext()));

			replyService.registReply(reply);
			
			int realEndPage = 1;
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(new SearchCriteria());
			pageMaker.setTotalCount(replyService.getReplyListCount(reply.getBno()));
			
			realEndPage = pageMaker.getRealEndPage();
			
			PrintWriter out = response.getWriter();
			out.print(realEndPage);
			out.close();
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
		
		return url;
	}

}
