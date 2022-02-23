package kr.or.ddit.at.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.board.service.AdminreServiceImpl;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IAdminreService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.AdminreVO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.member.vo.MemVO;

/**
 * Servlet implementation class SelectAtBoard
 */
@WebServlet("/SelectAtBoard.do")
public class SelectAtBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAtBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int adminboard_id = Integer.parseInt(request.getParameter("board_id"));
		
		//답글조회
		IAdminreService reservice = AdminreServiceImpl.getInstance();
		List<AdminreVO> reList = reservice.selectResponse(adminboard_id);
		
		request.setAttribute("reList", reList);
		
		String boardtitle_id = request.getParameter("boardtitle_id");
		int id_chk = 0;
		
		HttpSession session = request.getSession();
		
		IBoardService service = BoardServiceImpl.getInstance();
		int chk = service.countView(adminboard_id);
		BoardVO bv = service.selectBoard(adminboard_id);
		
		MemVO mv = (MemVO) session.getAttribute("mem");
		
		if(bv.getMem_id().equals(session.getAttribute("mem_id"))) {
			id_chk = 1;
		}
		
		IAtchFileService fileservice = AtchFileServiceImpl.getInstance();
		int atch_file_id = fileservice.selectAtchId(adminboard_id);

		
		List<AtVO> fileList = new ArrayList<>();
		if(atch_file_id > 0) {
			AtVO atVO = new AtVO();
			
			atVO.setAtch_file_id(atch_file_id);
			
			fileList = fileservice.getAtchFileList(atVO);
			
		}
		
	
		request.setAttribute("fileList", fileList);
		request.setAttribute("mv", mv);
		request.setAttribute("board_title_id", boardtitle_id);
		request.setAttribute("bv", bv);
		request.setAttribute("id_chk", id_chk);
		
		request.getRequestDispatcher("/WEB-INF/whole/at_jsp/SelectBoard.jsp").forward(request, response);
	}

	

}
