package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdServlet
 */
@WebServlet("/ProdServlet.do")
public class ProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//lprod_gu를 파라미터로 해서 prod_id와 prod_name을 가져오기.
		// 0. 클라이언트 요청시 전송데이터를 받는다 - lprod_gu를 가져와야함.
		String lgu = request.getParameter("lprod_gu"); // 이게 html에서 data에 들어감 "" 안에.
		
		// 1. service 객체 얻어오기
		IProdService service = ProdServiceImpl.getService();
				
		// 2. service3메소드 호출 - 결과값 받기
		List<ProdVO> list = service.selectProdByLgu(lgu);
		// 3. 결과값을 Rquest에 저장
		request.setAttribute("list", list);
		// 4. jsp로 forward
		RequestDispatcher disp = request.getRequestDispatcher("1001/prodNames.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// prod_id를 파라미터로 해서 상세보기를 수행한다.
		// 0. 클라이언트 요청시 전송데이터를 받는다 - prod_id를 가져와야함.
		String pid = request.getParameter("prod_id");
		// 1. service 객체 얻어오기
		IProdService service = ProdServiceImpl.getService();
		// 2. service3메소드 호출 - 결과값 받기
		ProdVO vo = service.selectByIddetail(pid);
		// 3. 결과값을 Rquest에 저장
		request.setAttribute("vo", vo);
		// 4. jsp로 forward
		RequestDispatcher disp = request.getRequestDispatcher("1001/prodDetail.jsp");
		disp.forward(request, response);
	}
		
}


