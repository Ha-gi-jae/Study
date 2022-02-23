package com.hgj.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hgj.command.SearchCriteria;
import com.hgj.dto.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {

	@Override
	public List<NoticeVO> selectSearchNoticeList(SqlSession session, SearchCriteria cri) throws Exception {
		int offset = cri.getStratRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> NoticeList = session.selectList("Notice-Mapper.selectSearchNoticeList", cri, rowBounds);
		return NoticeList;
	}

	@Override
	public int selectSearchNoticeListCount(SqlSession session, SearchCriteria cri) throws Exception {
		int count = 0;
		count = session.selectOne("Notice-Mapper.selectSearchNoticeListCount", cri);
		return count;
	}

	@Override
	public List<NoticeVO> selectPointNoticeList(SqlSession session) throws Exception {
		List<NoticeVO> NoticeList = session.selectList("Notice-Mapper.selectPointNoticeList");
		return NoticeList;
	}

	@Override
	public NoticeVO selectNoticeByNo(SqlSession session, int no) throws Exception {
		NoticeVO notice = session.selectOne("Notice-Mapper.selectNoticeByNo", no);
		return notice;
	}

	@Override
	public void insertNotice(SqlSession session, NoticeVO notice) throws Exception {
		session.insert("Notice-Mapper.insertNotice", notice);
	}

}
