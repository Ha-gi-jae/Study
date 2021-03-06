package kr.or.ddit.clboard.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.clboard.vo.PagingVO;
import kr.or.ddit.clboard.dao.BoardDaoImpl;
import kr.or.ddit.clboard.dao.IBoardDao;
import kr.or.ddit.clboard.vo.ClBoardVO;

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
	public List<ClBoardVO> groupByAllBoard(PagingVO pv) {
		List<ClBoardVO> list = null;
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
	public ClBoardVO selectBoard(int adminboard_id) {
		ClBoardVO bv = null;
		try {
			bv = dao.selectBoard(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}

	@Override
	public int InsertBoard(ClBoardVO bv) {
		int num = 0;
		try {
			num = dao.InsertBoard(bv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int updateBoard(ClBoardVO bv) {
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
	public int countView(int adminboard_id) {
		int chk = 0;
		try {
			chk = dao.countView(adminboard_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chk;
	}

	@Override
	public String selectClassId(String mem_id) {
		String classId = null;
		try {
			classId = dao.selectClassId(mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return classId;
	}

	@Override
	public List<ClBoardVO> findClTitle(PagingVO pv) {
		List<ClBoardVO> list = null;
		
		try {
			list = dao.findClTitle(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int findCltitleCount(String clboard_title) {
		int cnt =0;
		try {
			cnt = dao.findCltitleCount(clboard_title);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<ClBoardVO> findClContent(PagingVO pv) {
		List<ClBoardVO> list = null;
		
		try {
			list = dao.findClContent(pv);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int findclcontentCount(String clboard_content) {
		int cnt = 0;
		try {
			cnt = dao.findclcontentCount(clboard_content);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
}
