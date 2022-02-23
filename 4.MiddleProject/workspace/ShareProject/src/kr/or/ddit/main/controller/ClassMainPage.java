package kr.or.ddit.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.main.service.IMIniService;
import kr.or.ddit.main.service.MiniService;
import kr.or.ddit.member.vo.MemVO;

/**
 * Servlet implementation class ClassMainPage
 */
@WebServlet("/ClassMainPage.do")
public class ClassMainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassMainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMIniService service = MiniService.getInstance();
		HttpSession session = request.getSession();
		MemVO mv = (MemVO) session.getAttribute("mem");
		List<ClBoardVO> clFreeList = service.clFreeMini();
		List<ClBoardVO> clQnaList = service.clQnaMini();
		List<ClBoardVO> clNotiList = service.clNotiMini();
		
		request.setAttribute("mv", mv);
		request.setAttribute("clFreeList", clFreeList);
		request.setAttribute("clQnaList", clQnaList);
		request.setAttribute("clNotiList", clNotiList);
		
		request.getRequestDispatcher("/Real_Final_Pages/ClassMain.jsp").forward(request, response);
	}

}
