package com.hgj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.command.MemberRegistCommand;
import com.hgj.dao.MemberDAO;
import com.hgj.dao.MemberDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.MemberVO;
import com.hgj.service.MemberService;
import com.hgj.service.MemberServiceImpl;
import com.hgj.service.SearchMemberServiceImpl;

public class MemberRegistServlet extends HttpServlet {
	
	private MemberService memberService;

	{
		memberService = new SearchMemberServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		MemberDAO memberDAO = new MemberDAOImpl();
		((MemberServiceImpl)memberService).setMemberDAO(memberDAO);
		((MemberServiceImpl)memberService).setSqlSessionFactory(factory);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/regist.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/member/regist_success.jsp";

		MemberVO member = null;
		
		try {
			MemberRegistCommand regData = (MemberRegistCommand) HttpRequestParameterAdapter.execute(request, MemberRegistCommand.class);
			
			member = regData.toMemberVO();
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_BAD_REQUEST);
		}
		
		try {
			memberService.regist(member);
		}catch (Exception e) {
			e.printStackTrace();
			url = "/member/regist_fail";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
