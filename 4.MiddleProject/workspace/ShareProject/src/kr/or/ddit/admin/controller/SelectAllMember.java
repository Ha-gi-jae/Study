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
import kr.or.ddit.board.vo.PagingVO;

/**
 * Servlet implementation class SelectAllMember
 */
@WebServlet("/SelectAllMember.do")
public class SelectAllMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		IAdminService service = AdminServiceImpl.GetService();
		
		// 페이징
		int totalCnt = service.memSize();
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(18);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(3);
		pv.setTotalCount(totalCnt);
		
		List<AdminVO> list = service.groupByAllMem(pv);

		System.out.println(pageNo);
		
		
		request.setAttribute("pv", pv);
		request.setAttribute("memberList", list);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/SelectAllMember.jsp").forward(request, response);
	}

}
