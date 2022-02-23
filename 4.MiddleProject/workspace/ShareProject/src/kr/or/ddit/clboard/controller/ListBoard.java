package kr.or.ddit.clboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import kr.or.ddit.clboard.service.BoardServiceImpl;
import kr.or.ddit.clboard.service.IBoardService;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.clboard.vo.PagingVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemVO;

/**
 * Servlet implementation class ListBoard
 */
@WebServlet("/clListBoard.do")
public class ListBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 페이지 번호
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		String board_title_id = request.getParameter("group");
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		MemVO mv = (MemVO) session.getAttribute("mem");
		
		
		//String mem_id = "202107001"; 로그인 없이 사용할 때
		
		// 1.서비스 객체 생성하기
		IBoardService service = BoardServiceImpl.getInstance();
		IMemberService memservice = MemberServiceImpl.getInstance();

		// 1.2 페이징 객체 생성
		int totalCnt = service.selectTotalCnt(board_title_id);
		
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(10);
		pv.setTotalCount(totalCnt);
		pv.setGroup(board_title_id);
		
		// 2. group에 해당하는 boardList
		List<ClBoardVO> boardList = service.groupByAllBoard(pv); 
		String board_title_name = service.getBoardTitle(board_title_id);
		String mem_group = memservice.memGroup(mem_id);
		
		request.setAttribute("clBoardList", boardList);
		request.setAttribute("pv", pv);
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("board_title_id", board_title_id);
		request.setAttribute("board_title_name", board_title_name);
		request.setAttribute("mem_group", mem_group);

		
		request.getRequestDispatcher("WEB-INF/class/clBoard_jsp/ClListBoard.jsp").forward(request, response);
	}
}
