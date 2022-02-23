package kr.or.ddit.comp.service;

import java.util.List;

import kr.or.ddit.comp.vo.CompPagingVO;
import kr.or.ddit.comp.vo.CompVO;

public interface ICompService {
	public List<CompVO> selectAll();
	
	public List<CompVO> selectPage(CompPagingVO vo);
	
	public CompVO selectOne(int adminboard_id);
	
	public int countComp();
	
	public int insertComp(CompVO vo);
	
	public int updateComp(CompVO vo);
	
	public int delteComp(int adminboard_id);
	
	public List<CompVO> findCmTitle (CompPagingVO cv);
	
	public int findCmtitleCount(String comp_name);


	/**
	 * 게시글을 불러오기전 view 카운트하는 메서드
	 * @param adminboard_id
	 * @return
	 */
	public int countView(int adminboard_id);
}
