package com.hgj.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.dao.MemberDAO;
import com.hgj.dao.MemberDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.MemberVO;
import com.hgj.exception.NotMultipartFormDataException;
import com.hgj.service.MemberServiceForModify;
import com.hgj.service.MemberServiceForModifyImpl;
import com.hgj.service.MemberServiceImpl;
import com.hgj.utils.GetUploadPath;
import com.hgj.utils.MultipartHttpServletRequestParser;
import com.hgj.utils.SaveFileResolver;

public class MemberModifyServlet extends HttpServlet {
	
	private MemberServiceForModify memberService;
	
	{
		memberService = new MemberServiceForModifyImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		MemberDAO memberDAO = new MemberDAOImpl();
		((MemberServiceImpl)memberService).setMemberDAO(memberDAO);
		((MemberServiceImpl)memberService).setSqlSessionFactory(factory);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/modify.jsp";
		
		String id = request.getParameter("id");
		
		MemberVO member = null;
		try {
			member = memberService.getMember(id);
			request.setAttribute("member", member);
			request.getRequestDispatcher(url).forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
	}
	
	private static final int MEMORY_THRESHOLD = 1024 * 500;
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1;
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/member/modify_success.jsp";
		
		try {
			// 1. 파싱
			MultipartHttpServletRequestParser multiReq = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			// 2. String 값 불러오기
			String id = multiReq.getParameter("id");
			String pwd = multiReq.getParameter("pwd");
			String email = multiReq.getParameter("email");
			String authority = multiReq.getParameter("authority");
			String name = multiReq.getParameter("name");
			String phone = multiReq.getParameter("phone");
			
			
			
			// 3. 값 세팅
			MemberVO member = new MemberVO();
			member.setId(id);
			member.setPwd(pwd);
			member.setEmail(email);
			member.setAuthority(authority);
			member.setName(name);
			member.setPhone(phone);
			
			// 4. 파일 처리
			// 4-1. 기존 사진 변경 유무 확인
			String uploadPicture = multiReq.getParameter("uploadPicture");
			if(uploadPicture != null && !uploadPicture.isEmpty()) { // 변경
				
				// 4-1-1. 저장 경로
				String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
				File file = new File(uploadPath);
				file.mkdirs();
				
				// 4-1-2. 기존 이미지 삭제
				File deleteFile = new File(uploadPath, multiReq.getParameter("oldPicture"));
				if(deleteFile.exists()) deleteFile.delete();
				
				// 4-1-3. 최근 이미지 저장
				List<File> fileList = SaveFileResolver.fileUpload(multiReq.getFileItems("picture"), uploadPath);
				File saveFile = fileList.get(0);
				
				member.setPicture(saveFile.getName());
			}else {// 변경X 
				member.setPicture(multiReq.getParameter("oldPicture"));
			}
			
			// 5. DB처리
			memberService.modify(member);
			request.setAttribute("member", member);
			
			// 6. 로그인 사용자 확인
//			request.setAttribute("parentReload", false);
			
			HttpSession session = request.getSession();
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if(loginUser != null && member.getId().equals(loginUser.getId())) {
				request.setAttribute("parentReload", true);
				session.setAttribute("loginUser", memberService.getMember(id));
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		}catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST);
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
		
	}

}
