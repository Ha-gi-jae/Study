package kr.or.ddit.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.jsp.dto.MemberVO;
import com.jsp.utils.GetUploadPath;

public class ExceptionLoggerHelper { // catch에 해당하는 얘!
	
	public static void write(HttpServletRequest request, Exception e, Object obj) {
		String savePath = GetUploadPath.getUploadPath("error.log").replace("/", File.separator);
		
		String logFilePath = savePath + File.separator + "system_exception_log.csv";
		
		String url = request.getRequestURI().replace(request.getContextPath(), "");
		String date = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		String loginUserName = ((MemberVO) request.getSession().getAttribute("loginUser")).getName();
		String exceptionType = e.getClass().getName();
		String happenObject = obj.getClass().getName();
		
		// null 싫으면 뒤에 e.getMessage 지워주면된다.
		String log = "[Error : " + exceptionType + "] " + url + ", " + date + ", " + loginUserName + ", " + happenObject + "\n" + e.getMessage(); 
		
		// 로그 파일 생성
		File file = new File(savePath);
		file.mkdirs();
		
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath,true)); // true 값을 줘야만 이어쓰기를 한다.
			
			//로그를 기록
			out.write(log);
			out.newLine(); // new Line을 해야 줄바꿈 한다. 안그럼 계속 옆으로 쓴다.
			
			out.close();
		}catch(IOException ex) {
			ex.printStackTrace();
		}
		
		
		
	}
}
