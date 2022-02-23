package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public class BoardServiceImpl implements IBoardService {
	private static IBoardService service;
	private IBoardDao dao;

	public BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}

	public static IBoardService getInstance() {
		if (service == null)
			service = new BoardServiceImpl();
		return service;
	}

	@Override
	public int selectTotalCnt(String group) {
		int cnt = 0;
		try {
			cnt = dao.selectTotalCnt(group);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<BoardVO> groupByAllBoard(PagingVO pv) {
		List<BoardVO> list = null;
		try {
			list = dao.groupByAllBoard(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String getBoardTitle(String group) {
		String boardTitle = null;
		try {
			boardTitle = dao.getBoardTitle(group);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardTitle;
	}

	@Override
	public BoardVO selectBoard(int adminboard_id) {
		BoardVO bv = null;
		try {
			bv = dao.selectBoard(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}

	@Override
	public int InsertBoard(BoardVO bv) {
		int num = 0;
		try {
			num = dao.InsertBoard(bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int updateBoard(BoardVO bv) {
		int num = 0;
		try {
			num = dao.updateBoard(bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int deleteBoard(int adminboard_id) {
		int num = 0;
		try {
			num = dao.deleteBoard(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public String getClassEndDate(String mem_id) {
		String endDate = null;
		try {
			endDate = dao.getClassEndDate(mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return endDate;
	}

	@Override
	public List<NoticeVO> allNotiBoard(PagingVO pv) {
		List<NoticeVO> list=null;
		try {
			list = dao.allNotiBoard(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardVO> findBoTitle(PagingVO pv) {
		List<BoardVO> list = null;
		
		try {
			list = dao.findBoTitle(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BoardVO> findBoContent(PagingVO pv) {
		List<BoardVO> list = null;
		
		try {
			list = dao.findBoContent(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int findBotitleCount(String board_title) {
		int cnt =0;
		try {
			cnt = dao.findBotitleCount(board_title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int findBocontentCount(String board_content) {
		int cnt =0;
		try {
			cnt = dao.findBocontentCount(board_content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int countView(int adminboard_id) {
		int chk = 0;
		try {
			chk = dao.countView(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}
}
