package kr.or.ddit.adminReport.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminReport.service.AdminReportServiceImpl;
import kr.or.ddit.adminReport.service.IAdminReportService;
import kr.or.ddit.adminReport.vo.AdminReportVO;
import kr.or.ddit.board.vo.PagingVO;

/**
 * Servlet implementation class SelectAllReport
 */
@WebServlet(urlPatterns = "/SelectAllReport.do", loadOnStartup = 1)
public class SelectAllReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		String adminboard_id = request.getParameter("adminboard_id");
		
		IAdminReportService service = AdminReportServiceImpl.GetService();
		

		//페이징
		int totalCnt = service.reportSize();
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(15);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(3);
		pv.setTotalCount(totalCnt);
		
		List<AdminReportVO> list = service.groupByAllReport(pv);
		
		List<AdminReportVO> list2 = service.reportcontent();
		
		List<AdminReportVO> board = service.boardcontent();
		List<AdminReportVO> classboard =  service.clboardcontent();
		
		request.setAttribute("board", board);
		request.setAttribute("classboard", classboard);

		request.setAttribute("reportcontent", list2);
		
		request.setAttribute("pv", pv);
		request.setAttribute("allreportlist", list);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/SelectAllReport.jsp").forward(request, response);
	}

}
