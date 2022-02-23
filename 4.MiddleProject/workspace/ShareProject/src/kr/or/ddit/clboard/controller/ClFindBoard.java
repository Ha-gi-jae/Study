package kr.or.ddit.clboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.clboard.service.BoardServiceImpl;
import kr.or.ddit.clboard.service.IBoardService;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.clboard.vo.PagingVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class ClFindBoard
 */
@WebServlet("/ClFindBoard.do")
public class ClFindBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClFindBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ClBoardVO> list = null;
		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String board_title_id = request.getParameter("group");
		//요청 페이지 번호
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		/////////////////////////////////////
		//mem_group 가져오기
		IMemberService memservice = MemberServiceImpl.getInstance();
		
		String mem_group = memservice.memGroup(mem_id);
		
		///////////////////////////////////
		System.out.println("게시판검색:"+board_title_id);
		
		String field = "title";
		
		
		if(field_ != null) field = field_;
		String query = "";
		if(query_ != null) query = query_;
		
		
		IBoardService service = BoardServiceImpl.getInstance();
		//int totalCnt= service.selectTotalCnt(board_title_id);
		String endDate = service.getClassEndDate(mem_id);
		
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setClboard_title("");
		pv.setClboard_content("");
		
		pv.setPageSize(10);
		pv.setGroup(board_title_id);
		
		String board_title_name = service.getBoardTitle(board_title_id);
		
		
		////////////////////////////////////////////////////////////////
		if(field.equals("title")) {
			ClBoardVO cv = new ClBoardVO();
			cv.setBoard_title_id(board_title_id);
			
			pv.setBoard_title_id(board_title_id);
			System.out.println("0.board_title_id:"+pv.getBoard_title_id());
			pv.setClboard_title(query);
			pv.setTotalCount(service.findCltitleCount(query));
			
			list = service.findClTitle(pv);
			System.out.println("1:"+query);
			System.out.println("4:"+list.size());
			
		}else if(field.equals("content")) {
			ClBoardVO cv = new ClBoardVO();
			cv.setBoard_title_id(board_title_id);
			
			pv.setBoard_title_id(board_title_id);
			pv.setClboard_content(query);
			pv.setTotalCount(service.findclcontentCount(query));
			
			list = service.findClContent(pv);
			System.out.println("1:"+query);
			System.out.println("4:"+list.size());
		}
		System.out.println("2:"+field);
		System.out.println("3:"+query);
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("pv", pv);
		request.setAttribute("board_title_id", board_title_id);
		request.setAttribute("board_title_name", board_title_name);
		request.setAttribute("clBoardList", list);
		request.setAttribute("mem_group", mem_group);
		//System.out.println("boardList:"+list.get(0).getBoard_title());
		
		request.getRequestDispatcher("/WEB-INF/class/clBoard_jsp/ClListBoard.jsp").forward(request, response);
		
	}

}
