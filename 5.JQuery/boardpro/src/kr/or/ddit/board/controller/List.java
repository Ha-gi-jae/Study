package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;

/**
 * Servlet implementation class List
 */
@WebServlet("/List.do")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. service객체 얻어온다.
		// 2. service 메서드 호출한다. - 결과값 받기
		// 3. 결과값을 request에 저장
		// 4. jsp로 forward 
		
		//전체리스트 가져오기
		IBoardService service = BoardServiceImpl.getService();
		java.util.List<BoardVO> list = service.selectAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/board/list.jsp").forward(request, response);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 페이지별 리스트 가져오기
		
		// 0. 클라이언트 요청시 전송되는 데이터 가져오기 - page.
		int spage = Integer.parseInt(req.getParameter("page"));
		
		IBoardService service = BoardServiceImpl.getService();
		
		// 페이지 출력하는거
		// 찍을 갯수
		int perList = 5;
		// 밑에 보여줄 페이지
		int perPage = 3;
		// 전체 페이지 수 구하기 - 전체 글 갯수를 알아야 한다.
		int count  = service.listCount();
		//올림 처리.
		int totalPage = (int) (Math.ceil(count / (double) perList));
		int startPage = ( (spage - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		// 글 출력하는 거
		// spage 의 값에 따라서 start end값이 변경 spage가 1일때는 스타트1   2일때는 6   3일때는 11
		int start = (spage - 1) * perList + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		java.util.List<BoardVO> list = service.selectByPage(map);
		
		req.setAttribute("listPage", list);
		
		
		req.setAttribute("spage", startPage);
		req.setAttribute("epage", endPage);
		req.setAttribute("tpage", totalPage);
		req.setAttribute("curpage", spage);
		
		req.getRequestDispatcher("/board/listPage.jsp").forward(req, resp);
	}

}
