package kr.or.ddit.buyer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;

/**
 * Servlet implementation class BuyerDetail
 */
@WebServlet("/BuyerDetail.do") //url
public class BuyerDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 클라이언트 요청시 id값을 가져온다.
		String bid = request.getParameter("id");
		
		// 1. service객체 얻어온다.
		IBuyerService service = BuyerServiceImpl.GetService();
		
		// 2. service 메서드 호출한다. - 결과값 받기
		BuyerVO vo = service.selectDetail(bid);
		
		// 3. 결과값을 request에 저장
		request.setAttribute("bid", vo);
		
		// 4. jsp로 forward 
		RequestDispatcher disp = request.getRequestDispatcher("0930/buyerDetail.jsp"); // jsp 줘야함.
		disp.forward(request, response);
	}

}
