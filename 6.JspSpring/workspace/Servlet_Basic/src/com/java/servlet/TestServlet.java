package com.java.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{
	
	@Override
	public void destroy() {
		System.out.println("destroy...");
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init...");
		String message = config.getInitParameter("message");
		System.out.println(message);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println("doGet()");
	}
	
	@Override // 부모에 있는걸 재 정의하겠다는걸 선언.
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("doPost");
	}
	
}