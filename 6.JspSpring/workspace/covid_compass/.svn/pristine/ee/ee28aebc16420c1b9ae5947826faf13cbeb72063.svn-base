package com.spring.compass.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.compass.vo.MberVO;

public class CheckLoginUserFilter implements Filter {

	private List<String> exURLs = new ArrayList<String>();
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String excludeURLNames = filterConfig.getInitParameter("exclude");
		
		StringTokenizer st = new StringTokenizer(excludeURLNames, ",");
		while(st.hasMoreTokens()) {
			exURLs.add(st.nextToken().trim());
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String from = httpRequest.getParameter("from");
		
		if(from != null && from.equals("remove")) {
			chain.doFilter(request, response);
			return;
		}
		
		// 제외할 URL 확인
		String requestUrl = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
		
		if(excludeCheck(requestUrl)) {
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession session = httpRequest.getSession();
		MberVO loginUser = (MberVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			httpResponse.setContentType("text/html;charset=utf-8");
			PrintWriter out = httpResponse.getWriter();
			
			out.println("<script>");
			out.println("alert('로그인한 회원만 이용가능합니다.');");
			out.println("if(window.opener){window.close(); window.opener.parent.location.href='"+ httpRequest.getContextPath() + "/';}else{ window.parent.location.href='" + httpRequest.getContextPath()+"/';}");
			out.println("</script>");
			out.close();
		}else {
			chain.doFilter(request, response);
		}
	}
	
	private boolean excludeCheck(String url) {
		boolean result = false;
		result = result || url.length() <= 1;
		
		for(String exURL : exURLs) {
			result = result || url.contains(exURL);
		}
		
		return result;
	}

	@Override
	public void destroy() {}

}
