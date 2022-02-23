package kr.or.ddit.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.web.servlet.View;

import com.jsp.utils.MakeFileName;

public class FileDownloadView implements View {

	 
	// APPLICATION_OCTET 이거 우리 친적 있음 비교햐봐
	private String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE; // 무조건 다운로드 시킴(?) 얘까 아님 밑에까?
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	@Override
	public String getContentType() {
		return this.contentType;
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		 
		String savedPath = (String) model.get("savedPath");
		String fileName = (String) model.get("fileName");
		
		// 보낼 파일 설정
		File downloadFile = new File(savedPath + File.separator + fileName);
		FileInputStream inStream = new FileInputStream(downloadFile);
		
		// 파일 포맷으로 MIME를 결정한다. 이게 없으면 무조건 다운로드를 한다.  
		ServletContext context = request.getServletContext();
		String mimeType = context.getMimeType(downloadFile.getName()); 
		if(mimeType != null) this.contentType = mimeType;
		// getMimeType() 파일명을 넣어주면 mimeType에 맞게 만들어줌. 다운이 되지않고.(?) 여튼 위 에 얘네들 설정없으면 다운만된다.
		// mime로 세팅을 안하면 pdf가 열리지 않고 다운이된다. 근데 세팅을 하면 pdf가 다운이 되지않고 열리게된다. 근데 거기에 맞는 mimeType을 줘야함.
		// 고의적으로 무조건 다운되게 할 수도있긴함.
		
		// response 수정.
		response.setContentType(mimeType);
		response.setContentLength((int)downloadFile.length());
		
		String headerKey = "Content-Disposition";
		
		// 한글깨짐 방지 : ISO-8859-1
		String sendFileName = MakeFileName.parseFileNameFromUUID(downloadFile.getName(), "\\$\\$");
		
		String header = request.getHeader("User-Agent");
		if(header.contains("MSIE")) {
			sendFileName = URLEncoder.encode(sendFileName, "UTF-8");
		}else {
			sendFileName = new String(sendFileName.getBytes("utf-8"), "ISO-8859-1");
		}
		
		String headerValue = String.format("attachment; filename=\"%s\"", sendFileName);
		response.setHeader(headerKey, headerValue);
		
		// 파일내보내기
		OutputStream outStream = response.getOutputStream();
		
		byte[] buffer = new byte[4096];
		int bytesRead = -1;
		
		while((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, bytesRead);
		}
		
		inStream.close();
		outStream.close();
	}

}
