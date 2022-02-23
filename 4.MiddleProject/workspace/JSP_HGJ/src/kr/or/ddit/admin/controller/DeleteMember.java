package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/DeleteMember.do")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		IAdminService service = AdminServiceImpl.GetService();
		
		int cnt = 0;
		String chk = request.getParameter("chk");
		String[] num = chk.split(",");
		for(int i = 0; i < num.length; i++) {
			String mem_id = num[i];
			cnt = service.deleteMember(mem_id);
		}
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("admin/admin_jsp/result.jsp").forward(request, response);
	}

}
