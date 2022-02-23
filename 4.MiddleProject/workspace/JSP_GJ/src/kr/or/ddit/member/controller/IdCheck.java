package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/idcheck")
public class IdCheck extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		IMemberService service = MemberServiceImpl.getService();
		MemberVO vo = new MemberVO();
		vo = service.idCheck(id);
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/IdCheck.jsp").forward(request, response);
	}

}
