package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class InsertBoard
 */
@WebServlet("/InsertBoard.do")
public class InsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		BoardVO bv = new BoardVO();
		
		try {
			BeanUtils.populate(bv, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		

		bv.setMem_id(mem_id);
		bv.setBoard_title(bv.getBoard_title().replaceAll("<", "&lt;").replaceAll("\"", "&quot;").replaceAll("'", "&#39;").replaceAll("\\\\", "&#92;"));
		bv.setBoard_content(bv.getBoard_content().replaceAll("<", "&lt;").replaceAll("\"", "&quot;").replaceAll("'", "&#39;").replaceAll("\\\\", "&#92;").replaceAll("\n", "<br>"));

		/////////////////////////
		//???????????? ????????? ?????????(??????)
		System.out.println("????????????: "+bv.getAdminboard_id());
		System.out.println("????????????: "+bv.getBoard_title_id());
		
		////////////////////////
		
		IBoardService service = BoardServiceImpl.getInstance();
		int num = service.InsertBoard(bv);
		
		request.setAttribute("adminboard_id", num);
		
		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/InsertBoard.jsp").forward(request, response);
	}

}
