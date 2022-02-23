package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberJoin")
public class MemberJoin extends HttpServlet {
	
	private static final String UPLOAD_DIR = "upload_files";
	
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 512;
	
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 216;
	
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 512;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
