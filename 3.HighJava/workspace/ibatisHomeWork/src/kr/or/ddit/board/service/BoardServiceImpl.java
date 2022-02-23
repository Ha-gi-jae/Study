package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {

	private static IBoardService service;

	public BoardServiceImpl() {
		
	}
	
	public static IBoardService getService() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}
	
	IBoardDao dao = BoardDaoImpl.GetDao();

	@Override
	public int insertBoard(BoardVO bv) {
		return dao.insertBoard(bv);
	}

	@Override
	public int updateBoard(BoardVO bv) {
		return dao.updateBoard(bv);
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
	public BoardVO selectBoard(BoardVO bv) {
		return dao.selectBoard(bv);
	}

	@Override
	public BoardVO searchBoard(int num) {
		return dao.searchBoard(num);
	}
}
