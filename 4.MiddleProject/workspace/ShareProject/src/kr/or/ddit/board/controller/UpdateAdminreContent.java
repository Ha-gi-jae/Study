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

import kr.or.ddit.board.service.AdminreServiceImpl;
import kr.or.ddit.board.service.IAdminreService;
import kr.or.ddit.board.vo.AdminreVO;

/**
 * Servlet implementation class UpdateAdminreContent
 */
@WebServlet("/UpdateAdminreContent.do")
public class UpdateAdminreContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminreContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String recontent = request.getParameter("recontent");
		int adminre_num = Integer.parseInt(request.getParameter("adminre_num"));
		String mem_id = (String) session.getAttribute("mem_id");
		
	    System.out.println("updatearvcontent:"+recontent);
		System.out.println("updatearvmem_id:"+mem_id);
		System.out.println("adminre_num:"+adminre_num );
		
		IAdminreService service = AdminreServiceImpl.getInstance();
		
		AdminreVO arv = new AdminreVO();
		
		arv.setAdminre_content(recontent);
		arv.setAdminre_num(adminre_num);
		
		int cnt = service.updateResponse(arv);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/whole/board/UpdateAdminreContent.jsp").forward(request, response);
		
		
		
		
		
		
	}

}
