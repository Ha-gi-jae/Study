package com.hgj.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

public class MemberIdCheckServlet extends HttpServlet {

	private MemberService memberService;
	{
		memberService = new SearchMemberServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		MemberDAO memberDAO = new MemberDAOImpl();
		((MemberServiceImpl)memberService).setMemberDAO(memberDAO);
		((MemberServiceImpl)memberService).setSqlSessionFactory(factory);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		
		String resultStr = "";
		
		String id = request.getParameter("id");
		
		response.setContentType("text/plain;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			MemberVO member = memberService.getMember(id);
			
			if(member != null) {
				resultStr = "DUPLICATED";
			}
			out.print(resultStr);
		}catch (Exception e) {
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
		}finally {
			out.close();
		}
	}

}
