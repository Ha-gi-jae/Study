package com.hgj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hgj.command.Criteria;
import com.hgj.command.PageMaker;
import com.hgj.command.SearchCriteria;
import com.hgj.dao.NoticeDAO;
import com.hgj.dto.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	protected SqlSessionFactory sqlSessionFactory;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	protected NoticeDAO noticeDAO;
	
	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	
	@Override
	public Map<String, Object> getNoticeListPage(Criteria cri) throws Exception {
		
		SearchCriteria searchCri = (SearchCriteria)cri;
		
		SqlSession session = sqlSessionFactory.openSession(false);
		Map<String, Object> dataMap = null;
		
		List<NoticeVO> noticeList = null;
		PageMaker pageMaker = null;
		try {
			noticeList = noticeDAO.selectSearchNoticeList(session, searchCri);
			pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticeDAO.selectSearchNoticeListCount(session, searchCri));
			dataMap = new HashMap<String, Object>();
			dataMap.put("noticeList", noticeList);
			dataMap.put("pageMaker", pageMaker);
			session.commit();
			return dataMap;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
	}

	@Override
	public List<NoticeVO> getPointNoticeList() throws Exception {
		SqlSession session = sqlSessionFactory.openSession(false);
		
		List<NoticeVO> noticeList = null;
		
		try {
			noticeList = noticeDAO.selectPointNoticeList(session);
			session.commit();
			return noticeList;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
	}

	@Override
	public NoticeVO getNoticeDetail(int no) throws Exception {
		SqlSession session = sqlSessionFactory.openSession(false);
		
		NoticeVO notice = null;
		
		try {
			notice = noticeDAO.selectNoticeByNo(session, no);
			session.commit();
			return notice;
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			throw e;
		}finally {
			session.close();
		}
	}

}
