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
import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

/**
 * Servlet implementation class ListBoard
 */
@WebServlet("/NotiListBoard.do")
public class NotiListBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NotiListBoard() {
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
		
		System.out.println("mem_id:"+mem_id);
	
		// 1.서비스 객체 생성하기
		IBoardService service = BoardServiceImpl.getInstance();

		// 1.2 페이징 객체 생성
		//int totalCnt = service.selectTotalCnt(board_title_id);
		
		INotiBoardService service2 = NotiBoardServiceImpl.getInstance();
		
		int totalCnt = service2.noticeSize();
		
		System.out.println("NoticeList 총사이즈:"+totalCnt);
		
		String endDate = service.getClassEndDate(mem_id);
		
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(10);
		pv.setTotalCount(totalCnt);
		pv.setGroup(board_title_id);
		pv.setNotice_title("");
		pv.setNotice_content("");
		// 2. group에 해당하는 boardList
		List<NoticeVO> boardList = service.allNotiBoard(pv); 
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("pv", pv);
		request.setAttribute("boardList", boardList);

		request.getRequestDispatcher("/WEB-INF/whole/whNoticeBoard_jsp/NotiListBoard.jsp").forward(request, response);
	}
}
