package com.hgj.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.dao.NoticeDAO;
import com.hgj.dao.NoticeDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.NoticeVO;
import com.hgj.service.NoticeService;
import com.hgj.service.NoticeServiceImpl;

public class NoticeDetailServlet extends HttpServlet {

	private NoticeService noticeService;
	{
		noticeService = new NoticeServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		NoticeDAO noticeDAO = new NoticeDAOImpl();
		((NoticeServiceImpl)noticeService).setNoticeDAO(noticeDAO);
		((NoticeServiceImpl)noticeService).setSqlSessionFactory(factory);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/notice/detail.jsp";
		
		int no =  Integer.parseInt(request.getParameter("no"));
		
		NoticeVO notice = null;
		
		try {
			notice = noticeService.getNoticeDetail(no);
			request.setAttribute("notice", notice);
		}catch (Exception e) {
			e.printStackTrace();
			url = "/notice/detail_fail.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
