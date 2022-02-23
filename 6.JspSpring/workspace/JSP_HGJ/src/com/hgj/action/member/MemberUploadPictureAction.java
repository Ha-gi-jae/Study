package com.hgj.action.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import com.hgj.action.Action;
import com.hgj.exception.NotMultipartFormDataException;
import com.hgj.utils.GetUploadPath;
import com.hgj.utils.MultipartHttpServletRequestParser;
import com.hgj.utils.SaveFileResolver;

public class MemberUploadPictureAction implements Action {

	private static final int MEMORY_THRESHOLD = 1024 * 500;
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1;
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 2;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String url = null;
		
		String uploadFileName = null;
		
		try {
			MultipartHttpServletRequestParser multi = new MultipartHttpServletRequestParser(request, MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
			
			String uploadPath = GetUploadPath.getUploadPath("member.picture.upload");
			
			FileItem[] items = multi.getFileItems("pictureFile");
			
			List<File> uploadFiles = SaveFileResolver.fileUpload(items, uploadPath);
			
			uploadFileName = uploadFiles.get(0).getName();
			
			String oldPicture = multi.getParameter("oldPicture");
			
			File oldFile = new File(uploadPath + File.separator + oldPicture);
			
			if(oldFile.exists()) oldFile.delete();
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(uploadFileName);
			
			
		} catch (NotMultipartFormDataException e) {
			response.sendError(response.SC_BAD_REQUEST);
		} catch (FileUploadException e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		} catch (Exception e) {
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return url;
	}

}
