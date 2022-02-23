package com.spring.compass.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class SessionExpiredCheckFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String message = "중복 로그인이 확인되었습니다.\\n다시 로그인하면 다른 장치에서 로그인은 취소됩니다.";
		
		httpResponse.setContentType("text/html;charset=utf-8");
		PrintWriter out = httpResponse.getWriter();
		
		out.println("<script>");
		out.println("alert('"+message+"');");
		out.println("location.href='loginForm.do'");
		out.println("</script>");
	}

	@Override
	public void destroy() {
	}

}
