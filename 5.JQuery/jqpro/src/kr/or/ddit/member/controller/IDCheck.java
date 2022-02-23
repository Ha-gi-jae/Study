package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class IDCheck
 */
@WebServlet("/IDCheck.do") // url
public class IDCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 클라이언트 요청시 전송데이터를 받는다.
		String userId = request.getParameter("id");
		
		// 1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		// 2. service 메소드 호출하기
		String selectId  =  service.selectById(userId);
		// 3. 결과값을 request에 저장
		request.setAttribute("id", selectId);
		// 4. jsp로 forward - idcheck.jsp 1005에 할거임.
		request.getRequestDispatcher("1005/idcheck.jsp").forward(request, response);
		
	}

}
