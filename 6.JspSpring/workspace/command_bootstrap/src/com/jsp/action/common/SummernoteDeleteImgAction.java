package com.jsp.action.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jsp.action.Action;
import com.jsp.command.SummernoteDeleteImgCommand;
import com.jsp.utils.GetUploadPath;

public class SummernoteDeleteImgAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = null;
		
		ObjectMapper mapper = new ObjectMapper(); // jackson
		
		SummernoteDeleteImgCommand delReq = mapper.readValue(request.getReader(), SummernoteDeleteImgCommand.class);		
													// readValue 안에 reflection 기능이 있을거임.
													// 왜냐 ? 파라미터에 .class를 썼으니까. 그 클래스를 가져와야할거아니냐!
													// class.forName(클래스 타입 알게됨) -> new instance(앞의 타입을 이용해 instance 뽑아내기) 
		
		String savePath = GetUploadPath.getUploadPath("summernote.img");
		String fileName = URLDecoder.decode(delReq.getFileName(), "utf-8");
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		File target = new File(savePath + File.separator + fileName);
		
		if(!target.exists()) {
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}else {
			target.delete();
			out.print(fileName + " 이미지를 삭제했습니다.");
		}
		
		return url;
	}

}
