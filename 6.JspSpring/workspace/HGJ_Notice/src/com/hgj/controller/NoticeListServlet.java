package com.hgj.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.command.Criteria;
import com.hgj.command.SearchCriteria;
import com.hgj.dao.NoticeDAO;
import com.hgj.dao.NoticeDAOImpl;
import com.hgj.dataSource.OracleMyBatisSqlSessionFactory;
import com.hgj.dto.NoticeVO;
import com.hgj.exception.NotNumberException;
import com.hgj.service.NoticeService;
import com.hgj.service.NoticeServiceImpl;

public class NoticeListServlet extends HttpServlet {

	private NoticeService noticeService;
	{
		noticeService = new NoticeServiceImpl();
		SqlSessionFactory factory = new OracleMyBatisSqlSessionFactory();
		NoticeDAO noticeDAO = new NoticeDAOImpl();
		((NoticeServiceImpl)noticeService).setNoticeDAO(noticeDAO);
		((NoticeServiceImpl)noticeService).setSqlSessionFactory(factory);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/notice/list.jsp";
		
		String pageParam = request.getParameter("page");
		String perPageNumParam = request.getParameter("perPageNum");
		String searchTypeParam = request.getParameter("searchType");
		String keywordParam = request.getParameter("keyword");
		
		try {
			Criteria cri = null;
			if(pageParam != null && perPageNumParam != null) {
				cri = new SearchCriteria(pageParam, perPageNumParam, searchTypeParam, keywordParam);
			}else {
				cri = new SearchCriteria();
			}
			
			Map<String, Object> dataMap = noticeService.getNoticeListPage(cri);
			List<NoticeVO> pointNotice = noticeService.getPointNoticeList();
			
			request.setAttribute("dataMap", dataMap);
			request.setAttribute("pointNotice", pointNotice);
			
		}catch (NotNumberException e) {
			request.setAttribute("exception", e);
			url = "/error/message.jsp";
		}catch (Exception e) {
			request.setAttribute("exception", e);
			url = "/error/500.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
