package kr.or.ddit.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.AdminreServiceImpl;
import kr.or.ddit.board.service.IAdminreService;
import kr.or.ddit.board.vo.AdminreVO;

/**
 * Servlet implementation class InsertAdminreBoard
 */
@WebServlet("/InsertAdminreBoard.do")
public class InsertAdminreBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminreBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminreVO av = new AdminreVO();
		
		try {
			BeanUtils.populate(av, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		System.out.println("adminboard_id:"+av.getAdminboard_id());
		System.out.println("adminre_content"+av.getAdminre_content());
		System.out.println("adminre_mem_id"+av.getMem_id());
		
		IAdminreService service = AdminreServiceImpl.getInstance();
		
		int cnt = service.insertAdminre(av);
		
		request.setAttribute("reInsert", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/AdminreInsert.jsp").forward(request, response);
		
	}*/
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminreVO av = new AdminreVO();
		
		try {
			BeanUtils.populate(av, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		
		
		
		//?????????mem_id??? ?????? ?????????
		/*if(av.getMem_id()==null) {
			HttpSession session = request.getSession();
			String mem_id = (String) request.getAttribute("mem_id");
			av.setMem_id(mem_id);
		}*/
		
		String rep = av.getAdminre_content().replaceAll("<", "&lt;").replaceAll("\"", "&quot;").replaceAll("'", "&#39;").replaceAll("\\\\", "&#92;").replaceAll("\n", "<br>");
		av.setAdminre_content(rep);
		
		IAdminreService service = AdminreServiceImpl.getInstance();
		
		int cnt = service.insertAdminre(av);
		
		request.setAttribute("reInsert", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/board_jsp/AdminreInsert.jsp").forward(request, response);
	}
		

}
