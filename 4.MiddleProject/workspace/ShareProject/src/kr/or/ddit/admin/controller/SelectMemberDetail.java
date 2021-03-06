package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;

/**
 * Servlet implementation class SelectMemberDetail
 */
@WebServlet("/SelectMemberDetail.do")
public class SelectMemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId");
		
		IAdminService service = AdminServiceImpl.GetService();
		
		AdminVO vo = service.selectMemberDetail(memId);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/SelectMemberDetail.jsp").forward(request, response);
	}

}
