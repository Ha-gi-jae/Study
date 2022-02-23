package com.jsp.action.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.action.Action;
import com.jsp.controller.MultipartHttpServletRequestParser;
import com.jsp.controller.SaveFileResolver;
import com.jsp.dto.MemberVO;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.service.MemberServiceForModify;
import com.jsp.utils.GetUploadPath;

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
		
		// file 처리
		// 기존 사진 변경 유무 확인
		String uploadPicture = multiReq.getParameter("uploadPicture");
		if(uploadPicture != null && !uploadPicture.isEmpty()) {// 사진변경
			
			// 저장 경로
			String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
			File file = new File(uploadPath);
			file.mkdirs();
			
			// 기존 사진이미지 삭제
			File deleteFile = new File(uploadPath, multiReq.getParameter("oldPicture"));
			if(deleteFile.exists()) deleteFile.delete();				
			
			// 최근 사진이미지 저장
			List<File> fileList = SaveFileResolver.fileUpload(multiReq.getFileItems("picture"), uploadPath);
			File saveFile = fileList.get(0);
			
			member.setPicture(saveFile.getName());
		}else {
			member.setPicture(multiReq.getParameter("oldPicture"));
		}
		
		//DB 처리
		memberService.modify(member);
		request.setAttribute("member", member);
		
		// 로그인 사용자 확인
//		request.setAttribute("parentReload", false);
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser != null && member.getId().equals(loginUser.getId())) {
//			request.setAttribute("parentReload", true);
			session.setAttribute("loginUser", memberService.getMember(member.getId()));
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		}catch(NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST);
			url = null;
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		return null;
	}
}
