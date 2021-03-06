package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class ListBoard
 */
@WebServlet("/ListBoard.do")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 페이지 번호
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		String board_title_id = request.getParameter("group");
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		//mem_group조회
		IMemberService memservice = MemberServiceImpl.getInstance();
		
		String mem_group = memservice.memGroup(mem_id);
		
		request.setAttribute("mem_group", mem_group);
		
		
		System.out.println("mem_id:"+mem_id);
	
		// 1.서비스 객체 생성하기
		IBoardService service = BoardServiceImpl.getInstance();

		// 1.2 페이징 객체 생성
		int totalCnt = service.selectTotalCnt(board_title_id);
		String endDate = service.getClassEndDate(mem_id);
		
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(10);
		pv.setTotalCount(totalCnt);
		pv.setGroup(board_title_id);
		// 2. group에 해당하는 boardList
		List<BoardVO> boardList = service.groupByAllBoard(pv); 
		String board_title_name = service.getBoardTitle(board_title_id);
		
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("class_end", endDate);
		request.setAttribute("pv", pv);
		request.setAttribute("board_title_id", board_title_id);
		request.setAttribute("board_title_name", board_title_name);
		request.setAttribute("boardList", boardList);

		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/ListBoard.jsp").forward(request, response);
	}
}
