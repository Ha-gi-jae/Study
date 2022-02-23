package kr.or.ddit.cal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cal.service.CalServiceImpl;
import kr.or.ddit.cal.service.ICalService;

/**
 * Servlet implementation class TtDelete
 */
@WebServlet("/TtDelete.do")
public class TtDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TtDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ttid = Integer.parseInt(request.getParameter("id"));
		
		ICalService service = CalServiceImpl.getInstance();
		
		int cnt = service.ttDelete(ttid);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/cal_jsp/result.jsp").forward(request, response);
	}

}
