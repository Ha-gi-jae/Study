package kr.or.ddit.comp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comp.service.CompServiceImpl;
import kr.or.ddit.comp.service.ICompService;

/**
 * Servlet implementation class DeleteComp
 */
@WebServlet("/DeleteComp.do")
public class DeleteComp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteComp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		
		ICompService service = CompServiceImpl.getInstance();
		
		int cnt = service.delteComp(adminboard_id);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/comp_jsp/result.jsp").forward(request, response);
	}

}
