package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IBoardService {

	/**
	 * 페이징을 위한 메서드
	 * @param group 게시판 구분
	 * @return 게시글 전체 갯수
	 */
	public int selectTotalCnt(String group);
	
	/**
	 * group별 모든 페이지를 페이징해서 불러오는 메서드
	 * @param pv
	 * @return
	 */
	public List<BoardVO> groupByAllBoard(PagingVO pv);
	
	/**
	 * 해당 group의 title을 불러오는 메서드
	 * @param group
	 * @return
	 */
	public String getBoardTitle(String group);

	
	/**
	 * 선택한 페이지 정보를 불러오는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public BoardVO selectBoard(int adminboard_id);

	/**
	 * 게시판에 글 등록하는 메서드
	 * @param bv
	 * @return
	 */
	public int InsertBoard(BoardVO bv);

	/**
	 * 게시판을 수정하기 위한 메서드
	 * @param bv
	 * @return
	 */
	public int updateBoard(BoardVO bv);

	/**
	 * 게시판을 삭제하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int deleteBoard(int adminboard_id);

	/**
	 * mem_id로 class endDate를 가져오는 메서드
	 * @param mem_id
	 * @return
	 */
	public String getClassEndDate(String mem_id);

	/**
	 * 공지사항 게시판 리스트 가져오는 메서드
	 * @param pv
	 * @return
	 */
	public List<NoticeVO> allNotiBoard(PagingVO pv);
	
	
	//제목검색
	public List<BoardVO> findBoTitle(PagingVO pv);
	
	public int findBotitleCount(String board_title); 
		
	//내용검색
	public List<BoardVO> findBoContent(PagingVO pv);
	
	public int findBocontentCount(String board_content);

	/**
	 * 게시글을 불러오기전 view 카운트하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int countView(int adminboard_id);
	
}
