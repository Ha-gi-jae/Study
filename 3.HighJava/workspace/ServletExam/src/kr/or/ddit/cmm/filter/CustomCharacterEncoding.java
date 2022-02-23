package kr.or.ddit.cmm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CustomCharacterEncoding implements Filter{

	private String encoding = "";
	
	@Override
	public void init(FilterConfig config) throws ServletException { // 인코딩 정보 초기화 작업
		if(config.getInitParameter("encoding") == null) {
			this.encoding = "UTF-8";
		}else {
			this.encoding = config.getInitParameter("encoding");
		}
		
	}
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {
		
		System.out.println("인코딩 정보 설정 : " + encoding);
		req.setCharacterEncoding(encoding); // 요청 인코딩 정보 설정
		resp.setCharacterEncoding(encoding); // 응답 인코딩 정보 설정
		
		fc.doFilter(req, resp);
	}


}
