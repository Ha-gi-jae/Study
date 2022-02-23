package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.AdminreServiceImpl;
import kr.or.ddit.board.service.IAdminreService;

/**
 * Servlet implementation class DeleteAdminreBoard
 */
@WebServlet("/DeleteAdminreBoard.do")
public class DeleteAdminreBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminreBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminre_num = Integer.parseInt(request.getParameter("adminre_num"));
		IAdminreService service = AdminreServiceImpl.getInstance();
		
		int cnt = service.deleteResponse(adminre_num);
		
		request.setAttribute("result", cnt);
		request.getRequestDispatcher("/whole/board/DeleteAdminreBoard.jsp").forward(request, response);
		
	}

}
