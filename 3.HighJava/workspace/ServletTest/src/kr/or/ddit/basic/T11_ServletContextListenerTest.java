package kr.or.ddit.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class T11_ServletContextListenerTest extends HttpServlet { 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getServletContext().setAttribute("ATTR1", "속성1");
		req.getServletContext().setAttribute("ATTR1", "속성11");
		req.getServletContext().setAttribute("ATTR2", "속성2");
		req.getServletContext().setAttribute("ATTR3", "속성3");
		req.getServletContext().setAttribute("ATTR4", "속성4");
		
		// this. 생략 가능하다.
		this.getServletContext().removeAttribute("ATTR1");
	}
	
}
