package kr.or.ddit.cl.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.cl.service.ClassServiceImpl;
import kr.or.ddit.cl.service.IClassService;
import kr.or.ddit.cl.vo.ClassVO;

/**
 * Servlet implementation class InsertClass
 */
@WebServlet("/InsertClass")
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
		
		ClassVO vo = new ClassVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IClassService service = ClassServiceImpl.GetService();
		
		int cnt = service.insertClass(vo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("member/result.jsp").forward(request, response);
	}

}
