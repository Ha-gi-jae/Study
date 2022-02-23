package com.hgj.action.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;

import com.hgj.action.Action;
import com.hgj.dto.MemberVO;
import com.hgj.exception.NotMultipartFormDataException;
import com.hgj.service.MemberServiceForModify;
import com.hgj.utils.GetUploadPath;
import com.hgj.utils.MultipartHttpServletRequestParser;
import com.hgj.utils.SaveFileResolver;

public class MemberModifyAction implements Action {

	private MemberServiceForModify memberService;
	
	public void setMemberService(MemberServiceForModify memberService) {
		this.memberService = memberService;
	}
	
	private static final int MEMORY_THRESHOLD = 1024 * 500;
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1;
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2;
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = "/member/modify_success";
		
		try {
			MultipartHttpServletRequestParser multiReq = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String id = multiReq.getParameter("id");
			String pwd = multiReq.getParameter("pwd");
			String email = multiReq.getParameter("email");
			String authority = multiReq.getParameter("authority");
			String name = multiReq.getParameter("name");
			String phone = multiReq.getParameter("phone");
			
			MemberVO member = new MemberVO();
			
			member.setId(id);
			member.setPwd(pwd);
			member.setEmail(email);
			member.setAuthority(authority);
			member.setName(name);
			member.setPhone(phone);
			
			String uploadPicture = multiReq.getParameter("uploadPicture");
			if(uploadPicture != null && !uploadPicture.isEmpty()) {
				
				String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
				File file = new File(uploadPath);
				file.mkdirs();
				
				File deleteFile = new File(uploadPath, multiReq.getParameter("oldPicture"));
				if(deleteFile.exists()) deleteFile.delete();
				
				List<File> fileList = SaveFileResolver.fileUpload(multiReq.getFileItems("picture"), uploadPath);
				File saveFile = fileList.get(0);
				member.setPicture(saveFile.getName());
			}else {
				member.setPicture(multiReq.getParameter("oldPicture"));
			}
			
			memberService.modify(member);
			request.setAttribute("member", member);
			
			HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if(loginUser != null && member.getId().equals(loginUser.getId())) {
				session.setAttribute("loginUser", memberService.getMember(member.getId()));
			}
			request.getRequestDispatcher(url).forward(request, response);
		} catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST);
			url = null;
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		} 
		
		return url;
	}

}
