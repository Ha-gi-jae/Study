package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.vo.PagingVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class ListMemberServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청 페이지 번호
		int pageNo = req.getParameter("pageNo") == null ? 1: Integer.parseInt(req.getParameter("pageNo"));
		
		
		
		// 1. 서비스 객체 생성하기
		IMemberService memService = MemberServiceImpl.getInstance();
		
		// 1.2 페이징 객체 생성
		int totalCnt = memService.selectTotalCnt();
		PagingVO pagingVO = new PagingVO();
		pagingVO.setCountPerPage(10); // 한페이지에 10개씩 보여주겠다.
		pagingVO.setCurrentPageNo(pageNo); // 현재 페이지!
		pagingVO.setPageSize(15);
		pagingVO.setTotalCount(totalCnt);
		
		// 2. 회원정보 조회
		List<MemberVO> memList = memService.getAllMemberList(pagingVO);
		
		req.setAttribute("memList", memList); // 잠깐 저장(보관)
		// jsp에 흐름을 넘겨줘야 함. forward를 통해서. 일할 사람에게 전달~
		req.setAttribute("pagingVO", pagingVO);
		
		
		// 3. 뷰페이지로 전달
		req.getRequestDispatcher("/WEB-INF/views/member/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	
}
