package kr.or.ddit.clboard.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.clboard.service.BoardServiceImpl;
import kr.or.ddit.clboard.service.IBoardService;
import kr.or.ddit.clboard.vo.ClBoardVO;

/**
 * Servlet implementation class UpdateBoard
 */
@WebServlet("/clUpdateBoard.do")
public class UpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		ClBoardVO bv = new ClBoardVO();
		try {
			BeanUtils.populate(bv, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		service.updateBoard(bv);
		
		request.setAttribute("adminboard_id", bv.getAdminboard_id());
		
		request.getRequestDispatcher("/WEB-INF/class/clBoard_jsp/ClUpdateBoard.jsp").forward(request, response);
	}

}
