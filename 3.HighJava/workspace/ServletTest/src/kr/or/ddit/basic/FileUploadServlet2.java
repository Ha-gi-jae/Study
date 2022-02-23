package kr.or.ddit.basic;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload2")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class FileUploadServlet2 extends HttpServlet {
	
	private static final String UPLOAD_DIR = "upload_files";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(req); multipart인지 아닌지에 따라  wrapper클래스를 써서.
		
		String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR; // 경로 초기화
		
		File uploadDir = new File(uploadPath);
		
		if(!uploadDir.exists()) { // 없으면 만들고.
			uploadDir.mkdir();
		}
		
		try {
			String fileName = "";
			
			for(Part part : req.getParts()) { // getParts : 파트를 가져와줌. 파트타입의 컬렉션 객체.
				
				fileName = getFileName(part); // 메서드로 뽑을거임. 파일이름을 얻어올거임.
				
				// 폼필드가 아니거나 파일이 비어있지 않은 경우...
				if(fileName != null && !fileName.equals("")) { // 파일을 선택 안한경우 => nullString
					part.write(uploadPath + File.separator + fileName); // 파일 저장
					System.out.println(uploadPath + File.separator + fileName + " 파일 업로드 완료!");
				}
			}
			
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		}
		
		System.out.println("파라미터 값 : " + req.getParameter("sender"));
		
		resp.setContentType("text/html");
		resp.getWriter().println("업로드 완료!!!");
		
	}
	
	/**
	 * Part 객체를 파싱하여 파일 이름 추출하기
	 * @param part Part 타입의 객체
	 * @return 파일명 : 파일명이 존재하지 않으면 null 리턴함(폼필드)
	 */
	private String getFileName(Part part) {
	/*
	 *  Content-Disposition 헤더에 대하여...
	 *  
	 *  1. resposne header에 사용되는 경우 ... ex) 파일 다운로드 
	 *     Content-Disposition : inline(default)
	 *     Content-Disposition : attachment => 파일 다운로드
	 *     Content-Disposition : attachment; filename = "filename.jpg"
	 *  	     						    => filename.jpg 이름으로 다운로드.
	 *  
	 *  2. multipart body를 위한 헤더정보로 사용되는 경우... ex) 파일 업로드
	 *     Content-Disposition : form-data
	 *     Content-Disposition : form-data; name="fieldName"
	 *     Content-Disposition : form-data; name="fieldName"; filename="filename.jpg"
	 */
		
		for(String content : part.getHeader("Content-Disposition").split(";")) { // Disposition : 배치 
			//form-data, name, filename이 추출됨.
			
			if(content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
				// filename으로 시작하면 if절에 걸려서 ""안에 있는거 filename.jpg 를 가져옴. 그래서 그걸 리턴.
			}
			
		}
		
		return null;
	}
}

















