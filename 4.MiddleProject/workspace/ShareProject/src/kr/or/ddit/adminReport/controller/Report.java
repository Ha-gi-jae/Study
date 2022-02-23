package kr.or.ddit.adminReport.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.adminReport.service.IReportService;
import kr.or.ddit.adminReport.service.ReportService;
import kr.or.ddit.adminReport.vo.ReportVO;

/**
 * Servlet implementation class Report
 */
@WebServlet("/Report.do")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		ReportVO vo = new ReportVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IReportService service = ReportService.getInstance();
		
		int cnt = service.insertReport(vo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/report_jsp/InsertReport.jsp").forward(request, response);
	}

}
