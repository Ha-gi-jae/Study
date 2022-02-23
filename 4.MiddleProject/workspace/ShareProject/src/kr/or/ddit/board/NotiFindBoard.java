package kr.or.ddit.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.dao.NotiBoardDaoImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

/**
 * Servlet implementation class NotiFindBoard
 */
@WebServlet("/NotiFindBoard.do")
public class NotiFindBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotiFindBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<NoticeVO> list = null;
		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String board_title_id = request.getParameter("group");
		//요청 페이지 번호
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		///////////////////////////////////
		System.out.println("게시판검색:"+board_title_id);
		
		String field = "title";
		
		
		if(field_ != null) field = field_;
		String query = "";
		if(query_ != null) query = query_;
		
		
		
		INotiBoardService service = NotiBoardServiceImpl.getInstance();
		
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setNotice_content("");
		pv.setNotice_title("");
		
		pv.setPageSize(10);
		
		
		
		
		if(field.equals("title")) {
			
			//공지사항 검색하는 쿼리 따로 만들어줘야함.
			NoticeVO nv = new NoticeVO();
			pv.setNotice_title(query);
			pv.setTotalCount(service.findtitleCount(query));
			
			list=service.findTitle(pv);
			
			System.out.println("1:"+query);
			
		}else if(field.equals("content")) {
			NoticeVO nv = new NoticeVO();
			pv.setNotice_content(query);
			pv.setTotalCount(service.findcontentCount(query));
			
			list=service.findContent(pv);
			
			System.out.println("1:"+query);
		}
		System.out.println("2:"+field);
		System.out.println("3:"+query);
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("pv", pv);
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/WEB-INF/whole/whNoticeBoard_jsp/NotiListBoard.jsp").forward(request, response);
		
	}

}
