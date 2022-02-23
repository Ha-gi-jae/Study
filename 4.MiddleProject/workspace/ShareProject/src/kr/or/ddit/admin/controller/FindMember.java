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
 * Servlet implementation class FindMember
 */
@WebServlet("/FindMember.do")
public class FindMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindMember() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<AdminVO> list = null;
		
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		
		String field = "title";
		if (field_ != null)
			field = field_;
		
		String query = "";
		if (query_ != null)
			query = query_;

		IAdminService service = AdminServiceImpl.GetService();

		PagingVO pv = new PagingVO();
		
		// 페이징
		if (field.equals("class")) {
			int totalCnt = service.findclasssize(query);
			pv.setCountPerPage(18);
			pv.setCurrentPageNo(pageNo);
			pv.setPageSize(5);
			pv.setTotalCount(totalCnt);
			pv.setClass_id(query);
			list = service.groupByFindCls(pv);
		}
		
		if (field.equals("group")) {
			int totalCnt = service.findgroupsize(query);
			pv.setCountPerPage(18);
			pv.setCurrentPageNo(pageNo);
			pv.setPageSize(5);
			pv.setTotalCount(totalCnt);
			pv.setMem_group(query);
			list = service.groupByFindGroup(pv);
		}
		if (field.equals("name")) {
			int totalCnt = service.findnamesize(query);
			pv.setCountPerPage(18);
			pv.setCurrentPageNo(pageNo);
			pv.setPageSize(5);
			pv.setTotalCount(totalCnt);
			pv.setMem_name(query);
			list = service.groupByFindName(pv);
		}
		
		request.setAttribute("field", field);
		request.setAttribute("pv", pv);
		request.setAttribute("memberList", list);
		request.getRequestDispatcher("/whole/admin/admin_jsp/SelectFindMember.jsp").forward(request, response);

	}
}
