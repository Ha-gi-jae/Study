package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;

/**
 * Servlet implementation class SelectBoard
 */
@WebServlet("/NotiSelectBoard.do")
public class NotiSelectBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotiSelectBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		int id_chk = 0;
		HttpSession session = request.getSession();
		
		IBoardService service = BoardServiceImpl.getInstance();
		////////////////////////////////////////////////////////////
		int chk = service.countView(adminboard_id);
		//notice 조회 수정 
		INotiBoardService service2 = NotiBoardServiceImpl.getInstance();
		
		System.out.println("adminboard_id: "+adminboard_id);
		
		NoticeVO nv = service2.selectNotiBoard(adminboard_id);
		System.out.println("title:"+nv.getNotice_title());
		System.out.println("content:"+nv.getNotice_content());
		request.setAttribute("nv", nv);
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("NoticeSelect(mem_id): "+mem_id);
		request.setAttribute("mem_id", mem_id);
		/////////////////////////////////////////////////////////////
		
		
		//BoardVO bv = service.selectBoard(adminboard_id);
		
		/*System.out.println("selectBoard(mem_id):"+mem_id);
		
		if(bv.getMem_id().equals(session.getAttribute("mem_id"))) {
			id_chk = 1;
		}
		
		
		System.out.println("selectBoard(session):"+session.getAttribute("admin_id"));
		
		request.setAttribute("bv", bv);
		request.setAttribute("id_chk", id_chk);*/
		
		request.getRequestDispatcher("/WEB-INF/whole/whNoticeBoard_jsp/NotiSelectBoard.jsp").forward(request, response);
	}

}
