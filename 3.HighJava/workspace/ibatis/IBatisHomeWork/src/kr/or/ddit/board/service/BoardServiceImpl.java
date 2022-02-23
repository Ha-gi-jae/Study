package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {
	
	private static IBoardService ibs;
	public BoardServiceImpl() {
	}
	
	public static IBoardService getInstance() {
		if(ibs==null) {
			ibs= new BoardServiceImpl();
		}
		return ibs;
	}
	
	IBoardDao bdi = BoardDaoImpl.getInstance();
	
	@Override
	public int insertBoard(BoardVO bv) {
		return bdi.insertBoard(bv);
	}

	@Override
	public int updateBoard(BoardVO bv) {
		return bdi.updateBoard(bv);
	}

	@Override
	public int deleteBoard(int num) {
		return bdi.deleteBoard(num);
	}

	@Override
	public List<BoardVO> displayAllBoard() {
		return bdi.displayAllBoard();
	}

	@Override
	public BoardVO selectBoard(BoardVO bv) {
		return bdi.selectBoard(bv);
	}

	@Override
	public BoardVO searchBoard(int num) {
		return bdi.searchBoard(num);
	}

}
