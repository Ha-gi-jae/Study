package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.lprod.vo.LprodVO;

/**
 * Servlet implementation class LprodList
 */
@WebServlet("/LprodList.do") // 클래스이름은 중요하지않아. 웹서블릿 저 괄호안이 중요해. 저게 바로 url 이란다.
public class LprodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LprodList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 클라이언트 요청(전송)시 데이터 전달 
		
		// 1. service객체 얻는다.
		ILprodService service = LprodServiceImpl.getService();
		
		// 2. service메소드 호출한다. - 결과값을 받는다.
		List<LprodVO> list = service.selectAllItem();
		
		// 3. 결과값을 request에 저장한다.
		request.setAttribute("list", list); // 키 값 list!!
		
		
		// 4. jsp로 forward 한다.
		RequestDispatcher disp = request.getRequestDispatcher("1001/lprodList.jsp"); // 여기 틀려도 404 오류난다.
		disp.forward(request, response);
		
	}

}











