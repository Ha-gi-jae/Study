package kr.or.ddit.comp.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.comp.vo.CompPagingVO;
import kr.or.ddit.comp.vo.CompVO;

public interface ICompDao {
	public List<CompVO> selectAll() throws SQLException;
	
	public CompVO selectOne(int adminboard_id) throws SQLException;
	
	public List<CompVO> selectPage(CompPagingVO vo) throws SQLException;
	
	public int countComp() throws SQLException;
	
	public int insertComp(CompVO vo) throws SQLException;
	
	public int updateComp(CompVO vo) throws SQLException;
	
	public int delteComp(int adminboard_id) throws SQLException;
	
	public List<CompVO> findCmTitle (CompPagingVO cv) throws SQLException;
	
	public int findCmtitleCount(String comp_name) throws SQLException;

	/**
	 * 게시글을 불러오기전 view 카운트하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int countView(int adminboard_id) throws SQLException;
	
}
