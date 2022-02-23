package kr.or.ddit.interceptor;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jsp.dto.MemberVO;

public class LoginUserLogInterceptor extends HandlerInterceptorAdapter{ // 원래의 취지 Controller에 대한 관리 감독.

//	@Override // 컨트롤러 전
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception { // pre에서 false를 return 하면 controller가 실행하지 않고 빠진다.
//		// TODO Auto-generated method stub
//		return super.preHandle(request, response, handler);
//	}
	
	private String savePath="c:\\log";
	private String saveFileName = "login_user_log.csv";
	
	// XML에서 등록(Bean)할때 setMethod를 바꿔주면 된다.
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	@Override // 컨트롤러 끝난 후
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception { // Cotroller가 실행한거 받아준다.
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if(loginUser == null) return;
		
		// 로그인 정보를 스트링으로 저장.
		String tag = "[login:user]";
		String log = tag + loginUser.getId() + ", " + loginUser.getPhone() + ", " + loginUser.getEmail() + ", " + request.getRemoteAddr() + ", " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String logFilePath = savePath + File.separator + saveFileName;
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		// 로그를 기록
		out.write(log);
		out.newLine();
		
		out.close();
	}

//	@Override // 뷰 네임에서 넘어갈때
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//		super.afterCompletion(request, response, handler, ex);
//	}

	
}
