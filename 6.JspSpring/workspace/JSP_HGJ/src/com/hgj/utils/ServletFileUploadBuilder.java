package com.hgj.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.hgj.exception.NotMultipartFormDataException;

public class ServletFileUploadBuilder {

	// 인스턴스 인수가 없으니 static
	
	public static ServletFileUpload build(HttpServletRequest request, int MEMORY_THRESHOLD, int MAX_FILE_SIZE, int MAX_REQUEST_SIZE) throws NotMultipartFormDataException{
		
		// request 파일 첨부 여부 확인.
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new NotMultipartFormDataException();
			// Multipart 타입이 아니면 사용자 지정 Exception throw를 리턴.
		}
		return build(MEMORY_THRESHOLD, MAX_FILE_SIZE, MAX_REQUEST_SIZE);
		// Multipart 타입이니까  밑의 메서드로 리턴해서 빌드로 업로드 쿵쾅쿵쾅 셋팅 
	}
	
	public static ServletFileUpload build(int MEMORY_THRESHOLD, int MAX_FILE_SIZE, int MAX_REQUEST_SIZE) {
		
		// upload 환경설정 적용
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		// 저장을 위한 threshold 적용.
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 임시 저장 위치
		factory.setRepository(new File (System.getProperty("java.io.tmpdir")));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		upload.setFileSizeMax(MAX_FILE_SIZE); // 파일 크기 적용
		upload.setSizeMax(MAX_REQUEST_SIZE); // request 크기 적용
		
		return upload;
		// 쿵쾅쿵쾅 셋팅 다 되었으니까 upload 리턴해주기!
	}
	
}
