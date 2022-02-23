package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

@WebServlet("/listmember")
public class ListMember extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
		String keyWord = request.getParameter("keyWord") == null ? "" : request.getParameter("keyWord");
		
		IMemberService service = MemberServiceImpl.getService();
		
		PagingVO pv = new PagingVO();
		
		
		pv.setSearchType(searchType);
		pv.setKeyWord(keyWord);
		
		int totalCnt = service.memSize(pv);

		pv.setCountPerPage(15);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(5);
		pv.setTotalCount(totalCnt);
		
		List<MemberVO> list = service.listMember(pv);
		
		request.setAttribute("pv", pv);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/ListMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
