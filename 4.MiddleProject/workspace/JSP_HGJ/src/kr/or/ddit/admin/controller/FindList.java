package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;

/**
 * Servlet implementation class FindList
 */
@WebServlet("/FindList.do")
public class FindList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		List<AdminVO> list = null;
		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		
		
		String field = "title";
		if(field_ != null) field = field_;
		
		String query = "";
		if (query_ != null) query = query_;
		
		IAdminService service = AdminServiceImpl.GetService();
		
		if(field.equals("name")) {
			list = service.selectName(query);
		}
		if(field.equals("id")) {
			list = service.selectId(query);
		}
		if(field.equals("phone")) {
			list = service.selectPhone(query);
		}
		if(field.equals("email")) {
			list =service.selectEmail(query);
		}
		
		request.setAttribute("field", field);
		request.setAttribute("List", list);
		request.getRequestDispatcher("/admin/admin_jsp/SelectFindList.jsp").forward(request, response);
		
	}

}
