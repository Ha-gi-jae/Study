package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;

/**
 * Servlet implementation class NoticeDeleteBoard
 */
@WebServlet("/NoticeDeleteBoard.do")
public class NoticeDeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		
		INotiBoardService service = NotiBoardServiceImpl.getInstance();
		
		int cnt = service.NoticeDelete(adminboard_id);
		
		request.setAttribute("result", cnt);
	
		request.getRequestDispatcher("/WEB-INF/whole/whNoticeBoard_jsp/NotiDeleteBoard.jsp").forward(request, response);
		
		
	}

}
