package com.hgj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.dao.MemberDAO;
import com.hgj.dao.MemberDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.MemberVO;
import com.hgj.service.MemberService;
import com.hgj.service.MemberServiceImpl;
import com.hgj.service.SearchMemberServiceImpl;

public class MemberDetailServlet extends HttpServlet {

	private MemberService memberService;
	
	{
		memberService = new SearchMemberServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		MemberDAO memberDAO = new MemberDAOImpl();
		((MemberServiceImpl)memberService).setMemberDAO(memberDAO);
		((MemberServiceImpl)memberService).setSqlSessionFactory(factory);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "/member/detail.jsp";

		String id = request.getParameter("id");
		
		MemberVO member = null;
		
		try {
			member = memberService.getMember(id);
			request.setAttribute("member", member);
		}catch (Exception e) {
			e.printStackTrace();
			url = "/member/detail_fail.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
