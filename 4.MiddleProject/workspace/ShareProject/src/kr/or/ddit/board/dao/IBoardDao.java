package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public interface IBoardDao {
	/**
	 * 페이징을 위한 메서드
	 * @param group 게시판 구분
	 * @return 게시글 전체 갯수
	 * @throws SQLException
	 */
	public int selectTotalCnt(String group) throws SQLException;
	
	/**
	 * group별 모든 페이지를 페이징해서 불러오는 메서드
	 * @param pv
	 * @return
	 */
	public List<BoardVO> groupByAllBoard(PagingVO pv) throws SQLException;
	
	/**
	 * 해당 group의 title을 불러오는 메서드
	 * @param group
	 * @return
	 */
	public String getBoardTitle(String group) throws SQLException;
	
	/**
	 * 선택한 페이지 정보를 불러오는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public BoardVO selectBoard(int adminboard_id) throws SQLException;
	
	/**
	 * 게시판에 글 등록하는 메서드
	 * @param bv
	 * @return
	 */
	public int InsertBoard(BoardVO bv) throws SQLException;
	
	/**
	 * 게시판을 수정하기 위한 메서드
	 * @param bv
	 * @return
	 */
	public int updateBoard(BoardVO bv) throws SQLException;
	
	/**
	 * 게시판을 삭제하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int deleteBoard(int adminboard_id) throws SQLException;
	
	/**
	 * mem_id로 class endDate를 가져오는 메서드
	 * @param mem_id
	 * @return
	 */
	public String getClassEndDate(String mem_id) throws SQLException;
	
	/**
	 * 공지사항 게시판 리스트 가져오는 메서드
	 * @param pv
	 * @return
	 */
	public List<NoticeVO> allNotiBoard(PagingVO pv) throws SQLException;
	
	//검색////////////////////////////////////////////////////////////////
	
	//제목검색
	public List<BoardVO> findBoTitle(PagingVO pv) throws SQLException;
	
	public int findBotitleCount(String board_title) throws SQLException;
	
	//내용검색
	public List<BoardVO> findBoContent(PagingVO pv) throws SQLException;
	
	public int findBocontentCount(String board_content) throws SQLException;
	
	/**
	 * 게시글을 불러오기전 view 카운트하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int countView(int adminboard_id) throws SQLException;
	
}
