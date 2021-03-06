package kr.or.ddit.adminClass.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.adminClass.service.AdminClassServiceImpl;
import kr.or.ddit.adminClass.service.IAdminClassService;
import kr.or.ddit.adminClass.vo.AdminClassVO;

/**
 * Servlet implementation class InsertClass
 */
@WebServlet("/InsertClass.do")
public class InsertClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertClass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		AdminClassVO vo = new AdminClassVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IAdminClassService service = AdminClassServiceImpl.GetService();
		
		int cnt = service.insertClass(vo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/whole/admin/admin_jsp/result.jsp").forward(request, response);
	}

}
