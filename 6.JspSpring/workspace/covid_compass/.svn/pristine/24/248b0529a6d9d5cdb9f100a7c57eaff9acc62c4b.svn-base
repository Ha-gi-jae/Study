package com.spring.compass.filter;

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

import com.spring.compass.vo.MberVO;

public class CheckEnabledMemberFilter implements Filter{

	private Set<String> checkUrlsSet = new HashSet<String>();
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String checkUrlsParam = filterConfig.getInitParameter("checkUrl");
		
		StringTokenizer token = new StringTokenizer(checkUrlsParam, ",");
		
		while(token.hasMoreTokens()) {
			checkUrlsSet.add(token.nextToken());
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		String requestURI = httpRequest.getRequestURI();
		
		String endPoint = requestURI.split("/")[requestURI.split("/").length-1];
		
		String result = "";
		
		if(checkUrlsSet.contains(endPoint)) {
			HttpSession session = httpRequest.getSession();
			MberVO mber = (MberVO) session.getAttribute("loginUser");
			
			if(mber == null) {
				result += "<script>"
						+ " alert('로그인이 필요합니다.');"
						+ "location.href='"+ httpRequest.getContextPath()+"/common/login';"
						+ "</script>";
			}else {
				String enabled = mber.getUseYn();
				
				switch (enabled) {
				case "Y":
					chain.doFilter(request, response);
					return;
				case "N":
					result += "<script>"
							+ "alert('비활성상태로 사용에 제한됩니다.');"
							+ "history.go(-1);"
							+ "</script>";
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
	public void destroy() {
		
	}

}
