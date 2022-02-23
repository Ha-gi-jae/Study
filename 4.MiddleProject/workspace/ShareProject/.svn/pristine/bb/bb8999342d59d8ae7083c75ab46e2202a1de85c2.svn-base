package kr.or.ddit.clat.controller;

import java.io.IOException;
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
import kr.or.ddit.clboard.vo.ClBoardVO;

/**
 * Servlet implementation class SelectAtBoard
 */
@WebServlet("/SelectClAtBoard.do")
public class SelectClAtBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectClAtBoard() {
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
		
		kr.or.ddit.clboard.service.IBoardService service = kr.or.ddit.clboard.service.BoardServiceImpl.getInstance();
		
		int chk = service.countView(adminboard_id);
		
		ClBoardVO vo = service.selectBoard(adminboard_id);
		
		String mem_id = (String) session.getAttribute("mem_id");
		
		if(vo.getMem_id().equals(session.getAttribute("mem_id"))) {
			id_chk = 1;
		}
		
		IAtchFileService fileservice = AtchFileServiceImpl.getInstance();
		int atch_file_id = fileservice.selectAtchId(adminboard_id);
		List<AtVO> fileList = null;
		if(atch_file_id > 0) {
			AtVO atVO = new AtVO();
			
			atVO.setAtch_file_id(atch_file_id);
			
			fileList = fileservice.getAtchFileList(atVO);
			
		}
		
		request.setAttribute("fileList", fileList);
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("board_title_id", boardtitle_id);
		request.setAttribute("cv", vo);
		request.setAttribute("id_chk", id_chk);
		  
		request.getRequestDispatcher("/WEB-INF/whole/at_jsp/ClSelectBoard.jsp").forward(request, response);
	}

	

}
