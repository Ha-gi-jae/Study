package kr.or.ddit.main.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.clboard.vo.ClBoardVO;
import kr.or.ddit.main.dao.IMiniDao;
import kr.or.ddit.main.dao.MiniDao;

public class MiniService implements IMIniService{

	private IMiniDao dao;
	public static IMIniService service;
	
	private MiniService() {
		dao = MiniDao.getInstance();
	}
	
	public static IMIniService getInstance() {
		if(service == null) {
			service = new MiniService();
		}
		return service;
	}
	
	@Override
	public List<NoticeVO> notiMini() {
		List<NoticeVO> notiList = null;
		try {
			notiList = dao.notiMini();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return notiList;
	}

	@Override
	public List<BoardVO> freeMini() {
		List<BoardVO> freeList = null;
		try {
			freeList = dao.freeMini();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return freeList;
	}

	@Override
	public List<ClBoardVO> clFreeMini() {
		List<ClBoardVO> clFreeList = null;
		try {
			clFreeList = dao.clFreeMini();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clFreeList;
	}

	@Override
	public List<ClBoardVO> clNotiMini() {
		List<ClBoardVO> clNotiList = null;
		try {
			clNotiList = dao.clNotiMini();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clNotiList;
	}

	@Override
	public List<ClBoardVO> clQnaMini() {
		List<ClBoardVO> clQnaList = null;
		try {
			clQnaList = dao.clQnaMini();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return clQnaList;
	}

}
