package com.hgj.controller;

import java.io.IOException;
import java.util.List;

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

public class MemberListServlet extends HttpServlet {

	private MemberService memberService;
	
	{
		memberService = new MemberServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		MemberDAO memberDAO = new MemberDAOImpl();
		((MemberServiceImpl)memberService).setMemberDAO(memberDAO);
		((MemberServiceImpl)memberService).setSqlSessionFactory(factory);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/list.jsp";
		try {
			List<MemberVO> memberList = memberService.getMemberList();
			System.out.println(memberList);
			request.setAttribute("memberList", memberList);
		}catch (Exception e) {
			url = "/error/500.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
