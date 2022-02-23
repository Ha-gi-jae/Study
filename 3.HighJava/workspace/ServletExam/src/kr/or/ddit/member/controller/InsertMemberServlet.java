package kr.or.ddit.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

// 어노테이션으로 xml에 안 적고 쓸 수 있게 하기 (두개 다 하면 오류(충돌)나니까 하나만 할것.
@WebServlet("/member/insert.do") // 타입요소가 value일 경우 value=을 생략할 수 있다. >> @WebServlet(value="/member/insert.do")
public class InsertMemberServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/insertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//insert하는 시점에 get방식으로 url이 날라온다면 사용자가 get방식(링크타거나 enter) => 인서트하러왔구나.
		// 인서트폼 솨사삭 서브밋 하면 post 으로 ~ 자료 가져와서 솨~
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		// Multipart가 맞는지 확인...
		if(((FileUploadRequestWrapper)req).isMultipartContent()) { // 캐스팅으로 req를 바꿔줘서 Multipart인지 확인.
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			Map<String, FileItem[]> fileItemMap = ((FileUploadRequestWrapper)req).getFileItemMap(); //Multipart 파싱작업이 되었다면 FileItemMap이 가능.
			
			System.out.println("파일 아이템 크기 => " + fileItemMap.size());
			
			if(fileItemMap.size() > 0) { // 파일이 존재함
				try {
					atchFileVO = fileService.saveAtchFileList(fileItemMap); // DB에 insert까지 끝나있고 업로드 및 저장 다 된거임.
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		// 1. 요청 파라미터 정보 가져오기
		String memId = req.getParameter("memId");
		String memName = req.getParameter("memName");
		String memTel = req.getParameter("memTel");
		String memAddr = req.getParameter("memAddr");
		
		// 2. 서비스 객체 생성하기
		IMemberService memService = MemberServiceImpl.getInstance();
		
		// 3. 회원정보 등록
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemName(memName);
		mv.setMemTel(memTel);
		mv.setMemAddr(memAddr);
		mv.setAtchFileId(atchFileVO.getAtchFileId()); // VO에 넣어줬기때문에 빼올수 있음.
		
		int cnt = memService.registerMember(mv);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		req.setAttribute("msg", msg);
		
		// 4. 목록 화면으로 이동
//		req.getRequestDispatcher("/member/list.do").forward(req, resp); // 다른 서블릿에게 토스! 사용자와 상관없이 모듈끼리 전달전달. 1번 요청.
		// controller를 거쳐야함.
		
		// 목록조회화면으로 리다이렉트. 사용자한테 이 주소로 요청 하게.
		String redirectUrl = req.getContextPath() + "/member/list.do?msg=" + URLEncoder.encode(msg, "UTF-8");
		
		resp.sendRedirect(redirectUrl); // (사용자에게 강제시킴. - 2번 요청)
	}
}
