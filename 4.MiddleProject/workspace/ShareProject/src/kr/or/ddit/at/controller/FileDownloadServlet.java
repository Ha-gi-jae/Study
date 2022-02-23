package kr.or.ddit.at.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;

@WebServlet("/filedownload.do")
public class FileDownloadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long fileId = req.getParameter("fileId") != null ? Long.parseLong(req.getParameter("fileId")) : -1;
		int fileSn = req.getParameter("fileSn") != null ? Integer.parseInt(req.getParameter("fileSn")) : 1;
		
		// 파일정보조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtVO atchFileVO = new AtVO();
		atchFileVO.setAtch_file_id(fileId);
		atchFileVO.setFile_sn(fileSn);
		
		atchFileVO = fileService.getAtchFileDetail(atchFileVO);
		
		// 파일 다운로드 처리를 위한 응답헤더 정보 설정하기
		resp.setContentType("application/octet-stream");
		
		// 문자 공백처리
		// 이 값을 잘 적어둬야 파일이 잘 다운된다
		resp.setHeader("Content-Disposition", "attachment; filename=\"" 
		+ URLEncoder.encode(atchFileVO.getOrignl_file_nm(), "UTF-8").replaceAll("\\+", "%20") +"\"");
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(atchFileVO.getFile_stre_cours()));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		
		int c = -1;
		while((c = bis.read()) != -1) {
			bos.write(c);
		}
		bos.close();
		bis.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
