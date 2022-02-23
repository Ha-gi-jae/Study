package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardService {
	
	public int insertBoard(BoardVO vo);
	
	public int updateBoard(int num, BoardVO vo);
	
	public int deleteBoard(int num);
	
	public List<BoardVO> displayAllBoard();
	
	public BoardVO checkBoard(BoardVO vo);
}
