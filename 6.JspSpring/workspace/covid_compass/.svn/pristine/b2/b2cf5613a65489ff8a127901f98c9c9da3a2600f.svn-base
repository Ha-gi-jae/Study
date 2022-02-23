package com.spring.compass.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.servlet.View;

public class FileDownloadView implements View{
	
	private String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	@Override
	public String getContentType() {
		return this.contentType;
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String filePath = (String) model.get("savePath");
		String fileName = (String) model.get("fileName");
		
		File downloadFile = new File(filePath+File.separator+fileName);
		FileInputStream in = new FileInputStream(downloadFile);
		
		
		response.setContentType(contentType);
		response.setContentLength((int)downloadFile.length());
		String sendFileName="";
		String headerKey = "Content-Disposition";
		int check = fileName.indexOf("$");
		if(check>0) {
			sendFileName = fileName.split("\\$\\$")[1];
		}else {
			sendFileName=fileName;
		}
		
		String header = request.getHeader("User-Agent");
		if(header.contains("MSIE")) {
			sendFileName = URLEncoder.encode(sendFileName, "UTF-8");
		}else {
			sendFileName = new String(sendFileName.getBytes("utf-8"),"ISO-8859-1");
		}
		String headerValue = String.format("attachment; filename=\"%s\"", sendFileName);
		response.setHeader(headerKey, headerValue);
		
		OutputStream out = response.getOutputStream();
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		
		while((bytesRead = in.read(buffer))!=-1) {
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		out.close();
		
	}
	
	
	
}
