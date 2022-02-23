package com.jsp.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
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

public class CheckEnabledMemberFilter implements Filter {

	private Set<String> checkUrlsSet = new HashSet<String>();
	
	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String requestURI = httpRequest.getRequestURI();
		String endPoint = requestURI.split("/")[requestURI.split("/").length-1];
		
		String result="";
		
		if(checkUrlsSet.contains(endPoint)) {
			HttpSession session = httpRequest.getSession();
			MemberVO member = (MemberVO)session.getAttribute("loginUser");
			
			if(member == null) { // 인증 필요
				result += "<script>"
						+ "alert('로그인이 필요합니다.');"
						+ "location.href='"+httpRequest.getContextPath()+"/common/login';"
						+ "</script>";
			}else {
			
				int enabled = member.getEnabled();
				
				switch (enabled) {
				case 1: // 활성 상태
					chain.doFilter(request, response);
					return;
				case 0: // 비활성 상태
					result += "<script>"
							+ "alert('비활성상태로 사용에 제한됩니다.');";
					if(request.getParameter("cw") != null && request.getParameter("cw").equals("t")) {
						result += "window.close();";
					}else {
						result += "history.go(-1);";
					}
					result += "</script>";
					break;
				}
			}
			httpResponse.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(result);
			
		}else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		String checkUrlsParam = fConfig.getInitParameter("checkUrl");
		
		StringTokenizer token = new StringTokenizer(checkUrlsParam, ",");
		
		while(token.hasMoreTokens()) {
			checkUrlsSet.add(token.nextToken());
		}
	}

}
