package kr.or.ddit.basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿을 이용한 파라미터 데이터 처리 예제
 * @author PC-06
 *
 */
public class T03_ServletParameterTest extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	/*
		요청 객체로부터 파라미터 데이터를 가져오는 방법
		
		 - getParameter() - 파라미터값이 한개인 경우에 사용됨.
		 - getParameterValues() - 파라미터값이 여러개인 경우에 사용함. ex) checkbox
		 - getParameterNames() - request에 존재하는 모든 파라미터 정보를 가져올때 사용함.
	 */
//		req.setCharacterEncoding("utf-8");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String hobby = req.getParameter("hobby");
		String rlgn = req.getParameter("rlgn");
		String[] foods = req.getParameterValues("food");
		
		//resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<p>username : " + username + "</p>");
		out.println("<p>password : " + password + "</p>");
		out.println("<p>gender : " + gender + "</p>");
		out.println("<p>hobby : " + hobby + "</p>");
		out.println("<p>rlgn : " + rlgn + "</p>");
		
		if(foods != null) {
			for(String food : foods) {
				out.println("<p>food : " + food + "</p>");
			}
		}
		
		Enumeration<String> params = req.getParameterNames();
		
		while(params.hasMoreElements()) {
			String param = params.nextElement();
			out.println("<p>파라미터 이름 : " + param + "</p>");
		}
		
		out.println("</body>");
		out.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
