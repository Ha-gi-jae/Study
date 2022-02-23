package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.service.IMemberService;

@WebServlet("/deletemember")
public class DeleteMember extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		IMemberService service = MemberServiceImpl.getService();
		
		int cnt = 0;
		
		String chk = request.getParameter("chk");
		
		String[] num = chk.split(",");
		
		for(int i = 0; i < num.length; i++) {
			String mem_id = num[i];
			cnt = service.deleteMember(mem_id);
		}
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("/result.jsp").forward(request, response);
	}

}
