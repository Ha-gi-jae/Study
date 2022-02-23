package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

/**
 * Servlet implementation class DeleteBoard
 */
@WebServlet("/DeleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		int num = service.deleteBoard(adminboard_id);
		
		request.setAttribute("num", num);
		
		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/DeleteBoard.jsp").forward(request, response);
	}

}
