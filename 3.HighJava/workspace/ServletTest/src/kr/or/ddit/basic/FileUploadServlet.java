package kr.or.ddit.basic;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/upload")
public class FileUploadServlet extends HttpServlet{
	
	private static final String UPLOAD_DIR = "upload_files";
	// 메모리 임계크기( 이 크기가 넘어가면 레파지토리 위치에 임시파일로 저장됨.)
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
	// 파일 1개당 최대 크기
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 40;
	// 요청 파일 최대 크기
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 50;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 인코딩 타입이 multipart/form-data 인 경우...       form-data를 multipart로 나누겠다.  
		if(ServletFileUpload.isMultipartContent(req)) { 
			
			// 폼 필드값 저장용 맵 선언
			Map<String, String> formMap = new HashMap<String, String>();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			factory.setRepository(new File("d:/D_Other/temp")); // 임시저장공간설정
			
			ServletFileUpload upload = new ServletFileUpload(factory); 
			upload.setFileSizeMax(MAX_FILE_SIZE); // 업로드 몇 MB까지 가능하게? ( 파일 하나의 최대 크기)
			upload.setSizeMax(MAX_REQUEST_SIZE); // 한번에 날릴때 최대 몇MB까지 ( 여러개 보낼경우 모든 파일의 크기의합)
			
			// 웹 애플리케이션 루트 디렉토리 기준 업로드 설정하기.
//			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR; // 실제 파일업로드경로 구분자가 마지막에 붙어서 생략.
			String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR; // 실제 파일업로드경로
			
			//
			
			// "" 기본경로 가져오는것 / 와 같다. 
			
			System.out.println("uploadPath => " + uploadPath);
			// 여기까지 설명해주셨음.
			
			File uploadDir = new File(uploadPath);
			if(!uploadDir.exists()) { // 파일 있는지 체크. 없으면 mkdir로 만들어주기.
				uploadDir.mkdir();
			}
			
			try {
				List<FileItem> formItems = upload.parseRequest(req);
				
				if(formItems != null && formItems.size() > 0) {
					for(FileItem item : formItems) {
						if(!item.isFormField()) { // 파일인 경우...     isFormField 폼 필드냐?. 아니면 File임.
							
							// 전체 경로를 제외한 파일명만 추출하기
							String fileName = new File(item.getName()).getName(); // 경로에있는 파일명 추출하려고.
							
							String filePath = uploadPath + File.separator + fileName;
							
							File storeFile = new File(filePath);
							item.write(storeFile); // 업로드 파일 저장
						}else { // 폼데이터 인 경우...
							// 폼필드의 값이 한글인 경우에는 해당 문자열을 적절히 변환해주어야 한다.
							formMap.put(item.getFieldName(), item.getString("UTF-8")); // 이름과 value. (필드명, utf-8로 문자열(값)을 가져옴) 
						}
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			for(Entry<String, String> entry : formMap.entrySet()) {
				System.out.println("파라미터 명 : " + entry.getKey());
				System.out.println("파라미터 값 : " + entry.getValue());
			}
			
			resp.setContentType("text/html");
			resp.getWriter().print("업로드 완료 됨.!!!");
		}
	}
}














