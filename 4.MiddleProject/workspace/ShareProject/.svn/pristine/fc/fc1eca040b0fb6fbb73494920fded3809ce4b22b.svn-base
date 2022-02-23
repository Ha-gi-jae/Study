package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.Array;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class DeleteMsg
 */
@WebServlet("/DeleteMsg.do")
public class DeleteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		
		
		int cnt=0;
		
		String chk = request.getParameter("chk");
		String[] num = chk.split(",");
		for(int i = 0 ; i < num.length;i++) {
			System.out.println(num[i]);
			int msg_num = Integer.parseInt(num[i]);
			cnt = service.deleteMsg(msg_num);
		}
		
		
		
		request.setAttribute("deleteMsg", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/member_jsp/deleteMessage.jsp")
		 													.forward(request, response);
		
			
	}
	
		
	

}
