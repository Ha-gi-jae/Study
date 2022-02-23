package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;
import kr.or.ddit.board.vo.NoticeVO;

/**
 * Servlet implementation class NoticeUpdateBoard
 */
@WebServlet("/NoticeUpdateBoard.do")
public class NoticeUpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기까지옴");
		int adminboard_id =Integer.parseInt(request.getParameter("adminboard_id"));
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		System.out.println("updateNotice어드민아이디:"+adminboard_id);
		System.out.println("updateNotice타이틀:"+notice_title);
		System.out.println("updateNotice내용:"+notice_content);
		
		NoticeVO  nv = new NoticeVO();
		
		nv.setAdminboard_id(adminboard_id);
		nv.setNotice_title(notice_title);
		nv.setNotice_content(notice_content);
		
		INotiBoardService service = NotiBoardServiceImpl.getInstance();
		
		int cnt = service.noticeUpdate(nv);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/member_jsp/result.jsp").forward(request, response);
		
		
		
	}

}
