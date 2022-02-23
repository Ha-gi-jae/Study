package com.hgj.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.action.Action;
import com.hgj.utils.FileDownloadResolver;
import com.hgj.utils.GetUploadPath;

public class MemberGetPictureAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = null;
		
		String fileName = request.getParameter("picture");
		String savedPath = GetUploadPath.getUploadPath("member.picture.upload");
		
		FileDownloadResolver.sendFile(fileName, savedPath, request, response);
		return url;
	}

}
