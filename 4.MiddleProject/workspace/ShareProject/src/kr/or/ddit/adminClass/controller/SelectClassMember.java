package kr.or.ddit.adminClass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adminClass.service.AdminClassServiceImpl;
import kr.or.ddit.adminClass.service.IAdminClassService;
import kr.or.ddit.adminClass.vo.AdminClassVO;
import kr.or.ddit.board.vo.PagingVO;

/**
 * Servlet implementation class SelectClassMember
 */
@WebServlet("/SelectClassMember.do")
public class SelectClassMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectClassMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String classid = request.getParameter("classid");

		// 페이징
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));

		IAdminClassService service = AdminClassServiceImpl.GetService();

		int totalCnt = service.ClassMemberSize(classid);
		PagingVO pv = new PagingVO();
		pv.setCountPerPage(18);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(5);
		pv.setTotalCount(totalCnt);
		pv.setClass_id(classid);
		
		List<AdminClassVO> list = service.groupByClassMember(pv);

		request.setAttribute("pv", pv);
		request.setAttribute("memberList", list);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/SelectClassMember.jsp").forward(request, response);
	}

}
