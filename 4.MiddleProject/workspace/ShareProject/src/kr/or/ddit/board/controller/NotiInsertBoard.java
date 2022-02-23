package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.dao.INotiBoardDao;
import kr.or.ddit.board.service.INotiBoardService;
import kr.or.ddit.board.service.NotiBoardServiceImpl;
import kr.or.ddit.board.vo.NoticeVO;

/**
 * Servlet implementation class NotiInsertBoard
 */
@WebServlet("/NotiInsertBoard.do")
public class NotiInsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotiInsertBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String admin_id = (String) session.getAttribute("admin_id");
		
		NoticeVO nv = new NoticeVO();
		
		try {
			BeanUtils.populate(nv, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		nv.setNotice_title(nv.getNotice_title().replaceAll("<", "&lt;").replaceAll("\"", "&quot;").replaceAll("'", "&#39;").replaceAll("\\\\", "&#92;"));
		nv.setNotice_content(nv.getNotice_content().replaceAll("<", "&lt;").replaceAll("\"", "&quot;").replaceAll("'", "&#39;").replaceAll("\\\\", "&#92;").replaceAll("\n", "<br>"));
		
		INotiBoardService service = NotiBoardServiceImpl.getInstance();
		
		int cnt = service.insertNotice(nv);
		
		request.setAttribute("adminboard_id", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/NotiInsertBoard.jsp").forward(request, response);
		
		
	}

}
