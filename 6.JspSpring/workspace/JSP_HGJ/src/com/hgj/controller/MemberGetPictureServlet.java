package com.hgj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hgj.utils.FileDownloadResolver;
import com.hgj.utils.GetUploadPath;

public class MemberGetPictureServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		
		String fileName = request.getParameter("picture");
		String savedPath = GetUploadPath.getUploadPath("member.picture.upload");
		
		FileDownloadResolver.sendFile(fileName, savedPath, request, response);
	}


}
