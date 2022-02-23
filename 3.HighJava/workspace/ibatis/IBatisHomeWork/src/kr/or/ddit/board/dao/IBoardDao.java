package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDao {
	
	//게시판 등록
	public int insertBoard(BoardVO bv);
	
	//게시판 수정
	public int updateBoard(BoardVO bv);
	
	//게시판 삭제
	public int deleteBoard(int num);
	
	//전체 게시판 조회
	public List<BoardVO> displayAllBoard();
	
	//특정 게시판 조회
	public BoardVO selectBoard(BoardVO bv);
	
	public BoardVO searchBoard(int num);
	
}
