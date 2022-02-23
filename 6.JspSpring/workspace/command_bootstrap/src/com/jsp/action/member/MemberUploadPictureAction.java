package com.jsp.action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.jsp.action.Action;
import com.jsp.controller.MultipartHttpServletRequestParser;
import com.jsp.controller.SaveFileResolver;
import com.jsp.exception.NotMultipartFormDataException;
import com.jsp.utils.GetUploadPath;

public class MemberUploadPictureAction implements Action {
	
	// 업로드 파일 환경 설정
	private static final int MEMORY_THRESHOLD = 1024 * 500; // 500KB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1; // 1MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2; // 2MB

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = null; // 보여줄 화면이 없다.

		String uploadFileName = null;
		
		try {
			// 1. request 변환
			MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			// 2. 저장할 경로
			String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
			
			// 3. 업로드된 이미지 저장
			FileItem[] items = multi.getFileItems("pictureFile");
			
			List<File> uploadFiles = SaveFileResolver.fileUpload(items, uploadPath);
			
			uploadFileName = uploadFiles.get(0).getName(); // 여기서는 사용만
			
			// 4. 이전 이미지 삭제
			String oldPicture = multi.getParameter("oldPicture");
			// commons로 가져온거는 request.getParameter가 안되기 때문에 1번에서 wrapping해줌. 그래서 사용가능.
			File oldFile = new File(uploadPath + File.separator + oldPicture);
			
			if(oldFile.exists()) {
				oldFile.delete();
			}
			
			// 5. 저장한 파일명 보내기
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(uploadFileName);
			
		} catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST); // 400 => ajax로 빠짐. 요청을 잘못
		} catch (FileUploadException e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR); // 500
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}
		
		return url;
	}

	
}
