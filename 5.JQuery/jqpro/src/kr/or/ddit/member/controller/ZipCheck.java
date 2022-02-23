package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class ZipCheck
 */
@WebServlet("/ZipCheck.do")
public class ZipCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Post에서는 인코딩 해줘야 한글이 깨지지 않는다.
		request.setCharacterEncoding("UTF-8");
		
		// 0. 클라이언트 요청시 전송데이터를 받는다 - dong
		String dong = request.getParameter("dong");
		
		// 1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		// 2. service 메소드 호출하기 - 결과값 가져오기
		List<ZipVO> zipCodeList = (List<ZipVO>) service.selectZipCode(dong);
		// 3. 결과값을 request에 저장 하기
		request.setAttribute("zipCodeList", zipCodeList);
		// 4. jsp로 forward - 1005/zipcode.jsp
		request.getRequestDispatcher("1005/zipcode.jsp").forward(request, response);
	}

}
