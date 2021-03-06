package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MsgVO;

/**
 * Servlet implementation class selectMsgPage
 */
@WebServlet("/selectMsgPage.do")
public class selectMsgPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectMsgPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int msg_num = Integer.parseInt(request.getParameter("msg_chk"));
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		MsgVO mv = new MsgVO();
		
		mv = service.selectMsg(msg_num);
		
		request.setAttribute("msgVO", mv);
		
		request.getRequestDispatcher("/WEB-INF/whole/member_jsp/selectMsgPage.jsp")
														.forward(request, response);
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}

}
