package com.hgj.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hgj.command.SearchCriteria;
import com.hgj.dto.NoticeVO;

public interface NoticeDAO {
	
	List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws Exception;
	
	int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws Exception;
	
	List<NoticeVO> selectPointNoticeList(SqlSession session) throws Exception;
	
	NoticeVO selectNoticeByNo(SqlSession session, int no) throws Exception;
	
	void insertNotice(SqlSession session, NoticeVO notice) throws Exception;
}
