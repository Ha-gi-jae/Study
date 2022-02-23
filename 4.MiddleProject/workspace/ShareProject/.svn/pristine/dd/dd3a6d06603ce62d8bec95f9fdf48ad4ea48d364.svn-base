package kr.or.ddit.cal.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.DateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.cal.service.CalServiceImpl;
import kr.or.ddit.cal.service.ICalService;
import kr.or.ddit.cal.vo.CalVO;

/**
 * Servlet implementation class CalInsert
 */
@WebServlet("/CalInsert.do")
public class CalInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		CalVO vo = new CalVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		vo.setItt_start(vo.getItt_start().replaceAll("-", "").replaceAll("T", "").replaceAll(":", ""));
		vo.setItt_end(vo.getItt_end().replaceAll("-", "").replaceAll("T", " ").replaceAll(":", ""));
		
		ICalService service = CalServiceImpl.getInstance();
		
		int cnt = service.calInsert(vo);
		
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/WEB-INF/whole/cal_jsp/result.jsp").forward(request, response);
		
	}

}
