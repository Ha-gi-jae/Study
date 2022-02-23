package kr.or.ddit.adminReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminReport.service.AdminReportServiceImpl;
import kr.or.ddit.adminReport.service.IAdminReportService;

/**
 * Servlet implementation class ClBoardBlind
 */
@WebServlet("/ClBoardBlind.do")
public class ClBoardBlind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClBoardBlind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String adminboard_id = request.getParameter("adminboard_id");
		
		IAdminReportService service = AdminReportServiceImpl.GetService();
		
		int cnt = service.clboardblind(adminboard_id);
		int cnt2 = service.blindchange(adminboard_id);
		
		request.setAttribute("result", cnt);
		request.setAttribute("result2", cnt2);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/blindresult.jsp").forward(request, response);	}
}
