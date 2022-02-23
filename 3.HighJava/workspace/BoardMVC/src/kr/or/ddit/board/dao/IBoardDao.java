package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {
	
	public int insertBaord(BoardVO vo);
	
	public int updateBoard(int num, BoardVO vo);
	
	public int deleteBoard(int num);
	
	public List<BoardVO> displayAllBoard();
	
	public BoardVO checkBoard(BoardVO vo);
}
