package kr.or.ddit.clat.controller;

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
import kr.or.ddit.board.service.IAdminreService;
import kr.or.ddit.board.vo.AdminreVO;
import kr.or.ddit.clboard.service.BoardServiceImpl;
import kr.or.ddit.clboard.service.IBoardService;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.member.vo.MemVO;

/**
 * Servlet implementation class SelectAtBoard
 */
@WebServlet("/SelectClAtHomeworkBoard.do")
public class SelectClAtHomeworkBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectClAtHomeworkBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int adminboard_id = Integer.parseInt(request.getParameter("board_id"));
		String boardtitle_id = request.getParameter("boardtitle_id");
		MemVO mv = (MemVO) session.getAttribute("mem"); 
		IAdminreService reservice = AdminreServiceImpl.getInstance();
		IBoardService service = BoardServiceImpl.getInstance();
		IAtchFileService fileservice = AtchFileServiceImpl.getInstance();

		
		ClBoardVO bv = service.selectBoard(adminboard_id);
		int id_chk = 0;
		if(bv.getMem_id().equals(mv.getMem_id())) {
			id_chk = 1;
		}
		
		int atch_file_id = fileservice.selectAtchId(adminboard_id);

		List<AtVO> fileList = new ArrayList<>();
		if(atch_file_id > 0) {
			AtVO atVO = new AtVO();
			
			atVO.setAtch_file_id(atch_file_id);
			
			fileList = fileservice.getAtchFileList(atVO);
		}
		
		//답글조회
		List<AdminreVO> reList = reservice.selectResponse(adminboard_id);
	
		request.setAttribute("fileList", fileList);
		request.setAttribute("mv", mv);
		request.setAttribute("reList", reList);
		request.setAttribute("board_title_id", boardtitle_id);
		request.setAttribute("bv", bv);
		request.setAttribute("id_chk", id_chk);
		
		request.getRequestDispatcher("/WEB-INF/class/homeworkboard_jsp/SelecthwBoard.jsp").forward(request, response);
	}

	

}
