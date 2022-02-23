package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class DeleteSelectMsg
 */
@WebServlet("/DeleteSelectMsg.do")
public class DeleteSelectMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSelectMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msg_num = Integer.parseInt(request.getParameter("msg_num"));
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		int cnt = service.deleteMsg(msg_num);
		
		request.setAttribute("deleteMsg", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/member_jsp/deleteMessage.jsp").forward(request, response);
		
	}

}
