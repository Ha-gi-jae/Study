package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;

@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println(id);
		IAdminService service = AdminServiceImpl.GetService();
		
		AdminVO vo = new AdminVO();
		
		vo = service.idCheck(id);
		System.out.println(vo+"ㅁㄴㅇ럼ㄴ애ㅑㄻ냐ㅐㅇ룬ㅁ랴ㅐ");
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/admin/admin_jsp/IdCheck.jsp").forward(request, response);
	}

}
