package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.AdminreServiceImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IAdminreService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.AdminreVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class SelectSuggestBoard
 */
@WebServlet("/SelectSuggestBoard.do")
public class SelectSuggestBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectSuggestBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id_chk=0;
		String mem_id = (String) session.getAttribute("mem_id");
		int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
		
		IBoardService service = BoardServiceImpl.getInstance();
		int chk = service.countView(adminboard_id);
		BoardVO bv = service.selectBoard(adminboard_id);
		
		if(bv.getMem_id().equals(session.getAttribute("mem_id"))||mem_id.equals("admin")) {
			id_chk=1;
			
			//id_chk가 1일때 조회된 답글 세팅
			IAdminreService service2 = AdminreServiceImpl.getInstance();
			List<AdminreVO> list = service2.selectResponse(adminboard_id);
			/*System.out.println(list.get(0).getAdminboard_id());
			System.out.println(list.get(0).getAdminre_content());
			System.out.println(list.get(0).getAdminre_date());
			System.out.println(list.get(0).getMem_id());
			System.out.println(list.get(0).getMem_name());*/
			request.setAttribute("list", list);
				
			
		}
		
		/*System.out.println("suggest답글(mem_id):"+mem_id);
		System.out.println("suggest답글(adminboard_id):"+adminboard_id);
		*/
		System.out.println("id_chk:"+id_chk);
		
		request.setAttribute("id_chk", id_chk);
		request.setAttribute("bv", bv);
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("board_id", adminboard_id);
		
		request.getRequestDispatcher("/whole/board/SelectSuggestBoard.jsp").forward(request, response);
		
		
		
	}

}
