package com.jsp.filter;

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

import com.jsp.dto.MemberVO;

public class CheckLoginUserFilter implements Filter {

	private List<String> exURLs = new ArrayList<String>();
	
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpResp = (HttpServletResponse) response;
		
		// 제외할 url 확인
		String reqUrl = httpReq.getRequestURI().substring(httpReq.getContextPath().length());
		
		if(excludeCheck(reqUrl)) {
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession session = httpReq.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		// login 확인
		if(loginUser == null) {// 비 로그인 상태
			httpResp.setContentType("text/html;charset=utf-8");
			PrintWriter out = httpResp.getWriter();
			out.print("<script>");
			out.print("alert('로그인은 필수입니다.');");
			out.print("if(window.opener){window.close();window.opener.parent.location.href='" + httpReq.getContextPath() +"/';}else{");
			out.print("window.parent.location.href='"+httpReq.getContextPath()+"/';");
			out.print("}");
			out.print("</script>");
			out.close();
		}else {// 로그인 상태
			chain.doFilter(request, response); // 통과
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		String excludeURLNames = fConfig.getInitParameter("exclude");
		
		StringTokenizer st = new StringTokenizer(excludeURLNames, ",");
		while(st.hasMoreTokens()) {
			exURLs.add(st.nextToken().trim());
		}
		
//		System.out.println(exURLs);
	}
	// index.jsp
	private boolean excludeCheck(String url) {
		boolean result = false;
		
		result = result | url.length() <= 1; 
		//제외 시켜야되면 True임.  root 면 / 날라온다. 위에서 contextPath짤랐으니까 그러므로 true. => 제외시켜야함.
		
		for(String exURL : exURLs) {
			result = result | url.contains(exURL);
		}
		return result;
	}
}
