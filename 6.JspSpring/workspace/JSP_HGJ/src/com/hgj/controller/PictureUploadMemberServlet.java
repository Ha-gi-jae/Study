package com.hgj.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.hgj.exception.NotMultipartFormDataException;
import com.hgj.utils.GetUploadPath;
import com.hgj.utils.MultipartHttpServletRequestParser;
import com.hgj.utils.SaveFileResolver;

public class PictureUploadMemberServlet extends HttpServlet {

	// 업로드 파일 환경 설정.
	private static final int MEMORY_THRESHOLD = 1024 * 500; // 500KB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1; // 1MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2; // 2MB
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = null; // 보여줄 화면이 없음.
		
		String uploadFileName = null;
		
		try {
			// request 변환
			MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			// 저장할 경로
			String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
			
			// 업로드된 이미지 저장
			FileItem[] items = multi.getFileItems("pictureFile");
			
			List<File> uploadFiles = SaveFileResolver.fileUpload(items, uploadPath);
			
			uploadFileName = uploadFiles.get(0).getName();
			
			// 이전 이미지 삭제
			String oldPicture = multi.getParameter("oldPicture");
			// commons로 가져온거는 request.getParameter가 안된다. 그래서 파싱해줬었던거임.
			
			File oldFile = new File(uploadPath + File.separator + oldPicture);
			
			if(oldFile.exists()) {
				oldFile.delete();
			}
			
			// 저장한 파일명 보내기
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(uploadFileName);
			
		} catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST);
		} catch (FileUploadException e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
	}

}
