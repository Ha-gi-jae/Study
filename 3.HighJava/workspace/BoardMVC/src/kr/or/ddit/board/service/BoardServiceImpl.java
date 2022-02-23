package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {
	
	private static IBoardService service;
	
	private BoardServiceImpl() {
	}
	
	public static IBoardService getService() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}
	
	IBoardDao dao = BoardDaoImpl.getDao();

	@Override
	public int insertBoard(BoardVO vo) {
		return dao.insertBaord(vo);
	}

	@Override
	public int updateBoard(int num, BoardVO vo) {
		return dao.updateBoard(num, vo);
	}

	@Override
	public int deleteBoard(int num) {
		return dao.deleteBoard(num);
	}

	@Override
	public List<BoardVO> displayAllBoard() {
		return dao.displayAllBoard();
	}

	@Override
	public BoardVO checkBoard(BoardVO vo) {
		return dao.checkBoard(vo);
	}
}
