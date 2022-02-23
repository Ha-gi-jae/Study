package kr.or.ddit.cmm.controller;

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

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;

@WebServlet("/filedownload.do")
public class FileDownloadServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		long fileId = req.getParameter("fileId") != null ? fileId = Long.parseLong(req.getParameter("fileId")) : -1;
		
		int fileSn = req.getParameter("fileSn") != null ? fileSn = Integer.parseInt(req.getParameter("fileSn")) : 1;
		
		// 파일 정보 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO fileVO = new AtchFileVO();
		fileVO.setAtchFileId(fileId);
		fileVO.setAtchFileId(fileSn);
		
		fileVO = fileService.getAtchFileDetail(fileVO);
		
		// 파일 다운로드 처리를 위한 응답헤더 정보 설정하기
		resp.setContentType("application/octet-stream"); //MIME타입중하나 바이너리 데이터중 하나임.
		
		// +문자 공백 처리 
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileVO.getOrignlFileNm(), "UTF-8").replaceAll("\\+", "%20")+"\"");
				//attchment를 안하면 inline이 default. 저걸 쓰는 순간 강제로 파일을 떨굼! 강제로 내가 파일이름 설정하고 싶으면 filename써서 오리지날이름으로가져오고 위처럼 리플레이스 해주면된다. 스페이스를 적절하게 처리해주게 해주는거임. 없으면 어떻게 되는지 아니까 한번 주석 걸고 해보면됨. %20이 스페이스바 라고하네. 인코딩 관련된거니까 그냥 알아만두기
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(fileVO.getFileStreCours()));
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
		// 파일 다운 한번 해보기.
		int c = -1;
		while((c = bis.read()) != -1) {
			bos.write(c);
		}
		
		bis.close();
		bos.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
