package kr.or.ddit.cal.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cal.service.CalServiceImpl;
import kr.or.ddit.cal.service.ICalService;
import kr.or.ddit.cal.vo.CalVO;

/**
 * Servlet implementation class Cal
 */
@WebServlet("/Cal.do")
public class Cal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Service객체 열기
		ICalService service = CalServiceImpl.getInstance();
		
		// 2. Service메소드 호출하기 - 결과값 받아오기
		List<CalVO> list = service.calenList();
		
		// 3. 결과값을 저장하기
		request.setAttribute("list", list);
		
		// 4. forward하기 
		request.getRequestDispatcher("/WEB-INF/whole/cal_jsp/calen.jsp").forward(request, response);
	}

}
