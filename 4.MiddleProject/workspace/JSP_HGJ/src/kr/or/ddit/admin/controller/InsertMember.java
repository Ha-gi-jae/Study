package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;

@WebServlet("/InsertMember.do")
public class InsertMember extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		AdminVO vo = new AdminVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		if(vo.getPicture() == null || vo.getPicture().equals("")) {
			vo.setPicture("noImage.jpg");
		}
		if(vo.getPhone() == null || vo.getPhone().equals("")) {
			vo.setPhone("01012345678");
		}
		if(vo.getName() == null || vo.getName().equals("")) {
			vo.setName("홍길동");
		}
		if(vo.getRegister() == null || vo.getRegister().equals("")) {
			vo.setRegister("mimi");
		}
		if(vo.getAuthority() == null || vo.getAuthority().equals("")) {
			vo.setAuthority("ROLE_USER");
		}
		
		System.out.println(vo.getRegdate());
		IAdminService service = AdminServiceImpl.GetService();
		
		int cnt = service.insertMember(vo);
		
		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher("admin/admin_jsp/result.jsp").forward(request, response);
	}

}
