package kr.or.ddit.buyer.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ByName
 */
@WebServlet("/ByName.do") // 클래스 이름과 서블릿이름이 같아도되고 달라도 된다. ajax > url : 'ByName.do' 써야함. 클래스 이름이아닌 서블릿 이름 작성!!!!! 
public class ByName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ByName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. // 요청 전송시 데이터를 받는다 - 현재는 없다
		
		// 1. service 객체 얻어오기.
		IBuyerService service = BuyerServiceImpl.GetService(); // getService한걸 service가 받음.

		// 2. service 메서드 호출하기. - 결과 값 받기 ( List 냐 VO냐)
		List<BuyerVO> list = service.selectByName();
		
		// 3. 결과값을 request에 저장.
		request.setAttribute("list", list); // "키", value 
		
		// 4. jsp로 forward - 출력 or json데이터를 생성
		RequestDispatcher disp = request.getRequestDispatcher("0930/buyerNames.jsp"); // jsp 이름 줘야함 괄호안에. 폴더명/
		disp.forward(request, response); // 리퀘스트, 리스폰스 주면 된다.
		
		
		
		
	}

}
