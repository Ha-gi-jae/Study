package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateAdminreBoard
 */
@WebServlet("/UpdateAdminreBoard.do")
public class UpdateAdminreBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminreBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int id_chk =0;
		//현재 접속자 확인
		String mem_id = (String) session.getAttribute("mem_id");
		//답글 작성자 아이디
		String remem_id = request.getParameter("remem_id");
		if(mem_id.equals(remem_id)) {
			id_chk=1;
		}
		System.out.println("updatere(IDCHK):"+id_chk);
		
		request.setAttribute("id_chk", id_chk);
		request.getRequestDispatcher("/whole/board/UpdateAdminreBoard.jsp").forward(request, response);
		
	}

}
