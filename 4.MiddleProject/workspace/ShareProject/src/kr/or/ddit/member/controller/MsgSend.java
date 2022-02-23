package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MsgVO;

/**
 * Servlet implementation class MsgSend
 */
@WebServlet("/MsgSend.do")
public class MsgSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String msg_to = (String) session.getAttribute("mem_id");
		
		String msg_from = request.getParameter("msg_from");
		
		String msg_content = request.getParameter("msg_content");
		
		msg_content=(msg_content.replaceAll("\n", "<br>"));
	
		msg_content = msg_content.trim();
		
		MsgVO mv = new MsgVO();
		
		mv.setMsg_content(msg_content);
		mv.setMsg_from(msg_from);
		mv.setMsg_to(msg_to);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.senMsg(mv);
		
		request.setAttribute("sendMsg", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/member_jsp/sendMessage.jsp").forward(request, response);
		
		
		
		
		
	}

}
