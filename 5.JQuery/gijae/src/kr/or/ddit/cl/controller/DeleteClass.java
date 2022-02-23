package kr.or.ddit.cl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cl.service.ClassServiceImpl;
import kr.or.ddit.cl.service.IClassService;

/**
 * Servlet implementation class DeleteClass
 */
@WebServlet("/DeleteClass")
public class DeleteClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String classId = request.getParameter("class_id");
		
		IClassService service = ClassServiceImpl.GetService();
		
		int cnt = service.deleteClass(classId);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("member/result.jsp").forward(request, response);
	}

}
