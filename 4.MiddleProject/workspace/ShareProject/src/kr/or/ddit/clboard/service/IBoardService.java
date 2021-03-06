package kr.or.ddit.clboard.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.clboard.vo.PagingVO;
import kr.or.ddit.clboard.vo.ClBoardVO;

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
	public List<ClBoardVO> groupByAllBoard(PagingVO pv);
	
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
	public ClBoardVO selectBoard(int adminboard_id);

	/**
	 * 게시판에 글 등록하는 메서드
	 * @param bv
	 * @return
	 */
	public int InsertBoard(ClBoardVO bv);

	/**
	 * 게시판을 수정하기 위한 메서드
	 * @param bv
	 * @return
	 */
	public int updateBoard(ClBoardVO bv);

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
	 * 게시글을 불러오기전 view 카운트하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int countView(int adminboard_id);
	
	/**
	 * 게시글을 등록하기 전에 class_id를 가져 오는 메서드
	 * @param mem_id
	 * @return
	 */
	public String selectClassId(String mem_id);
	
	///검색
	public List<ClBoardVO> findClTitle(PagingVO pv);
	
	public int findCltitleCount(String clboard_title);
	
	public List<ClBoardVO> findClContent(PagingVO pv);
	
	public int findclcontentCount(String clboard_content);
}
