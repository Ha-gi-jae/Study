package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.INotiBoardDao;
import kr.or.ddit.board.dao.NotiBoardDaoImpl;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public class NotiBoardServiceImpl implements INotiBoardService{
	private static INotiBoardService service;
	private INotiBoardDao dao;
	
	private NotiBoardServiceImpl() {
		dao = NotiBoardDaoImpl.getInstance();
	}
	
	public static INotiBoardService getInstance() {
		if(service==null) {
			service = new NotiBoardServiceImpl();
		}
		return service;
	}
	
	
	
	@Override
	public int insertNotice(NoticeVO nv) {
		int cnt =0;
		
		try {
			cnt = dao.insertNotice(nv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int noticeSize() {
		int cnt =0;
		
		try {
			cnt = dao.noticeSize();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public NoticeVO selectNotiBoard(int adminboard_id) {
		NoticeVO nv = null;
		
		try {
			nv = dao.selectNotiBoard(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nv;
	}

	@Override
	public int noticeUpdate(NoticeVO nv) {
		int cnt =0;
		try {
			cnt = dao.noticeUpdate(nv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int NoticeDelete(int adminboard_id) {
		int cnt =0;
		
		try {
			cnt = dao.NoticeDelete(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<NoticeVO> findTitle(PagingVO pv) {
		List<NoticeVO> list = null;
		
		try {
			list = dao.findTitle(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<NoticeVO> findContent(PagingVO pv) {
		List<NoticeVO> list = null;
		try {
			list = dao.findContent(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int findtitleCount(String notice_title) {
		int cnt =0;
		
		try {
			cnt = dao.findtitleCount(notice_title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int findcontentCount(String notice_content) {
int cnt =0;
		
		try {
			cnt = dao.findcontentCount(notice_content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	
	}

}
