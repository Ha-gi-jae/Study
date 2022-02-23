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
import kr.or.ddit.admin.vo.PagingVO;

/**
 * Servlet implementation class SelectList
 */
@WebServlet("/SelectList.do")
public class SelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SelectList() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		IAdminService service = AdminServiceImpl.GetService();
		
		int totalCnt = service.memSize();
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(15);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(5);
		pv.setTotalCount(totalCnt);
		
		List<AdminVO> list = service.selectList(pv);
		
		request.setAttribute("pv", pv);
		request.setAttribute("List", list);
		
		request.getRequestDispatcher("/admin/admin_jsp/SelectList.jsp").forward(request, response);
	}

}
