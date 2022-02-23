package kr.or.ddit.comp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comp.service.CompServiceImpl;
import kr.or.ddit.comp.service.ICompService;
import kr.or.ddit.comp.vo.CompPagingVO;
import kr.or.ddit.comp.vo.CompVO;

/**
 * Servlet implementation class CompFindBoard
 */
@WebServlet("/CompFindBoard.do")
public class CompFindBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompFindBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CompVO> list =null;
		
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String board_title_id = request.getParameter("group");
		//요청 페이지 번호
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		HttpSession session = request.getSession();
		
		String mem_id = (String) session.getAttribute("mem_id");
		///////////////////////////////////
		System.out.println("게시판검색:"+board_title_id);
		
		String field = "title";
		
		
		if(field_ != null) field = field_;
		String query = "";
		if(query_ != null) query = query_;
		
		ICompService service = CompServiceImpl.getInstance();
		
		CompPagingVO pv = new CompPagingVO();
		pv.setCountPerPage(20);
		pv.setCurrentPageNo(pageNo);
		
		pv.setComp_name("");
		
		pv.setPageSize(10);
		
		if(field.equals("title")) {
			
			CompVO cv = new CompVO();
			pv.setComp_name(query);
			pv.setTotalCount(service.findCmtitleCount(query));
			
			list = service.findCmTitle(pv);
			
			System.out.println("1:"+query);
		}
		System.out.println("2:"+field);
		System.out.println("3:"+query);
		
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("pv", pv);
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/WEB-INF/whole/comp_jsp/CompListBoard.jsp").forward(request, response);
		
	}

}
