package kr.or.ddit.clboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.clboard.service.BoardServiceImpl;
import kr.or.ddit.clboard.service.IBoardService;
import kr.or.ddit.clboard.vo.ClBoardVO;

/**
 * Servlet implementation class SelectBoard
 */
@WebServlet("/clSelectBoard.do")
public class SelectBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		int id_chk = 0;
		String boardtitle_id = request.getParameter("boardtitle_id");
		HttpSession session = request.getSession();
		
		IBoardService service = BoardServiceImpl.getInstance();
		int chk = service.countView(adminboard_id);
		ClBoardVO bv = service.selectBoard(adminboard_id);
		
		if(bv.getMem_id().equals(session.getAttribute("mem_id"))) {
			id_chk = 1;
		}
		
		request.setAttribute("board_title_id", boardtitle_id);
		request.setAttribute("bv", bv);
		request.setAttribute("id_chk", id_chk);
		
		request.getRequestDispatcher("/WEB-INF/class/clBoard_jsp/ClSelectBoard.jsp").forward(request, response);
	}

}
