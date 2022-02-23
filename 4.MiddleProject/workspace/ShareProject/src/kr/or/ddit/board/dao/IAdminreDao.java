package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.AdminreVO;

public interface IAdminreDao {
	//관리자 답글 등록
	public int insertAdminre(AdminreVO av) throws SQLException;
	
	//답글 조회
	public List<AdminreVO> selectResponse(int adminboard_id) throws SQLException;
	
	//mem_id조회
	public String selectmemId(int adminboard_id) throws SQLException;
	
	//답글 수정
	public int updateResponse(AdminreVO arv) throws SQLException;
	
	//답글 삭제
	public int deleteResponse(int adminre_num) throws SQLException;
}
