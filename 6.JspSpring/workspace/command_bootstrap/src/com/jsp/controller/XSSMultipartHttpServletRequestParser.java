package com.jsp.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;

import com.josephoconnell.html.HTMLInputFilter;
import com.jsp.exception.NotMultipartFormDataException;

public class XSSMultipartHttpServletRequestParser extends MultipartHttpServletRequestParser {

	// 상속 관계를 맺을때 생성자를 가져오지않음.
	// 즉, 상속 관계가 맺어지려면 자식클래스에서 부모 클래스의 생성자를 호출해야함.
	
	// 컴파일할때 기본생성자만듬.
	// 일단 부모꺼 만들어야해!
	// 우리가 생성자를 줘야함.
	
	// 부모꺼 생성자를 줘야햔다.
	public XSSMultipartHttpServletRequestParser(HttpServletRequest request, int memory_threshold, int max_file_size, int max_request_size) throws NotMultipartFormDataException, UnsupportedEncodingException, FileUploadException {
		super(request, memory_threshold, max_file_size, max_request_size); 
		
		
	}
	
	public String getXSSParameter(String paramName) {
		String result = HTMLInputFilter.htmlSpecialChars(getParameter(paramName));
		return result;
	}
	
	public String[] getXSSParameterValues(String paramName) {
											// 부모에서 만든 getter
		String[] paramValues = new String[getParamString().get(paramName).size()];
		for(int i = 0; i < paramValues.length; i++) {
			paramValues[i] = HTMLInputFilter.htmlSpecialChars(getParamString().get(paramName).get(i));
		}
		return paramValues;
	}
	
}
