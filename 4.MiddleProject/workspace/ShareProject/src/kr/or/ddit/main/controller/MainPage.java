package kr.or.ddit.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.main.service.IMIniService;
import kr.or.ddit.main.service.MiniService;

/**
 * Servlet implementation class MainMiniList
 */
@WebServlet("/MainPage.do")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMIniService service = MiniService.getInstance();
		
		List<BoardVO> freeList = service.freeMini();
		List<NoticeVO> notiList = service.notiMini();
		
		request.setAttribute("freeList", freeList);
		request.setAttribute("notiList", notiList);
		
		request.getRequestDispatcher("/Real_Final_Pages/Main.jsp").forward(request, response);
	}

}
