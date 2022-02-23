package com.spring.compass.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.spring.compass.service.AdminService;
import com.spring.compass.vo.MberVO;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	
	public static String mberId;
	private String savePath;
	private String saveFileName;
	private AdminService adminService;
	
	public void setMeberId(String mberId) {
		this.mberId = mberId;
	}
	
	public String getMberId() {
		return mberId;
	}
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws  IOException, ServletException {
		String msg = exception.getMessage();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("history.go(-1);");
		out.println("</script>");
		
		try {
			writeLoginFailLog(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void writeLoginFailLog(HttpServletRequest request) throws Exception{
		
		MberVO mber = null;
		
		try {
			if(mberId.equals("admin")) {
				return;
			}
			mber = adminService.getMberByMberId(mberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Date logTime = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String userLogTime = fmt.format(logTime);
		
		String tag = "[loginFail:user]";
		String log = tag + mber.getMberNo() + "," 
						 + mber.getInstNo() + "," 
				         + userLogTime + "," 
						 + request.getRemoteAddr()+","
						 + mber.getMberNm();
		
		File file = new File(savePath);
		if(!file.exists()) file.mkdirs();
		
		String logFilePath = savePath + File.separator + saveFileName;
		BufferedWriter bufferOut = new BufferedWriter(new FileWriter(logFilePath, true));
		
		bufferOut.write(log);
		bufferOut.newLine();
		bufferOut.close();
	}
	
	
	
	
	
	
}
