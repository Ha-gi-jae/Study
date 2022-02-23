package com.java.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.dto.MemberVO;

/**
 * Servlet implementation class InObject
 */
@WebServlet("/inObject")
public class InObject extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		
		request.setAttribute("msg", "캔디");
		request.setAttribute("msg", "사탕");
		session.setAttribute("msg", "밀크");
		application.setAttribute("msg", "우유");
		
//	 	String pagestr = (String) pageContext.getAttribute("msg");
//	 	out.println(pagestr);
//	 	out.println(pageContext.getAttribute("msg")//.toString());

		Map<String,String> dataMap = new HashMap<String,String>();
		dataMap.put("girlGroup", "소녀시대");
		
		request.setAttribute("dataMap", dataMap);
		
		MemberVO member = new MemberVO();
		member.setId("mimi");
		member.setPwd("mimi");
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("/inObject.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
