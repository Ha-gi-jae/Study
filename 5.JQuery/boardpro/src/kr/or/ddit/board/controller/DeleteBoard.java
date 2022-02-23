package kr.or.ddit.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;

/**
 * Servlet implementation class DeleteBoard
 */
@WebServlet("/DeleteBoard.do")
public class DeleteBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		IBoardService service = BoardServiceImpl.getService();
		
		int cnt = service.deleteBoard(num);
		
		// 삭제 후 페이지 전환
		int perList = 5; // 데이터가 더 많이 보여주고 싶으면 얘를 10로 바꿔주면됨. 리스트에서도 바꿔줘야함!
		int count = service.listCount();
		int totalPage = (int)(Math.ceil(count/ (double)perList));
	
		request.setAttribute("tpage", totalPage);
		
		request.setAttribute("result", cnt); // 성공 ~ 실패 ~ 
		
		request.getRequestDispatcher("board/delete.jsp").forward(request, response);
		
	}

}
