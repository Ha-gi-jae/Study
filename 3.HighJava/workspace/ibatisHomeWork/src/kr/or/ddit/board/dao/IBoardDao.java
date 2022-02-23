package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {
	
	public int insertBoard(BoardVO bv);
	
	public int updateBoard(BoardVO bv);
	
	public int deleteBoard(int num);
	
	public List<BoardVO> displayAllBoard();
	
	public BoardVO selectBoard(BoardVO bv);
	
	public BoardVO searchBoard(int num);

}
