package kr.or.ddit.comp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.vo.PagingVO;
import kr.or.ddit.comp.service.CompServiceImpl;
import kr.or.ddit.comp.service.ICompService;
import kr.or.ddit.comp.vo.CompPagingVO;
import kr.or.ddit.comp.vo.CompVO;

/**
 * Servlet implementation class CompList
 */
@WebServlet("/CompList.do")
public class CompList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		ICompService service = CompServiceImpl.getInstance();
		
		int total = service.countComp();
		
		CompPagingVO pv = new CompPagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		pv.setPageSize(10);
		pv.setTotalCount(total);
		
		List<CompVO> list = service.selectPage(pv);
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("pv", pv);
		request.setAttribute("boardList", list);
		
		request.getRequestDispatcher("/WEB-INF/whole/comp_jsp/CompListBoard.jsp").forward(request, response);

	}

	

}
