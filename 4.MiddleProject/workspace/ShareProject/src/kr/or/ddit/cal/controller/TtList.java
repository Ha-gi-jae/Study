package kr.or.ddit.cal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cal.service.CalServiceImpl;
import kr.or.ddit.cal.service.ICalService;
import kr.or.ddit.cal.vo.TtVO;

/**
 * Servlet implementation class TtList
 */
@WebServlet("/TtList.do")
public class TtList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TtList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ICalService service = CalServiceImpl.getInstance();
		
		List<TtVO> list = service.selectTt();
		
		HttpSession ss = request.getSession();

		String admin = (String)ss.getAttribute("mem_id");
		
		String mem_goup = service.mem_group(admin);
		
		request.setAttribute("mem_goup", mem_goup);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/WEB-INF/whole/cal_jsp/ttList.jsp").forward(request, response);
	}

}
